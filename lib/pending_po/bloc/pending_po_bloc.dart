import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:construction_application/dummydata.dart';
import 'package:construction_application/pending_po/model/pending_po_model.dart';
import 'package:flutter/material.dart';

part 'pending_po_event.dart';

part 'pending_po_state.dart';

class PendingPoBloc extends Bloc<PendingPoEvent, PendingPoState> {
  PendingPoBloc() : super(PendingPoInitial()) {
    on<LoadPendingPoListEvent>(loadPendingPoList);
  }

  FutureOr<void> loadPendingPoList(
      LoadPendingPoListEvent event, Emitter<PendingPoState> emit) async{
    try {
      emit(PendingPoLoadingState());

      await Future.delayed(Duration(seconds: 1));

      final pendingPO = dummyProjectList;
      emit(PendingPoLoadedState(pendingPO));
    } catch (error) {
      emit(PendingPoFailureState('$error'));
    }
  }
}
