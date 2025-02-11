import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../dummydata.dart';
import '../../pending_po/model/pending_po_model.dart';

part 'requisition_list_event.dart';

part 'requisition_list_state.dart';

class RequisitionListBloc
    extends Bloc<RequisitionListEvent, RequisitionListState> {
  RequisitionListBloc() : super(RequisitionListInitial()) {
    on<RequisitionListLoadEvent>(loadRequisitionList);
  }

  FutureOr<void> loadRequisitionList(
      RequisitionListEvent event, Emitter<RequisitionListState> emit) async {
    try {
      emit(RequisitionListLoadingState());

      await Future.delayed(Duration(milliseconds: 1));

      final reqList=dummyProjectList;
      emit(RequisitionListLoadedState(reqList));
    } catch (error) {
      emit(RequisitionListFailureState('$error'));
    }
  }
}
