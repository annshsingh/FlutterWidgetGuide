import 'package:flutter/material.dart';
import 'package:flutter_widget_guide/utils.dart';

import '../Code.dart';
import '../CodeScreen.dart';

class DataTableWidget extends StatefulWidget {
  @override
  _DataTableWidgetState createState() => _DataTableWidgetState();
}

class _DataTableWidgetState extends State<DataTableWidget> {
  /// True since we want our list to be in ascending order initially
  bool sort = true;

  List<int> num = [1, 2, 3, 4, 5, 6];
  List<String> listItems = [
    'Grocries',
    'Electronics',
    'Clothes',
    'Office Supplies',
    'Veggies',
    'Dairy'
  ];

  /// Method called when the header of 1st column is clicked
  onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        /// Sort the list in ascending order
        num.sort((a, b) => a.compareTo(b));
        listItems = listItems.reversed.toList();
      } else {
        /// Sort the list in descending order
        num.sort((b, a) => a.compareTo(b));
        listItems = listItems.reversed.toList();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'DataTable Widget',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: Utils.ubuntuRegularFont),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.code),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    CodeScreen(code: Code.dataTableWidgetCode),
              ),
            ),
          )
        ],
      ),
      body: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          /// To make the datatable take all the available space
          Expanded(
            /// DataTable wrapped inside Scroll View for smaller devices
            /// or landscape view
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                sortColumnIndex: 0,
                sortAscending: sort,
                columns: [
                  DataColumn(
                      label: Text('S.No'),
                      numeric: true,

                      /// Triggered when you click the column header
                      onSort: (columnIndex, ascending) {
                        setState(() {
                          /// To control the value of "sortAscending" for the
                          /// DataTable
                          sort = !sort;
                        });

                        /// Call the onSort method with logic to sort both
                        /// the columns together
                        onSort(columnIndex, ascending);
                      }),
                  DataColumn(label: Text('Items')),
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(Text('${num[0]}')),
                      DataCell(Text('${listItems[0]}')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('${num[1]}')),
                      DataCell(Text('${listItems[1]}')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('${num[2]}')),
                      DataCell(Text('${listItems[2]}')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('${num[3]}')),
                      DataCell(Text('${listItems[3]}')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('${num[4]}')),
                      DataCell(Text('${listItems[4]}')),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('${num[5]}')),
                      DataCell(Text('${listItems[5]}')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
