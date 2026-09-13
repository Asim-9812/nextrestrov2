import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../repositories/notification_repository.dart';

class GetUnreadCount {
  final NotificationRepository repository;

  GetUnreadCount(this.repository);

  Future<Either<Failure, int>> call(int userId) {
    return repository.getUnreadCount(userId);
  }
}
