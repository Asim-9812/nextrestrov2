import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/chat_message.dart';
import '../repositories/chat_repository.dart';

class SendChatMessage {
  final ChatRepository repository;

  SendChatMessage(this.repository);

  Future<Either<Failure, ChatMessage>> call(String message, String model) async {
    return await repository.sendChatMessage(message, model);
  }
}
