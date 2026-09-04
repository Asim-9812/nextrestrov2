import 'package:equatable/equatable.dart';
import '../../domain/entities/chat_message.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {
  final List<ChatMessage> messages;

  const ChatInitial(this.messages);

  @override
  List<Object> get props => [messages];
}

class ChatLoading extends ChatState {
  final List<ChatMessage> messages;

  const ChatLoading(this.messages);

  @override
  List<Object> get props => [messages];
}

class ChatLoaded extends ChatState {
  final List<ChatMessage> messages;

  const ChatLoaded(this.messages);

  @override
  List<Object> get props => [messages];
}

class ChatError extends ChatState {
  final String message;
  final List<ChatMessage> messages;

  const ChatError(this.message, this.messages);

  @override
  List<Object> get props => [message, messages];
}
