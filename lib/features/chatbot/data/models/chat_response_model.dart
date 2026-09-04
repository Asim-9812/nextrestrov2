import '../../../product/data/models/product_model.dart';

class ChatResponseModel {
  final bool success;
  final int statusCode;
  final String message;
  final ChatDataModel data;

  ChatResponseModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory ChatResponseModel.fromJson(Map<String, dynamic> json) {
    return ChatResponseModel(
      success: json['success'] ?? false,
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
      data: ChatDataModel.fromJson(json['data'] ?? {}),
    );
  }
}

class ChatDataModel {
  final String type;
  final String answer;
  final bool shouldBookAppointment;
  final bool readyToBook;
  final List<ProductModel> products;

  ChatDataModel({
    required this.type,
    required this.answer,
    required this.shouldBookAppointment,
    required this.readyToBook,
    required this.products,
  });

  factory ChatDataModel.fromJson(Map<String, dynamic> json) {
    return ChatDataModel(
      type: json['type'] ?? '',
      answer: json['answer'] ?? '',
      shouldBookAppointment: json['shouldBookAppointment'] ?? false,
      readyToBook: json['readyToBook'] ?? false,
      products: (json['products'] as List? ?? [])
          .map((i) => ProductModel.fromJson(i))
          .toList(),
    );
  }
}
