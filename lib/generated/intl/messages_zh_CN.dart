// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_CN locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final MessageLookup messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'zh_CN';

  final Map<String, Function> messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "login": MessageLookupByLibrary.simpleMessage("登录"),
        "logout": MessageLookupByLibrary.simpleMessage("注销"),
        "sign_in": MessageLookupByLibrary.simpleMessage("注册"),
        "sign_in_apple": MessageLookupByLibrary.simpleMessage("用 Apple 登录"),
        "sign_in_fb": MessageLookupByLibrary.simpleMessage("用 Facebook 登录"),
        "sign_in_google": MessageLookupByLibrary.simpleMessage("用 Google 登录")
      };
}
