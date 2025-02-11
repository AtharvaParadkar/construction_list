part of 'requisition_list_bloc.dart';

@immutable
sealed class RequisitionListState {}

final class RequisitionListInitial extends RequisitionListState {}

final class RequisitionListLoadingState extends RequisitionListState{}

final class RequisitionListLoadedState extends RequisitionListState{
  final List<PendingPoModel> reqList;

  RequisitionListLoadedState(this.reqList);
}

final class RequisitionListFailureState extends RequisitionListState{
  final String error;

  RequisitionListFailureState(this.error);
}
