import 'dart:io';
import 'package:flutter_car_installment_calculator/views/result_screen_ui.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class InputScreenUi extends StatefulWidget {
  const InputScreenUi({super.key});

  @override
  State<InputScreenUi> createState() => _InputScreenUiState();
}

class _InputScreenUiState extends State<InputScreenUi> {
  //สร้างตัวแปรควบคุม TextField
  TextEditingController? _carPriceCtrl = TextEditingController();
  TextEditingController? _interestCtrl = TextEditingController();
  //สร้างตัวแปรควบคุม radio button
  int _downctrl = 10;
  //สร้างตัวแปรควบคุม dropdown
  int _monthctrl = 24;
  //เก็บรูปที่ได้จากแกลเลอรี่
  File? _imageFile;

  //สร้างเมธอตแสดง dialog แจ้งเตือน
  _warnlingDialog(mg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'คำเตือน',
        ),
        content: Text(
          mg,
        ),
        actions: [
          OutlinedButton(
            //TextButton, ElevatedButton,IconButton
            onPressed: () {
              Navigator.pop(context); // ปิด dialog
            },
            child: Text(
              'ตกลง',
            ),
          )
        ],
      ),
    );
  }

  //สร้างเมธอตดสำหรับเปิดกล้อง
  _openCamera() async {
    final pickedIgmage = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    if (pickedIgmage == null) return;
    setState(() {
      _imageFile = File(pickedIgmage.path);
    });
  }

  //สร้างเมธอตดสำหรับเปิดแกลเลอรี่
  _openGallery() async {
    final pickedIgmage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    if (pickedIgmage == null) return;
    setState(() {
      _imageFile = File(pickedIgmage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 243, 227),
        title: const Text('CI Calculator',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // ปิด keyboard
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 40,
              right: 40,
            ),
            child: Center(
              child: Column(children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  'คำนวณค่างวดรถยนต์',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Color.fromARGB(255, 3, 243, 227),
                      width: 2,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Color.fromARGB(255, 3, 243, 227),
                          content: Column(
                            children: [
                              ListTile(
                                onTap: () {
                                  _openCamera();
                                },
                                title: Text(
                                  'เปิดกล้อง (Open Camera)',
                                ),
                                leading: Icon(
                                  Icons.photo_camera,
                                  color: Colors.black,
                                ),
                              ),
                              ListTile(
                                onTap: () {
                                  _openGallery();
                                },
                                title: Text(
                                  'เลือกแกลเลอรี่ (Open Gallery)',
                                ),
                                leading: Icon(
                                  Icons.photo,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: _imageFile == null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/img02.png',
                              width: 200,
                              fit: BoxFit.cover,
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              _imageFile!,
                              width: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ราคารถยนต์ (บาท)',
                  ),
                ),
                TextField(
                  controller: _carPriceCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '0.00',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'จำนวนเงินดาวน์ (%)',
                  ),
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Radio(
                      onChanged: (value) {
                        setState(() {
                          _downctrl = value!;
                        });
                      },
                      value: 10,
                      groupValue: _downctrl,
                    ),
                    Text(
                      '10',
                    ),
                    Radio(
                      onChanged: (value) {
                        setState(() {
                          _downctrl = value!;
                        });
                      },
                      value: 20,
                      groupValue: _downctrl,
                    ),
                    Text(
                      '20',
                    ),
                    Radio(
                      onChanged: (value) {
                        setState(() {
                          _downctrl = value!;
                        });
                      },
                      value: 30,
                      groupValue: _downctrl,
                    ),
                    Text(
                      '30',
                    ),
                    Radio(
                      onChanged: (value) {
                        setState(() {
                          _downctrl = value!;
                        });
                      },
                      value: 40,
                      groupValue: _downctrl,
                    ),
                    Text(
                      '40',
                    ),
                    Radio(
                      onChanged: (value) {
                        setState(() {
                          _downctrl = value!;
                        });
                      },
                      value: 50,
                      groupValue: _downctrl,
                    ),
                    Text(
                      '50',
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ระยะเวลาผ่อน (เดือน)',
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    child: DropdownButton<int>(
                      value: _monthctrl,
                      isExpanded: true,
                      underline: Container(),
                      onChanged: (int? value) {
                        setState(() {
                          _monthctrl = value!;
                        });
                      },
                      items: <int>[
                        24,
                        36,
                        48,
                        60,
                        72,
                      ].map<DropdownMenuItem<int>>((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(
                            '$value เดือน',
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'อัตราดอกเบี้ย (%/ปี)',
                  ),
                ),
                TextField(
                  controller: _interestCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '0.00',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    //validate UI หากมีปัญหาจะแสดง daialog
                    if (_carPriceCtrl!.text.isEmpty) {
                      _warnlingDialog('ป้อนราคาด้วยนะ');
                    } else if (_interestCtrl!.text.isEmpty) {
                      _warnlingDialog('ป้อนอัตราดอกเบี้ยด้วยนะ');
                    } else {
                      //พร้อมคำนวณค่างวดรถยนต์ ส่งไปที่หน้า resultScreen
                      //แปลงราคาอัตรดอกเบี้ยให้เป็น double
                      double carPrice = double.parse(_carPriceCtrl!.text);
                      double interest = double.parse(_interestCtrl!.text);

                      //ยอดจัด = ราคารถยนต์ - เงินดาวน์
                      double balance =
                          carPrice - (carPrice * (_downctrl / 100));

                      //ดอกเบี้ยที่ต้องจ่ายทั้งหมด = (ยอดจัด * อัตราดอกเบี้ย / 100/12) * จำนวนเดือนผ่อน
                      double Totalinterest =
                          (balance * (interest / 100) / 12) * _monthctrl;

                      //ยอดที่ต้องผ่อนต่อเดือน = (ยอดจัด + ดอกเบี้ยที่ต้องจ่ายทั้งหมด) / จำนวนเดือนผ่อน
                      double paypermonth =
                          (balance + Totalinterest) / _monthctrl;

                      //ส่งผลต่างๆไปที่หน้า resultScreen โดยแบบย้อนกลับได้
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreenUi(
                            carPrice: carPrice,
                            paypermonth: paypermonth,
                            mouth: _monthctrl,
                          ),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'คำนวณ',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 3, 243, 227),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    minimumSize: Size(
                      double.infinity,
                      55,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    //เคลียร์ทุกอย่างให้เป็นเหมือนเดิม
                    setState(() {
                      _carPriceCtrl!.clear();
                      _downctrl = 10;
                      _monthctrl = 24;
                      _interestCtrl!.clear();
                    });
                  },
                  child: Text(
                    'ยกเลิก',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 245, 33, 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    minimumSize: Size(
                      double.infinity,
                      55,
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
