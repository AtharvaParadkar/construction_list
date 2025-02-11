import 'package:construction_application/requisition_list/bloc/requisition_list_bloc.dart';
import 'package:construction_application/requisition_list/ui/requisition_list_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequisitionList extends StatefulWidget {
  const RequisitionList({super.key});


  @override
  State<RequisitionList> createState() => _RequisitionListState();
}

class _RequisitionListState extends State<RequisitionList> {
  final RequisitionListBloc reqBloc = RequisitionListBloc();

  @override
  void initState() {
    super.initState();
    reqBloc.add(RequisitionListLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Requisition List'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
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
      body: BlocBuilder<RequisitionListBloc, RequisitionListState>(
        bloc: reqBloc,
        builder: (context, state) {
          switch (state.runtimeType) {
            case const (RequisitionListLoadingState):
              return Center(
                child: CircularProgressIndicator(),
              );
            case const (RequisitionListLoadedState):
              state as RequisitionListLoadedState;
              return ListView.builder(
                itemCount: state.reqList.length,
                itemBuilder: (context, index) {
                  final req = state.reqList[index];
                  return RequisitionListCard(req: req);
                },
              );
            case const (RequisitionListFailureState):
              state as RequisitionListFailureState;
              return Center(child: Text(state.error));
            default:
              return Center(
                child: Text('No Data ! ! !'),
              );
          }
        },
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {},
      //   label: Text(
      //     "Add",
      //     style: TextStyle(
      //       fontSize: 16,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   icon: Icon(Icons.add, size: 20),
      //   backgroundColor: Color.fromARGB(255, 26, 45, 126),
      //   foregroundColor: Colors.white,
      //   elevation: 4,
      // ),
    );
  }
}
