import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_notifications.dart';
import '../../domain/usecases/get_unread_count.dart';
import '../../domain/usecases/mark_as_read.dart';
import '../../domain/usecases/mark_all_read.dart';
import 'notification_event.dart';
import 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final GetNotifications getNotifications;
  final GetUnreadCount getUnreadCount;
  final MarkAsRead markAsRead;
  final MarkAllRead markAllRead;

  NotificationBloc({
    required this.getNotifications,
    required this.getUnreadCount,
    required this.markAsRead,
    required this.markAllRead,
  }) : super(NotificationInitial()) {
    on<GetNotificationsEvent>(_onGetNotifications);
    on<GetUnreadCountEvent>(_onGetUnreadCount);
    on<MarkAsReadEvent>(_onMarkAsRead);
    on<MarkAllReadEvent>(_onMarkAllRead);
  }

  Future<void> _onGetNotifications(GetNotificationsEvent event, Emitter<NotificationState> emit) async {
    emit(NotificationLoading());
    final result = await getNotifications(event.userId);
    
    // Also get unread count to keep it in sync
    final countResult = await getUnreadCount(event.userId);
    final unreadCount = countResult.fold((_) => 0, (count) => count);

    result.fold(
      (failure) => emit(NotificationError(failure.message)),
      (notifications) => emit(NotificationLoaded(
        notifications: notifications,
        unreadCount: unreadCount,
      )),
    );
  }

  Future<void> _onGetUnreadCount(GetUnreadCountEvent event, Emitter<NotificationState> emit) async {
    final result = await getUnreadCount(event.userId);
    
    final currentState = state;
    if (currentState is NotificationLoaded) {
      result.fold(
        (failure) => emit(NotificationError(failure.message)),
        (count) => emit(currentState.copyWith(unreadCount: count)),
      );
    } else {
      result.fold(
        (failure) => emit(NotificationError(failure.message)),
        (count) => emit(NotificationLoaded(unreadCount: count)),
      );
    }
  }

  Future<void> _onMarkAsRead(MarkAsReadEvent event, Emitter<NotificationState> emit) async {
    final result = await markAsRead(event.notificationId);
    
    result.fold(
      (failure) => null, // Silently fail for now or emit error if crucial
      (_) {
        add(GetNotificationsEvent(event.userId));
      },
    );
  }

  Future<void> _onMarkAllRead(MarkAllReadEvent event, Emitter<NotificationState> emit) async {
    final result = await markAllRead(event.userId);
    result.fold(
      (failure) => null,
      (_) => add(GetNotificationsEvent(event.userId)),
    );
  }
}
