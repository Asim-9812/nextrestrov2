import '../../../../core/network/dio_client.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/notification_model.dart';

abstract class NotificationRemoteDataSource {
  Future<List<NotificationModel>> getNotifications(int userId);
  Future<int> getUnreadCount(int userId);
  Future<void> markAsRead(int notificationId);
  Future<void> markAllAsRead(int userId);
}

class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final DioClient _dioClient;

  NotificationRemoteDataSourceImpl(this._dioClient);

  @override
  Future<List<NotificationModel>> getNotifications(int userId) async {
    try {
      final response = await _dioClient.get(
        ApiEndpoints.notification,
        queryParameters: {'userId': userId},
      );
      if (response.data != null) {
        final List<dynamic> data = response.data;
        return data.map((json) => NotificationModel.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> getUnreadCount(int userId) async {
    try {
      final response = await _dioClient.get(
        '${ApiEndpoints.notification}/unread-count',
        queryParameters: {'userId': userId},
      );
      if (response.data != null) {
        return response.data['unreadCount'] ?? 0;
      }
      return 0;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> markAsRead(int notificationId) async {
    try {
      await _dioClient.post('${ApiEndpoints.notification}/$notificationId/read');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> markAllAsRead(int userId) async {
    try {
      await _dioClient.post(
        '${ApiEndpoints.notification}/mark-all-read',
        queryParameters: {'userId': userId},
      );
    } catch (e) {
      rethrow;
    }
  }
}
