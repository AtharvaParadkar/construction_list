import 'package:construction_application/pending_po/model/pending_po_model.dart';
import 'package:flutter/material.dart';

class PendingPoListCard extends StatelessWidget {
  const PendingPoListCard({super.key, required this.poList});

  final PendingPoModel poList;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  poList.projectId,
                  style: TextStyle(
                    color: Colors.teal,
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
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              'Project Name : ${poList.projectName}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Supplier Name : ${poList.supplierName}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              spacing: 60,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'PO Date :',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(poList.poDate),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delivery Date :',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(poList.deliveryDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
