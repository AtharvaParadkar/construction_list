import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:construction_application/pending_po/model/pending_po_model.dart';
import 'package:construction_application/pending_po/repository/pending_po_repository.dart';
import 'package:flutter/material.dart';

part 'pending_po_event.dart';

part 'pending_po_state.dart';

class PendingPoBloc extends Bloc<PendingPoEvent, PendingPoState> {
  final PendingPoApiRepository pendingPoApiRepository =
      PendingPoApiRepository();

  PendingPoBloc() : super(PendingPoInitial()) {
    on<LoadPendingPoListEvent>(loadPendingPoList);
  }

  FutureOr<void> loadPendingPoList(
      LoadPendingPoListEvent event, Emitter<PendingPoState> emit) async {
    try {
      emit(PendingPoLoadingState());

      await Future.delayed(Duration(seconds: 1));

      // data from dummy data
      // final pendingPO = dummyProjectList;
      // data from api
      final List<PendingPoModel> pendingPO =
          await pendingPoApiRepository.fetchPendingPo();
      emit(PendingPoLoadedState(pendingPoList: pendingPO));
    } catch (error) {
      emit(PendingPoFailureState('$error'));
    }
  }
}
