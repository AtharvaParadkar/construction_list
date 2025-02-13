part of 'pending_po_bloc.dart';

@immutable
sealed class PendingPoState {}

final class PendingPoInitial extends PendingPoState {}

final class PendingPoLoadingState extends PendingPoState {}

final class PendingPoSuccessState extends PendingPoState {
  final PendingPoModel response;

  PendingPoSuccessState({required this.response});
}

final class PendingPoFailureState extends PendingPoState {
  final String error;
  final int statusCode;

  PendingPoFailureState({required this.error, required this.statusCode});
}
