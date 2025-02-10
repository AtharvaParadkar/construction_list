part of 'pending_po_bloc.dart';

@immutable
sealed class PendingPoEvent {}

final class LoadPendingPoListEvent extends PendingPoEvent{}
