import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'pending_po_event.dart';
part 'pending_po_state.dart';

class PendingPoBloc extends Bloc<PendingPoEvent, PendingPoState> {
  PendingPoBloc() : super(PendingPoInitial()) {
    on<PendingPoEvent>((event, emit) {
      
    });
  }
}
