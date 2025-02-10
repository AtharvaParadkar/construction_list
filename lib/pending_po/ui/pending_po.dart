import 'package:construction_application/pending_po/bloc/pending_po_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class PendingPoList extends StatefulWidget {
  const PendingPoList({super.key});

  @override
  State<PendingPoList> createState() => _PendingPoListState();
}

class _PendingPoListState extends State<PendingPoList> {
  final PendingPoBloc poBloc = PendingPoBloc();

  @override
  void initState() {
    super.initState();
    poBloc.add(LoadPendingPoListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pending PO'),
        backgroundColor: Colors.blueAccent,
      ),
      body: BlocBuilder<PendingPoBloc, PendingPoState>(
        bloc: poBloc,
        builder: (context, state) {
          switch (state.runtimeType) {
            case const (PendingPoLoadingState):
              return Center(
                child: CircularProgressIndicator(),
              );
            case const (PendingPoLoadedState):
              state as PendingPoLoadedState;
              return ListView.builder(
                  itemCount: state.pendingPoList.length,
                  itemBuilder: (context, index) {
                    final poList = state.pendingPoList[index];
                    return ListTile(
                      title: Text(poList.projectName),
                    );
                  });
            case const (PendingPoFailureState):
              state as PendingPoFailureState;
              return Center(child: Text(state.error));
            default:
              return Center(
                child: Text('No Data ! ! !'),
              );
          }
        },
      ),
      floatingActionButton: IconButton(
        onPressed: () {},
        color: Colors.white,
        icon: Icon(Icons.filter_alt),
        style: IconButton.styleFrom(
          backgroundColor: Colors.orange,
          fixedSize: Size(60, 60),
          iconSize: 30,
        ),
      ),
    );
  }
}
