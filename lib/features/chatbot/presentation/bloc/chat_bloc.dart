import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/chat_message.dart';
import '../../domain/usecases/send_chat_message.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final SendChatMessage sendChatMessage;
  final List<ChatMessage> _messagesList = [];

  ChatBloc({required this.sendChatMessage}) : super(ChatInitial(const [])) {
    _messagesList.add(ChatMessage(
      text: "Hello! I'm your DivinePet AI Assistant. I can help you find pet products, recommend treats, check availability, and even help you book veterinary appointments. How can I assist you and your pet today?",
      type: MessageType.bot,
      timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
    ));
    
    // Initial state set via super(ChatInitial(List.from(_messagesList))) would be better but I can't reference _messagesList in super before initialization easily.
    on<SendMessageEvent>(_onSendMessage);
  }

  Future<void> _onSendMessage(SendMessageEvent event, Emitter<ChatState> emit) async {
    final userMessage = ChatMessage(
      text: event.message,
      type: MessageType.user,
      timestamp: DateTime.now(),
    );
    _messagesList.add(userMessage);
    emit(ChatLoading(List.from(_messagesList)));

    final result = await sendChatMessage(event.message, "");
    
    result.fold(
      (failure) {
        final errorMessage = ChatMessage(
          text: "Sorry, I'm having trouble connecting. Error: ${failure.message}",
          type: MessageType.bot,
          timestamp: DateTime.now(),
        );
        _messagesList.add(errorMessage);
        emit(ChatError(failure.message, List.from(_messagesList)));
      },
      (botMessage) {
        _messagesList.add(botMessage);
        emit(ChatLoaded(List.from(_messagesList)));
      },
    );
  }

  List<ChatMessage> get currentMessages => _messagesList;
}
