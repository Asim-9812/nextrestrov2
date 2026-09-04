import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/chat_message.dart';

abstract class ChatRepository {
  Future<Either<Failure, ChatMessage>> sendChatMessage(String message, String model);
}
