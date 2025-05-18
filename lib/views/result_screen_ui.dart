import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ResultScreenUi extends StatefulWidget {
  //สร้างตัวแปรรับค่าที่จะส่งมา

  double? carPrice;
  double? paypermonth;
  int? mouth;

  //เอาตัวแปรที่สร้างมารอรับค่าที่จะส่ง
  ResultScreenUi({
    super.key,
    this.carPrice,
    this.paypermonth,
    this.mouth,
  });

  @override
  State<ResultScreenUi> createState() => _ResultScreenUiState();
}

class _ResultScreenUiState extends State<ResultScreenUi> {
  @override
  Widget build(BuildContext context) {
    //กำหนดรูปแบบของตัวเลข ณ ที่นี้ คอมมาขั้นหลักพัน/ล้าน และเลขจุดทศนิยม 2 ตำแหน่ง
    NumberFormat fs = NumberFormat("#,###,##0.00");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CI calculator',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ผ่อนทั้งหมด ',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              ' ${widget.mouth} ',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            Text(
              ' เดิอน ',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Text(
          'ค่างวดรถต่อเดือน',
        ),
        Text(
          '${fs.format(widget.paypermonth)}',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        Text(
          'บาท',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ])),
    );
  }
}
