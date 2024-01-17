import 'package:flutter/material.dart';

class Depan extends StatelessWidget {
  const Depan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Home")
        ),
        body: Form(
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          // decoration: const BoxDecoration(color: Colors.yellow),
          // child: const Icon(
          //   Icons.home,
          //   size: 70,
          // ),
            child: ListView(
                children: <Widget>[
                  Center(
                  child: Image.asset('assets/images/sinagaemas.png'),
                  ),
                  Center(
                    child: Text(""),
                  ),
                  Center(
                    child: Text("Dasar:",
                      style: TextStyle(
                      fontSize: 22,
                      color: Colors.red,
                    ),
                    ),
                  ),
                  Center(
                    child: Text(""),
                  ),
                  Center(
                    child: Text("1. Undang-Undang Nomor 17 Tahun 2013 tentang Organisasi Kemasyarakatan;",
                      style: TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                    ),
                    ),
                  ),
                  Center(
                    child: Text(""),
                  ),
                  Center(
                    child: Text("2. Permendagri Nomor 57 Tahun 2017 tentang Pendaftaran dan Pengelolaan Sistem Informasi Organisasi Kemasyarakatan",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(""),
                  ),
                  Center(
                    child: Text("Bakesbangpol"),
                  ),
                  Center(
                    child: Text("- Kota Mojokerto -"),
                  ),
                ],
        ),
    ));
  }
}