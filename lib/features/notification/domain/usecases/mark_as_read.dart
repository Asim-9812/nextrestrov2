import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../repositories/notification_repository.dart';

class MarkAsRead {
  final NotificationRepository repository;

  MarkAsRead(this.repository);

  Future<Either<Failure, void>> call(int notificationId) {
    return repository.markAsRead(notificationId);
  }
}
