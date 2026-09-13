import '../../../../core/network/dio_client.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/notification_model.dart';

abstract class NotificationRemoteDataSource {
  Future<List<NotificationModel>> getNotifications();
  Future<int> getUnreadCount();
  Future<void> markAsRead(int notificationId);
  Future<void> markAllAsRead();
}

class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final DioClient _dioClient;

  NotificationRemoteDataSourceImpl(this._dioClient);

  @override
  Future<List<NotificationModel>> getNotifications() async {
    try {
      final response = await _dioClient.get(ApiEndpoints.notification);
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
  Future<int> getUnreadCount() async {
    try {
      final response = await _dioClient.get('${ApiEndpoints.notification}/unread-count');
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
  Future<void> markAllAsRead() async {
    try {
      await _dioClient.post('${ApiEndpoints.notification}/mark-all-read');
    } catch (e) {
      rethrow;
    }
  }
}
