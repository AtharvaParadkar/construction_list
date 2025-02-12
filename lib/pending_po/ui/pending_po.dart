import 'package:construction_application/pending_po/bloc/pending_po_bloc.dart';
import 'package:construction_application/pending_po/ui/pending_po_list_card.dart';
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
        title: Text(
          'Pending PO',
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_new),
          style: IconButton.styleFrom(
            foregroundColor: Colors.blueAccent,
            fixedSize: Size(50, 50),
            iconSize: 25,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.filter_alt_outlined),
            style: IconButton.styleFrom(
              foregroundColor: Colors.blueAccent,
              fixedSize: Size(50, 50),
              iconSize: 28,
            ),
          ),
        ],
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
                  return PendingPoListCard(poList: poList);
                },
              );
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
      // floatingActionButton: IconButton(
      //   onPressed: () {},
      //   color: Colors.white,
      //   icon: Icon(Icons.filter_alt),
      //   style: IconButton.styleFrom(
      //     backgroundColor: Colors.orange,
      //     fixedSize: Size(60, 60),
      //     iconSize: 30,
      //   ),
      // ),
    );
  }
}
