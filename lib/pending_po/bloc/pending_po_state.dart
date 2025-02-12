part of 'pending_po_bloc.dart';

@immutable
sealed class PendingPoState {}

final class PendingPoInitial extends PendingPoState {}

final class PendingPoLoadingState extends PendingPoState{}

final class PendingPoLoadedState extends PendingPoState{
  final List<PendingPoModel> pendingPoList;

  PendingPoLoadedState({required this.pendingPoList});
}

final class PendingPoFailureState extends PendingPoState{
  final String error;

  PendingPoFailureState(this.error);
}
