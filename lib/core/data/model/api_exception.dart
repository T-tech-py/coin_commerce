class ApiException implements Exception {
  final String message;
  final String title;
  final String? logs;
static const kmessage = 'Something went wrong, Please try again later';
  ApiException({
    this.title = 'message error',
    this.message = kmessage,
    this.logs,
  }) : super();

  factory ApiException.fromJson(Map<dynamic, dynamic> json) {
    var message = json['message'] ?? json;
    message = message ?? kmessage;
    final title = json['title'] ?? 'message error';
    print('messageEx: $message');
    return ApiException(title: title, message: message);
  }
}