import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String jk = "";
  void _pilihan(String value) {
    setState(() {
      jk = value;
    });
  }

  List<String> agama = [
    "Islam",
    "Protestan",
    "Katolik",
    "Hindu",
    "Buddha",
    "Khonghucu"
  ];
  String _agama = "Islam";

  void pilihAgama(String value) {
    setState(() {
      _agama = value;
    });
  }

  TextEditingController textEditingControllerNim = TextEditingController();
  TextEditingController textEditingControllerNama = TextEditingController();
  TextEditingController textEditingControllerPass = TextEditingController();

  void tampildata() {
    AlertDialog alertDialog = AlertDialog(
      content: Container(
        height: 175,
        child: Column(
          children: [
            Text("NIM Anda : ${textEditingControllerNim.text}"),
            Text("Nama Anda : ${textEditingControllerNama.text}"),
            Text("Password Anda : ${textEditingControllerPass.text}"),
            Text("Jenis Kelamin Anda : $jk"),
            Text("Agama Anda Anda : $_agama"),
            RaisedButton(
                child: Text("Okay"), onPressed: () => Navigator.pop(context))
          ],
        ),
      ),
    );
    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: Text("Ujian Tengah Semester"),
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    controller: textEditingControllerNim,
                    decoration: InputDecoration(
                        hintText: "Nomer Induk Mahasiswa",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: textEditingControllerNama,
                    decoration: InputDecoration(
                        hintText: "Nama Anda",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: textEditingControllerPass,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RadioListTile(
                    value: "Laki Laki",
                    title: Text("Laki Laki"),
                    groupValue: jk,
                    onChanged: (String value) {
                      _pilihan(value);
                    },
                    activeColor: Colors.purple,
                  ),
                  RadioListTile(
                    value: "Perempuan",
                    title: Text("Perempuan"),
                    groupValue: jk,
                    onChanged: (String value) {
                      _pilihan(value);
                    },
                    activeColor: Colors.purple,
                  ),
                  Row(
                    children: [
                      Text(
                        "Agama",
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      DropdownButton(
                          value: _agama,
                          items: agama
                              .map((String value) => DropdownMenuItem(
                                  value: value, child: Text(value)))
                              .toList(),
                          onChanged: (String value) {
                            pilihAgama(value);
                          }),
                    ],
                  ),
                  RaisedButton(
                      child: Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.purple,
                      onPressed: () {
                        tampildata();
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
