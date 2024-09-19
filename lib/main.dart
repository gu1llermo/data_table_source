import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Data table source'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: PaginatedDataTable(
            header: const Text('Products'),
            rowsPerPage: 8,
            columnSpacing: 100,
            horizontalMargin: 40,
            columns: const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Price')),
            ],
            source: MyData(),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.ac_unit))
            ],
            availableRowsPerPage: const [8, 16],
            onRowsPerPageChanged: (value) {},
            showCheckboxColumn: true,
            showFirstLastButtons: true,
            sortColumnIndex: 1,
            sortAscending: true,
            onSelectAll: (value) {},
            arrowHeadColor: Colors.black,
            checkboxHorizontalMargin: 30,
          ),
        ),
      ),
    );
  }
}

class MyData extends DataTableSource {
  final _data = List.generate(
    200,
    (index) =>
        {"id": index, "name": 'item $index', "price": Random().nextInt(10000)},
  );

  @override
  DataRow? getRow(int index) {
    final data = _data[index];
    return DataRow(cells: [
      DataCell(Text('${data['id']}')),
      DataCell(Text('${data['name']}')),
      DataCell(Text('${data['price']}')),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}
