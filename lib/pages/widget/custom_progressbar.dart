import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final double value;
  final double totalValue;
  const CustomProgressBar(
      {Key key,
      this.width,
      this.height,
      this.radius,
      this.value,
      this.totalValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double ratio = value / totalValue;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 5),
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, right: 10, left: 10),
              width: width,
              height: height,
              decoration: BoxDecoration(
                  color: Color(0XFFE5E5E5),
                  borderRadius: BorderRadius.circular(radius)),
            ),
            Column(
              children: [
                SizedBox(height: 20),
                Material(
                  borderRadius: BorderRadius.circular(radius),
                  child: AnimatedContainer(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    height: height,
                    width: width * ratio,
                    duration: Duration(milliseconds: 500),
                    decoration: BoxDecoration(
                        color: Color(0XFFFFD05B),
                        borderRadius: BorderRadius.circular(radius)),
                  ),
                ),
              ],
            ),
            Container(
              width: width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(90),
                            color: Color(0XFFFFD05B),
                          ),
                        ),
                      ),
                      Text(
                        "เลือกใบสั่งขาย",
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 5, color: Color(0XFFFFD05B)),
                            borderRadius: BorderRadius.circular(90),
                            color: (width * ratio < width / 2)
                                ? Colors.white
                                : Color(0XFFFFD05B),
                          ),
                        ),
                      ),
                      Text(
                        "ระบุสินค้า",
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 5, color: Color(0XFFFFD05B)),
                            borderRadius: BorderRadius.circular(90),
                            color: (width * ratio < width)
                                ? Colors.white
                                : Color(0XFFFFD05B),
                          ),
                        ),
                      ),
                      Text(
                        "สำเร็จ",
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

// class TimState with ChangeNotifier {
//   int _time = 15;
//   int get time => _time;
//   set time(int newTime) {
//     _time = newTime;
//     notifyListeners();
//   }
// }
