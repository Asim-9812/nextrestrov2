import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../repositories/notification_repository.dart';

class MarkAllRead {
  final NotificationRepository repository;

  MarkAllRead(this.repository);

  Future<Either<Failure, void>> call(int userId) {
    return repository.markAllAsRead(userId);
  }
}
