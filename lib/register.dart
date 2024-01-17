import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/quickalert.dart';
import 'package:sinagaemas/login_page.dart';

extension toLokalDate on DateTime {
  String? toLokal() {
    initializeDateFormatting();
    try {
      return new DateFormat.yMMMMd ('id') .format(this);
    } catch (e) {
      return null;
    }
  }
}

class Register extends StatefulWidget {
  const Register({super.key});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  // TextEditingController tanggal = TextEditingController();
  //text editing controller for text field

  // This controller is connected to the text field
  late TextEditingController _controller;

  // Whether the textfield is read-only or not
  bool _isReadonly = true;

  // Whether the text field is disabled or enabled
  // bool _isDisabled = true;

  late String tanggal,fullname,email,username,role,password;
  final _key = new GlobalKey<FormState>();

  register() async {
    final response = await http.post(Uri.parse('http://sinagaemas.primasoft.co.id/api/register'), body: {
      "tanggal": tanggal,
      "fullname": fullname,
      "email": email,
      "username": username,
      "role": role,
      "password": password
    });
    final data = jsonDecode(response.body);
    print(data);
  }

  bool _secureText = false;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  registercheck() {
    final form = _key.currentState;
    if (form!.validate()) {
      form.save();
      register();
      // Notifikasi Gagal Register
      // showAlertDialog();

      // Notifikasi Quick Alert
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        text: 'Registrasi Berhasil! Menunggu Aproval Admin!',
        confirmBtnText: 'Ok',
          confirmBtnColor: Colors.green,
          //berpindah halaman ke login
          onConfirmBtnTap: () async {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false,
            );
          }
      );
    }
  }

  // @override
  // void initState() {
  //   tanggal.text = ""; //set the initial value of text field
  //   super.initState();
  // }

  // Notifikasi Berhasil Register
  // showAlertDialog() {
  //
  //   // set up the button
  //   Widget okButton = TextButton(
  //     child: Text("OK"),
  //     onPressed: () { Navigator.of(context).push(
  //         MaterialPageRoute(builder: (context) => LoginPage())
  //     );
  //     },
  //   );
  //
  //   // set up the AlertDialog
  //   AlertDialog alert = AlertDialog(
  //     title: Text("Register Berhasil"),
  //     content: Text("Menunggu Approval Admin."),
  //     actions: [
  //       okButton,
  //     ],
  //   );
  //
  //   // show the dialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Register")
        ),
        body: Form(
          key: _key,
          child: ListView(
            children: <Widget>[
              Center(
                child: Image.asset('assets/images/logo-kota-mojokerto.png'),
              ),
              Center(
                child: Text(""),
              ),
              Center(
                child: Text("Sistem Informasi Registrasi, Evaluasi,"),
              ),
              Center(
                child: Text(" dan Pelaporan Organisasi Masyarakat"),
              ),
              Center(
                child: Text(""),
              ),
              Center(
                child: Text("Form Registrasi"),
              ),
              // Center(
              //     child:TextFormField(
              //       validator: (e) {
              //         if (e!.isEmpty) {
              //           return "Masukkan Tanggal";
              //         }
              //       },
              //       controller: tanggal, //editing controller of this TextField
              //       decoration: InputDecoration(
              //           icon: Icon(Icons.calendar_today), //icon of text field
              //           labelText: "Tanggal" //label text of field
              //       ),
              //       readOnly: true,  //set it true, so that user will not able to edit text
              //       onTap: () async {
              //         DateTime? pickedDate = await showDatePicker(
              //             context: context, initialDate: DateTime.now(),
              //             firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
              //             lastDate: DateTime(2101)
              //         );
              //
              //         if(pickedDate != null ){
              //           print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
              //           String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
              //           print(formattedDate); //formatted date output using intl package =>  2021-03-16
              //           //you can implement different kind of Date Format here according to your requirement
              //
              //           setState(() {
              //             tanggal.text = formattedDate; //set output date to TextField value.
              //           });
              //         }else{
              //           print("Date is not selected");
              //         }
              //       },
              //     ),
              // ),
              Visibility(
                child: Text(DateTime.now().toLokal().toString()),
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                visible: false,
              ),
              TextFormField(
                readOnly: _isReadonly,
                validator: (e) {
                  if (e!.isEmpty) {
                    return "Masukkan Tanggal";
                  }
                },
                onSaved: (e)=> tanggal = e!,
                initialValue: DateTime.now().toLokal().toString(),
                decoration: InputDecoration(
                    icon: Icon(Icons.calendar_month),
                    labelText: "Tanggal"
                ),
              ),
              TextFormField(
                validator: (e) {
                  if (e!.isEmpty) {
                    return "Masukkan Nama";
                  }
                },
                onSaved: (e)=> fullname = e!,
                decoration: InputDecoration(
                    icon: Icon(Icons.assignment),
                    labelText: "Nama Lengkap"
                ),
              ),
              TextFormField(
                validator: (e){
                  if (e!.isEmpty){
                    return "Masukkan Email";
                  }
                },
                onSaved: (e)=> email = e!,
                decoration: InputDecoration(
                    icon: Icon(Icons.attach_email),
                    labelText: "Email"
                ),
              ),
              TextFormField(
                validator: (e){
                  if (e!.isEmpty){
                    return "Masukkan Username";
                  }
                },
                onSaved: (e)=> username = e!,
                decoration: InputDecoration(
                    icon: Icon(Icons.account_circle_rounded),
                    labelText: "Username"
                ),
              ),
              TextFormField(
                // readOnly: _isReadonly,
                // enabled: !_isDisabled,
                validator: (e) {
                  if (e!.isEmpty) {
                    return "Masukkan Role";
                  }
                },
                obscureText: true,
                onSaved: (e)=> role = e!,
                initialValue: "user",
                decoration: InputDecoration(
                    icon: Icon(Icons.supervisor_account),
                    labelText: "Role",
                    enabled: false //disable this text field input
                ),
              ),
              TextFormField(
                validator: (e) {
                  if (e!.isEmpty) {
                    return "Masukkan Password";
                  }
                },
                obscureText: _secureText,
                onSaved: (e) => password = e!,
                decoration: InputDecoration(
                  icon: Icon(Icons.key),
                  labelText: "Password",
                  suffixIcon: IconButton(
                    onPressed: showHide,
                    icon: Icon(
                        _secureText ? Icons.visibility_off : Icons.visibility
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(""),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    registercheck();
                    // Navigator.pop(context);
                  },
                  child: const Text("Register"),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPage())
                  );
                },
                child: Text("Sudah memiliki akun ? Login"),
              ),
              Center(
                child: Text(""),
              ),
              Center(
                child: Text(""),
              ),
              Center(
                child: Text("© 2024 Diskominfo Kota Mojokerto."),
              ),
            ],
          ),
        ));
  }
}