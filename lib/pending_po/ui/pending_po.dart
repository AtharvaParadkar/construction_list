import 'package:flutter/material.dart';

class PendingPoList extends StatelessWidget {
  const PendingPoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pending PO'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return ListTile();
      }),
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
