import 'package:construction_application/pending_po/bloc/pending_po_bloc.dart';
import 'package:construction_application/pending_po/model/pending_po_model.dart';
import 'package:construction_application/utils/color_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class PendingPoList extends StatefulWidget {
  const PendingPoList({super.key});

  @override
  State<PendingPoList> createState() => _PendingPoListState();
}

class _PendingPoListState extends State<PendingPoList> {
  late PendingPoBloc poBloc = PendingPoBloc();

  List<PendingPoItemModel> _pendingPoList = [];

  @override
  void initState() {
    poBloc.add(LoadPendingPoListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pending PO',
          style: TextStyle(
            color: CustomColours.blackTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_new),
          style: IconButton.styleFrom(
            foregroundColor: CustomColours.primaryColour,
            fixedSize: Size(50, 50),
            iconSize: 25,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.filter_alt_outlined),
            style: IconButton.styleFrom(
              foregroundColor: CustomColours.primaryColour,
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
            case const (PendingPoSuccessState):
              state as PendingPoSuccessState;
              if (state.response.data == null) {
                _pendingPoList = [];
              } else {
                _pendingPoList = state.response.data!.response != null
                    ? state.response.data!.response!
                    : [];
              }
              return _pendingPoList.isNotEmpty
                  ? ListView.builder(
                      itemCount: _pendingPoList.length,
                      itemBuilder: (context, index) {
                        return listCard(_pendingPoList[index]);
                      },
                    )
                  : Center(
                      child: Text(
                      textAlign: TextAlign.center,
                      "No List found",
                    ));
            case const (PendingPoFailureState):
              state as PendingPoFailureState;
              return Center(
                  child: Text(
                      'Error - ${state.error} : StatusCode - ${state.statusCode}'));
            default:
              return Center(
                child: Text('No Data !!!'),
              );
          }
        },
      ),
    );
  }
}

Widget listCard(PendingPoItemModel data) {
  return Container(
    margin: EdgeInsets.all(9),
    padding: EdgeInsets.all(2),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.3),
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                data.poCode!,
                style: TextStyle(
                  color: CustomColours.projStatusBG,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Container(
                width: 30,
                height: 20,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 0, 0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'NP',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: CustomColours.whiteBG,
                  ),
                ),
              ),
            ],
          ),
          Text(
            'Project Name : ${data.projectName}',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: CustomColours.blackTextColor),
          ),
          Text(
            'Supplier Name : ${data.supplierName}',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: CustomColours.blackTextColor),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PO Date :',
                    style: TextStyle(
                      color: CustomColours.hintTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    data.poDate!,
                    style: TextStyle(
                      color: CustomColours.blackTextColor,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Delivery Date :',
                    style: TextStyle(
                      color: CustomColours.hintTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    data.deliveryDate!,
                    style: TextStyle(
                      color: CustomColours.blackTextColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
