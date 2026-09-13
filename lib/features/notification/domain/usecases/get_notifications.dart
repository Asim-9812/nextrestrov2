import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/notification_entity.dart';
import '../repositories/notification_repository.dart';

class GetNotifications {
  final NotificationRepository repository;

  GetNotifications(this.repository);

  Future<Either<Failure, List<NotificationEntity>>> call(int userId) {
    return repository.getNotifications(userId);
  }
}
