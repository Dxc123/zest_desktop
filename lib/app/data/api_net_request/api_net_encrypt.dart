import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';
import 'package:pointycastle/export.dart';

import '../services/app_my_info_service.dart';

class ApiNetEncrypt{
  // 压缩
  String zipStr(String str) {
    return base64Encode(zlib.encode(utf8.encode(str)));
  }

  // 解压缩
  String unZipStr(String str) {
    final Uint8List decodeString = base64Decode(str);
    final List<int> zLibDecode = zlib.decode(decodeString);
    return utf8.decode(zLibDecode);
  }

  /// 加密
  String encryptAes(String content) {
    final String key = AppMyInfoService.to.config?.publicKey ?? "";
    if (key.isEmpty) {
      return content;
    }
// AppLogTool.debugDio("encryptAes start");
    final String aesKey = "${'-----BEGIN PUBLIC KEY-----\n$key'}\n-----END PUBLIC KEY-----";

    final RSAPublicKey aesPublicKey = RSAKeyParser().parse(aesKey) as RSAPublicKey;
    final Encrypter encrypted = Encrypter(RSA(publicKey: aesPublicKey));

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
      totalBytes.addAll(encrypted.encryptBytes(item).bytes);
    }
    return base64.encode(totalBytes);
  }
}
