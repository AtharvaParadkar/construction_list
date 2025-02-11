import 'package:construction_application/pending_po/model/pending_po_model.dart';
import 'package:flutter/material.dart';

class RequisitionListCard extends StatelessWidget {
  const RequisitionListCard({super.key, required this.req});

  final PendingPoModel req;

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  req.supplierName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Container(
                  width: 50,
                  height: 20,
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 207, 105, 0),
                  ),
                  child: Text(
                    'Created',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
            // Row(children: [],),
            Text(
              'Issue',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            Row(
              children: [
                Text(
                  req.projectName,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  'All Resources',
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                Spacer(),
                Text(
                  req.poDate,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
