import '../../../product/domain/entities/product.dart';

enum MessageType { user, bot }

class ChatMessage {
  final String text;
  final MessageType type;
  final DateTime timestamp;
  final List<Product>? products;
  bool isAnimated;

  ChatMessage({
    required this.text,
    required this.type,
    required this.timestamp,
    this.products,
    this.isAnimated = false,
  });
}
