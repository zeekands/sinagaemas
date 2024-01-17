import 'package:flutter/material.dart';
import 'package:sinagaemas/laporanormas.dart';
import 'package:sinagaemas/ormas.dart';

class Profil extends StatefulWidget {
  final String fullname;
  final String email;
  final String username;
  Profil(
      {
        required this.fullname,
        required this.email,
        required this.username,
      }
      );
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {

  // Whether the textfield is read-only or not
  bool _isReadonly = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("View data user")
      ),
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.yellow[400],
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 60,
        color: Colors.yellow.shade400,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.cancel_rounded,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.remove_red_eye_rounded,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Ormas())
                  );
                },
            ),
            IconButton(

              icon: const Icon(
                Icons.bar_chart_rounded,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LaporanOrmas())
                  );
                },
            ),
            IconButton(
              icon: const Icon(
                Icons.cancel_rounded,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Form(
        child: ListView(
          children: <Widget>[
            Center(
              child: Text(""),
            ),
            // Center(
            //   child: Text("Detai Data User"),
            // ),
            TextFormField(
              readOnly: _isReadonly,
              validator: (e) {
                if (e!.isEmpty) {
                  return "Masukkan Nama Lengkap";
                }
              },
              // onSaved: (e)=> role = e!,
              initialValue: '${this.widget.fullname}',
              decoration: InputDecoration(
                  icon: Icon(Icons.supervisor_account),
                  labelText: "Nama Lengkap"
              ),
            ),
            TextFormField(
              readOnly: _isReadonly,
              validator: (e) {
                if (e!.isEmpty) {
                  return "Masukkan Email";
                }
              },
              // onSaved: (e)=> role = e!,
              initialValue: '${this.widget.email}',
              decoration: InputDecoration(
                  icon: Icon(Icons.attach_email),
                  labelText: "Email"
              ),
            ),
            TextFormField(
              readOnly: _isReadonly,
              validator: (e) {
                if (e!.isEmpty) {
                  return "Masukkan Username";
                }
              },
              // onSaved: (e)=> role = e!,
              initialValue: '${this.widget.username}',
              decoration: InputDecoration(
                  icon: Icon(Icons.account_circle_rounded),
                  labelText: "Username"
              ),
            ),
            Center(
              child: Text(""),
            ),
            // Center(
            //   child: ElevatedButton(
            //     onPressed: () {
            //
            //     },
            //     child: const Text("Kembali"),
            //   ),
            // ),
            Center(
              child: Text(""),
            ),
          ],
        ),
      ),
    );
    return Scaffold(
        appBar: AppBar(
            title: Text("View data user")
        ),
        body: Form(
          child: ListView(
            children: <Widget>[
              Center(
                child: Text(""),
              ),
              // Center(
              //   child: Text("Detai Data User"),
              // ),
              TextFormField(
                readOnly: _isReadonly,
                validator: (e) {
                  if (e!.isEmpty) {
                    return "Masukkan Nama Lengkap";
                  }
                },
                // onSaved: (e)=> role = e!,
                initialValue: '${this.widget.fullname}',
                decoration: InputDecoration(
                    icon: Icon(Icons.supervisor_account),
                    labelText: "Nama Lengkap"
                ),
              ),
              TextFormField(
                readOnly: _isReadonly,
                validator: (e) {
                  if (e!.isEmpty) {
                    return "Masukkan Email";
                  }
                },
                // onSaved: (e)=> role = e!,
                initialValue: '${this.widget.email}',
                decoration: InputDecoration(
                    icon: Icon(Icons.attach_email),
                    labelText: "Email"
                ),
              ),
              TextFormField(
                readOnly: _isReadonly,
                validator: (e) {
                  if (e!.isEmpty) {
                    return "Masukkan Username";
                  }
                },
                // onSaved: (e)=> role = e!,
                initialValue: '${this.widget.username}',
                decoration: InputDecoration(
                    icon: Icon(Icons.account_circle_rounded),
                    labelText: "Username"
                ),
              ),
              Center(
                child: Text(""),
              ),
              // Center(
              //   child: ElevatedButton(
              //     onPressed: () {
              //
              //     },
              //     child: const Text("Kembali"),
              //   ),
              // ),
              Center(
                child: Text(""),
              ),
            ],
          ),
        ),
    );
  }
}