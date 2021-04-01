import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Result.dart';
import 'About.dart';
import 'package:intl/intl.dart';

class InputBMI extends StatefulWidget {
  @override
  _InputBMIState createState() => _InputBMIState();
}

class _InputBMIState extends State<InputBMI> {
  int tinggi = 0;
  int berat = 0;
  int tanggal;
  int bulan;
  int tahun;
  String nama;
  String _valGender;
  List _listGender = ["Laki-Laki", "Perempuan"];
  int year = 0;
  getDateToday() {
    var now = new DateTime.now();
    var format = new DateFormat('yyyy');
    String dateFormat = format.format(now);
    var parse = int.parse(dateFormat);
    setState(() {
      year = parse;
    });
  }

  @override
  Widget build(BuildContext context) {
    getDateToday();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 12),
          child: IconButton(
            icon: Icon(Icons.star_border_outlined),
            color: Colors.white,
            onPressed: (){
              starDialogOpen(context);
            },
          ),
        ),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 5),
              width: 90,
              height: 90,
              child: Image.asset(
                'assets/bmi.jpg',
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 5),
                padding: EdgeInsets.all(5),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: new Theme(
                            data: new ThemeData(
                                primaryColor: Colors.pink,
                                primaryColorDark: Colors.pink),
                            child: new TextField(
                              onChanged: (txt) {
                                setState(() {
                                  nama = txt;
                                });
                              },
                              keyboardType: TextInputType.text,
                              maxLength: 12,
                              decoration: new InputDecoration(
                                  border: new OutlineInputBorder(
                                      borderSide:
                                      new BorderSide(color: Colors.pinkAccent),
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(20.0),
                                    )
                                  ),
                                  hintText: 'Masukkan Nama Anda',
                                  labelText: 'Nama',
                                  prefixIcon: const Icon(
                                    Icons.person,
                                    color: Colors.pinkAccent,
                                  ),
                                  prefixText: ' ',
                                  suffixStyle:
                                  const TextStyle(color: Colors.pinkAccent)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: new Theme(
                            data: new ThemeData(
                                primaryColor: Colors.pinkAccent,
                                primaryColorDark: Colors.pinkAccent),
                            child: new DropdownButtonFormField(
                              items: _listGender.map((value) {
                                return DropdownMenuItem(
                                  child: Text(value),
                                  value: value,
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _valGender = value;
                                });
                              },
                              decoration: new InputDecoration(
                                  border: new OutlineInputBorder(
                                      borderSide:
                                      new BorderSide(color: Colors.pinkAccent),
                                    borderRadius: const BorderRadius.all(
                                    const Radius.circular(20.0),
                                   ),
                                  ),
                                  hintText: 'Pilih Jenis Kelamin',
                                  helperText: '',
                                  labelText: 'Jenis Kelamin',
                                  prefixIcon: const Icon(
                                    Icons.wc,
                                    color: Colors.pinkAccent,
                                  ),
                                  suffixStyle:
                                  const TextStyle(color: Colors.pinkAccent)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: new Theme(
                            data: new ThemeData(
                                primaryColor: Colors.pinkAccent,
                                primaryColorDark: Colors.pinkAccent),
                            child: new TextField(
                              onChanged: (txt) {
                                setState(() {
                                  tanggal = int.parse(txt);
                                });
                              },
                              keyboardType: TextInputType.number,
                              maxLength: 2,
                              decoration: new InputDecoration(
                                  border: new OutlineInputBorder(
                                      borderSide:
                                      new BorderSide(color: Colors.pinkAccent),
                                      borderRadius: const BorderRadius.all(
                                      const Radius.circular(20.0),
                                     ),
                                  ),
                                  hintText: '01 - 31',
                                  labelText: 'Tanggal',
                                  prefixIcon: const Icon(
                                    Icons.date_range,
                                    color: Colors.pinkAccent,
                                  ),
                                  suffixStyle:
                                  const TextStyle(color: Colors.pinkAccent)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: new Theme(
                            data: new ThemeData(
                                primaryColor: Colors.pinkAccent,
                                primaryColorDark: Colors.pinkAccent),
                            child: new TextField(
                              onChanged: (txt) {
                                setState(() {
                                  bulan = int.parse(txt);
                                });
                              },
                              keyboardType: TextInputType.number,
                              maxLength: 2,
                              decoration: new InputDecoration(
                                  border: new OutlineInputBorder(
                                      borderSide:
                                      new BorderSide(color: Colors.pinkAccent),
                                    borderRadius: const BorderRadius.all(
                                    const Radius.circular(20.0),
                                    ),
                                  ),
                                  hintText: '01-12',
                                  labelText: 'Bulan',
                                  prefixIcon: const Icon(
                                    Icons.date_range,
                                    color: Colors.pinkAccent,
                                  ),
                                  suffixStyle:
                                  const TextStyle(color: Colors.pinkAccent),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: new Theme(
                            data: new ThemeData(
                                primaryColor: Colors.pinkAccent,
                                primaryColorDark: Colors.pinkAccent),
                            child: new TextField(
                              onChanged: (txt) {
                                setState(() {
                                  tahun = int.parse(txt);
                                });
                              },
                              keyboardType: TextInputType.number,
                              maxLength: 4,
                              decoration: new InputDecoration(
                                  border: new OutlineInputBorder(
                                      borderSide:
                                      new BorderSide(color: Colors.pinkAccent),
                                      borderRadius: const BorderRadius.all(
                                      const Radius.circular(20.0),
                                      ),
                                  ),
                                  hintText: '',
                                  labelText: 'Tahun',
                                  prefixIcon: const Icon(
                                    Icons.date_range,
                                    color: Colors.pinkAccent,
                                  ),
                                  suffixStyle:
                                  const TextStyle(color: Colors.pinkAccent)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: new Theme(
                            data: new ThemeData(
                                primaryColor: Colors.pinkAccent,
                                primaryColorDark: Colors.pinkAccent),
                            child: new TextField(
                              onChanged: (txt) {
                                setState(() {
                                  tinggi = int.parse(txt);
                                });
                              },
                              keyboardType: TextInputType.number,
                              maxLength: 3,
                              decoration: new InputDecoration(
                                  border: new OutlineInputBorder(
                                      borderSide:
                                      new BorderSide(color: Colors.pinkAccent),
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(20.0),
                                    ),
                                  ),
                                  hintText: 'Tinggi Badan',
                                  labelText: 'Tinggi Badan',
                                  prefixIcon: const Icon(
                                    Icons.border_color,
                                    color: Colors.pinkAccent,
                                  ),
                                  prefixText: ' ',
                                  suffixText: 'Cm',
                                  suffixStyle:
                                  const TextStyle(color: Colors.pinkAccent)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: new Theme(
                            data: new ThemeData(
                                primaryColor: Colors.pinkAccent,
                                primaryColorDark: Colors.pinkAccent),
                            child: new TextField(
                              onChanged: (txt) {
                                setState(() {
                                  berat = int.parse(txt);
                                });
                              },
                              keyboardType: TextInputType.number,
                              maxLength: 3,
                              decoration: new InputDecoration(
                                  border: new OutlineInputBorder(
                                      borderSide:
                                      new BorderSide(color: Colors.pinkAccent),
                                      borderRadius: const BorderRadius.all(
                                      const Radius.circular(20.0),
                                      ),
                                  ),
                                  hintText: 'Berat Badan',
                                  labelText: 'Berat badan',
                                  prefixIcon: const Icon(
                                    Icons.border_color,
                                    color: Colors.pinkAccent,
                                  ),
                                  prefixText: ' ',
                                  suffixText: 'Kg',
                                  suffixStyle:
                                  const TextStyle(color: Colors.pinkAccent)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
            Container(
              //height: double.infinity,
              margin: EdgeInsets.only(left: 90, right: 90, bottom: 20),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(color: Colors.pink)
                ),
                color: Colors.pinkAccent,
                textColor: Colors.pinkAccent,
                padding: EdgeInsets.all(12.0),
                onPressed: () {
                  if (_valGender != '' &&
                      nama != null &&
                      tahun != null &&
                      bulan != null &&
                      tanggal != null &&
                      tinggi != null &&
                      berat != null) {
                    if ((tanggal > 0 && tanggal <= 31) &&
                        (bulan > 0 && bulan <= 12) &&
                        (tahun > 1900 && tahun < 2020)) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BMIResult(
                                tinggi_badan: tinggi,
                                berat_badan: berat,
                                nama_user: nama,
                                jenis_kelamin: _valGender,
                                tanggal: tanggal,
                                bulan: bulan,
                                tahun: tahun,
                                year_now: year)),
                      );
                    } else {
                      return ErrorDescription("Tanggal/Bulan/Tahun tidak valid!");
                    }
                  } else {
                    return ErrorDescription("Data Belum Lengkap!");
                  }
                },
                child: Text(
                  "Cek Sekarang",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
            ),
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
  void starDialogOpen(BuildContext context)
  {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () { },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Suka dengan Aplikasi ini?"),
      content: Text("Kirimkan kritik dan saran Anda ke surel " "anton.surya@undiksha.ac.id"
          "\nTerima Kasih ^^"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

