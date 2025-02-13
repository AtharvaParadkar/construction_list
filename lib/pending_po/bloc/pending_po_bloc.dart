import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:construction_application/api/api_result.dart';
import 'package:construction_application/pending_po/model/pending_po_model.dart';
import 'package:construction_application/pending_po/repository/pending_po_repository.dart';
import 'package:flutter/material.dart';

part 'pending_po_event.dart';

part 'pending_po_state.dart';

class PendingPoBloc extends Bloc<PendingPoEvent, PendingPoState> {
  final PendingPoApiRepository pendingPoApiRepository =
      PendingPoApiRepository();

  PendingPoBloc() : super(PendingPoInitial()) {
    // Event Handler for LoadPendingPoListEvent
    on<LoadPendingPoListEvent>(loadPendingPoList);
  }

  // Event Handler for LoadPendingPoListEvent
  FutureOr<void> loadPendingPoList(
      LoadPendingPoListEvent event, Emitter<PendingPoState> emit) async {
    emit(PendingPoLoadingState());

    await Future.delayed(Duration(seconds: 1));

    // data from dummy data
    // final pendingPO = dummyProjectList;
    // data from api
    final repo = PendingPoApiRepository();
    final ApiResult<PendingPoModel> result = await repo.fetchPendingPoList();
    // If any Error occurred
    if (result.errorMessage != null) {
      // Show error message in UI
      emit(PendingPoFailureState(
          error: result.errorMessage!, statusCode: result.statusCode));
    } else {
      emit(PendingPoSuccessState(response: result.data!));
    }
  }
}
