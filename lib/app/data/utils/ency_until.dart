import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';
import 'package:flutter/cupertino.dart';
import 'package:pointycastle/asymmetric/api.dart' show RSAPublicKey;

import '../services/app_my_info_service.dart';

class RaSafeEncryptUtils {
  /// 加密
  static dynamic encryptAes(String content, {AESMode aesMode = AESMode.ecb}) {
    debugPrint("encryptAes start");
    final String aesKey = "${"-----BzEGIN PUBLIC KEY-----\n${AppMyInfoService.to.config?.publicKey ?? ""}"}\n-----END PUBLIC KEY-----";

    final RSAPublicKey aesPublicKey = RSAKeyParser().parse(aesKey) as RSAPublicKey;
    final Encrypter encrypter = Encrypter(RSA(publicKey: aesPublicKey));

    final List<int> sourceBytes = utf8.encode(content);
    final int inputLen = sourceBytes.length;
    const int maxLen = 117;
    final List<int> totalBytes = <int>[];
    for (int i = 0; i < inputLen; i += maxLen) {
      final int endLen = inputLen - i;
      List<int> item;
      if (endLen > maxLen) {
        item = sourceBytes.sublist(i, i + maxLen);
      } else {
        item = sourceBytes.sublist(i, i + endLen);
      }
      totalBytes.addAll(encrypter.encryptBytes(item).bytes);
    }
    return base64.encode(totalBytes);
  }

  static String encryptPara(Map para, {bool encry = true}) {
    final String paraJsonString = const JsonEncoder().convert(para);
    final List<int> compressPara = zlib.encode(utf8.encode(paraJsonString));
    final String compressParaBase64 = base64Encode(compressPara);

    final sendPara = encry == true ? RaSafeEncryptUtils.encryptAes(compressParaBase64) : compressParaBase64;

    // AppLogTool.debug("encryptAes end");

    return sendPara ?? "";
  }

  static String decodeEncryptPara(dynamic data, {bool encry = true}) {
    if (data is String) {
      final Uint8List compressParaBase64 = base64Decode(data);
      final String paraData = utf8.decode(zlib.decode(compressParaBase64));
      return paraData;
    } else if (encry == true) {
      return "解析错误:encrypt反解析忽略";
    }

    return "解析错误";
  }
}
