import 'package:flutter/material.dart';
import 'package:invoice/models/book_tax.dart';
import 'package:invoice/screens/widgets/custom_progressbar.dart';
import 'package:invoice/services/dummy/dummy.dart';

class ChooseOrderScreenV1 extends StatefulWidget {
  ChooseOrderScreenV1({Key key}) : super(key: key);

  @override
  _ChooseOrderScreenV1State createState() => _ChooseOrderScreenV1State();
}

List<BookTax> taxDetails = bookTaxFromJson(Dummy.bookTax);

class _ChooseOrderScreenV1State extends State<ChooseOrderScreenV1> {
  double _value = 0;

  List<bool> selected =
      List<bool>.generate(taxDetails.length, (index) => false);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      // color: Colors.teal,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (_value < 10)
                                    _value = _value + 5;
                                  else
                                    _value = 0;
                                });
                              },
                              child: CustomProgressBar(
                                width: _width * 0.6,
                                height: 10,
                                radius: 20,
                                value: _value,
                                totalValue: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "รายละเอียดการจองใบกำกับภาษี",
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: DataTable(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12),
                                borderRadius: BorderRadius.circular(20)),
                            columnSpacing: 150,
                            dataRowHeight: 35,
                            columns: [
                              DataColumn(label: Text('เลขที่ใบกำกับภาษี')),
                              DataColumn(label: Text('วันที่บันทึก')),
                              DataColumn(label: Text('ผู้บันทึก')),
                            ],
                            rows: List<DataRow>.generate(
                              taxDetails.length,
                              (index) => DataRow(
                                selected: selected[index],
                                onSelectChanged: (value) => setState(() {
                                  selected[index] = !selected[index];
                                }),
                                cells: <DataCell>[
                                  DataCell(Text(taxDetails[index].numTax)),
                                  DataCell(Text(taxDetails[index].memDate)),
                                  DataCell(Text(taxDetails[index].memUser)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: Color(0XFFFFD05B),
                            onPressed: () =>
                                // Navigator.pushNamed(context, 'second-screen'),
                                Navigator.pop(context),
                            child: Text("เลือก",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.white)),
                          ),
                          SizedBox(
                            width: 37,
                          ),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: Color(0XFF29EAA4),
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text("ยกเลิก",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
