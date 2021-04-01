import 'package:flutter/material.dart';
import 'dart:math';

import 'About.dart';

class BMIResult extends StatelessWidget {
  BMIResult(
      {@required this.tinggi_badan,
        @required this.berat_badan,
        @required this.nama_user,
        @required this.jenis_kelamin,
        @required this.tanggal,
        @required this.bulan,
        @required this.tahun,
        @required this.year_now});
  final int tinggi_badan;
  final int berat_badan;
  final String nama_user;
  final String jenis_kelamin;
  final int tanggal;
  final int bulan;
  final int tahun;
  final int year_now;

  @override
  Widget build(BuildContext context) {
    double bmi = berat_badan / pow(tinggi_badan / 100, 2);
    int umur = year_now - tahun;
    String cBMI;
    String normal;
    String user = nama_user.toLowerCase();
    String jk = jenis_kelamin.toLowerCase();
    if (jenis_kelamin == "Perempuan") {
      normal = "18,0 - 25,0";
      if (bmi > 27) {
        cBMI = "Obesitas";
      } else if (bmi > 25 && bmi <= 27) {
        cBMI = "Kegemukan";
      } else if (bmi >= 18 && bmi <= 25) {
        cBMI = "Normal";
      } else if (bmi < 18) {
        cBMI = "Kurus";
      } else {
        cBMI = "Tak Terdefinisi";
      }
    } else if (jenis_kelamin == "Laki-Laki") {
      normal = "17,0 - 23,0";
      if (bmi > 27) {
        cBMI = "Gendut";
      } else if (bmi > 23 && bmi <= 27) {
        cBMI = "Kegemukan";
      } else if (bmi >= 17 && bmi <= 23) {
        cBMI = "Normal";
      } else if (bmi < 17) {
        cBMI = "Kurus";
      } else {
        cBMI = "Tak Terdefinisi";
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
        title: Text('BMI Calculator'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutRoute()),
              );
            },
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              cBMI.toString(),
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
                color: Colors.green,
              ),
            ),
            Text(
              bmi.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.w800,
                color: Colors.orange,
              ),
            ),
            Text(
              "Rentang Normal",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.orange,
              ),
            ),
            Text(
              normal.toString(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.orange,
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.all(20.0),
                child: Text(
                  "Hai $user, jenis kelamin $jk usia $umur tahun, kamu memiliki nilai Body Mass Index (BMI) dalam rentangan $cBMI.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Colors.green,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        //color: Colors.transparent,
        child: Container(
          height: 18,
          color: Colors.pinkAccent,
          alignment: Alignment.center,
          child: Text(
            'Developed by Anton S',
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w300,
                color: Colors.white),
          ),
        ),
        //elevation: 0,
      ),
    );
  }
}
