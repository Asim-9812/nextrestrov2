import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/chat_message.dart';
import '../../domain/repositories/chat_repository.dart';
import '../datasources/chat_remote_data_source.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteDataSource;

  ChatRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, ChatMessage>> sendChatMessage(String message, String model) async {
    try {
      final response = await remoteDataSource.sendChatMessage(message, model);
      if (response.success) {
        return Right(ChatMessage(
          text: response.data.answer,
          type: MessageType.bot,
          timestamp: DateTime.now(),
          products: response.data.products,
        ));
      } else {
        return Left(ServerFailure(response.message));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
