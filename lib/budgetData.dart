// ignore: file_names
import 'package:flutter/material.dart';

import 'drawer.dart';

// ignore: must_be_immutable
class BudgetData extends StatefulWidget {
  BudgetData({super.key, this.budgetData});
  // ignore: prefer_typing_uninitialized_variables
  var budgetData;

  @override
  State<BudgetData> createState() => _BudgetDataState();
}

class _BudgetDataState extends State<BudgetData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Budget"),
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          widget.budgetData.length == 0
              ? Center(
                  child: Column(
                    children: const [
                      Text(
                        "data tidak ditemukan",
                      ),
                    ],
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: widget.budgetData.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(widget.budgetData[index].judul),
                          subtitle: Text(widget.budgetData[index].nominal),
                          trailing: Column(
                            children: [
                              Text(widget.budgetData[index].tipe),
                              Text(widget.budgetData[index].tanggal)
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
