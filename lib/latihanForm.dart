import 'package:flutter/material.dart';

class LatihanForm extends StatefulWidget {
  @override
  State<LatihanForm> createState() => _LatihanFormState();
}

class _LatihanFormState extends State<LatihanForm> {
  TextEditingController nama = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  String? materi;
  String? jenisKelamin;
  List<String> listMateri = ['HTML & CSS', 'Javascript', 'Flutter', 'React JS'];
  void _kirimdata() {
    AlertDialog alertDialog = AlertDialog(
      content: Container(
          height: 150,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child: Column(children: [
                  Row(
                    children: [
                      Text(
                        "Name: ${nama.text}",
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Email: ${email.text}",
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Phone Number: ${phone.text}",
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Password: ${password.text}",
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Materi: ${materi}",
                      )
                    ],
                  )
                ])),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Close"))
              ])),
    );
    showDialog(
        context: context,
        builder: (BuildContext Context) {
          return alertDialog;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
                controller: nama,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Name",
                  labelText: "Name",
                  prefixIcon: Icon(Icons.people),
                )),
            TextField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email",
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email),
                )),
            TextField(
                controller: phone,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Phone",
                  labelText: "Phone",
                  prefixIcon: Icon(Icons.phone),
                )),
            TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  labelText: "Password",
                  prefixIcon: Icon(Icons.password),
                )),
            DropdownButton(
              items: listMateri.map((String value) {
                return DropdownMenuItem(value: value, child: Text(value));
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  materi = value;
                });
              },
              value: materi,
              hint: Text("Materi Yang Akan Diambil"),
              isExpanded: true,
            ),
            Row(
              children:[
                Radio(
                  value: "Pria",
                  groupValue: jenisKelamin,
                  
                )
              ]
            ),
            ElevatedButton(
                onPressed: () {
                  _kirimdata();
                },
                child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
