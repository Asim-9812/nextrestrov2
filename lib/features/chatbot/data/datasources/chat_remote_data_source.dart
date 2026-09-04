import '../../../../core/network/dio_client.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/chat_response_model.dart';

abstract class ChatRemoteDataSource {
  Future<ChatResponseModel> sendChatMessage(String message, String model);
}

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final DioClient _dioClient;

  ChatRemoteDataSourceImpl(this._dioClient);

  @override
  Future<ChatResponseModel> sendChatMessage(String message, String model) async {
    try {
      final response = await _dioClient.post(
        ApiEndpoints.aiChat,
        data: {
          'message': message,
          'model': model,
        },
      );
      return ChatResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
