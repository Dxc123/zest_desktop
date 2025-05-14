/// 错误体信息
class ErrorMessageModel {
  ErrorMessageModel({this.statusCode, this.error, this.message});
  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      statusCode: json['statusCode'] as int?,
      error: json['error'] as String?,
      message: json['message'] as String?,
    );
  }
  int? statusCode;
  String? error;
  String? message;
  Map<String, dynamic> toJson() => {
    'statusCode': statusCode,
    'error': error,
    'message': message,
  };
}