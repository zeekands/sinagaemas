import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quickalert/quickalert.dart';
import 'package:sinagaemas/laporanormas.dart';
import 'package:sinagaemas/ormas.dart';
import 'package:sinagaemas/profil.dart';

import 'login_page.dart';

class DashboardPage extends StatefulWidget {
  final int id;
  final String tanggal;
  final String fullname;
  final String email;
  final String username;
  final String role;
  // final String gambar;
  // final String gambar_asli;
  final String status;
  final String token;

  DashboardPage(
      { required this.id,
        required this.tanggal,
        required this.fullname,
        required this.email,
        required this.username,
        required this.role,
        // required this.gambar,
        // required this.gambar_asli,
        required this.status,
        required this.token }
      );

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Future<void> handleLogout(String token) async {
    final url = 'http://sinagaemas.primasoft.co.id/api/logout';
    final headers = {
      'Authorization': 'Bearer ${this.widget.token}',
      'Content-Type': 'application/json',
    };

    QuickAlert.show(
      context: context,
      type: QuickAlertType.confirm,
      text: 'Do you want to logout',
      confirmBtnText: 'Yes',
      cancelBtnText: 'No',
      confirmBtnColor: Colors.green,
        onConfirmBtnTap: () async {
          final response = await http.post(Uri.parse(url), headers: headers);

          print(response.body);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
                (route) => false,
          );
          }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.widget.fullname} Dashboard'),
        // Tombol Logout posisi atas
        // actions: [
        //   IconButton(
        //     onPressed: () => handleLogout(this.widget.token),
        //     icon: Icon(Icons.logout),
        //   ),
        // ],
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
                Icons.person_pin_rounded,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Profil(fullname: '${this.widget.fullname}', email: '${this.widget.email}', username: '${this.widget.username}'))
                  );
                },
            ),
            IconButton(
              icon: const Icon(
                Icons.remove_red_eye_rounded,
                color: Colors.black,
              ),
              onPressed: ()
              {
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
                Icons.logout_rounded,
                color: Colors.red,
              ),
              onPressed: () => handleLogout(this.widget.token),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(""),
            ),
            Center(
              child: Text(""),
            ),
            Text('Welcome back, ${this.widget.fullname}!'),
            // SizedBox(height: 16.0),
            // Text('ID: ${this.widget.id}'),
            SizedBox(height: 16.0),
            // new ClipRRect(
            //     borderRadius: new BorderRadius.circular(30.0),
            //     child: Image.network('http://sinagaemas.primasoft.co.id/picture/accounts/${this.widget.gambar}',
            //         fit: BoxFit.cover,
            //         height: 100.0, width: 100.0),
            // ),
            // Text('${this.widget.gambar}'),
            SizedBox(height: 16.0),
            Text('Nama: ${this.widget.fullname}'),
            SizedBox(height: 16.0),
            Text('Email: ${this.widget.email}'),
            SizedBox(height: 16.0),
            // Text('Token:'),
            // Text('${this.widget.token}'),
            Container(
              width: 150,
              height: 45,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF1976D2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Profil(fullname: '${this.widget.fullname}', email: '${this.widget.email}', username: '${this.widget.username}'))
                  );
                },
                child: Text(
                  "View Profile",
                  style: TextStyle(
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ),
            Center(
              child: Text(""),
            ),
            // Horizontal Divider
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Image.asset(  'assets/images/test.webp',
                  //   height: 180, width: double.infinity, fit: BoxFit.cover,
                  // ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Text("Card Title", style: Theme.of(context).textTheme.headlineSmall),
                        // Container(
                        //   margin: const EdgeInsets.symmetric(vertical: 10),
                        //   child: Text("Sub title", style: Theme.of(context).textTheme.titleMedium),
                        // ),
                        const Text('DATA PENGURUS ORMAS'),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: const Divider(height: 1),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // const Text("Tonight's availability",style : TextStyle(fontWeight: FontWeight.bold),),
                        Container(width: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[300], elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                          ),
                          child: const Text("Ketua Ormas : "),
                          onPressed: (){},
                        ),
                        Container(width: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[300], elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                          ),
                          child: const Text("Sekretaris Ormas : "),
                          onPressed: (){},
                        ),
                        Container(height: 5),
                        Row(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[300], elevation: 0,
                                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                              ),
                              child: const Text("Bendahara Ormas : "),
                              onPressed: (){},
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Text(""),
            ),
            Text('DATA ORGANISASI MASYARAKAT (ORMAS)'),
            SizedBox(height: 16.0),
            Text('Nama Ormas : '),
            SizedBox(height: 16.0),
            Text('Nama Singkat Ormas : '),
            SizedBox(height: 16.0),
            Text('Alamat Sekretariat : '),
            SizedBox(height: 16.0),
            Text('Telepon Kantor Sekretariat : '),
            SizedBox(height: 16.0),
            Text('Bidang : '),
            SizedBox(height: 16.0),
            Container(
              width: 200,
              height: 45,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF43A047),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Ormas())
                  );
                },
                child: Text(
                  "View Detail Data Ormas",
                  style: TextStyle(
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ),
            Center(
              child: Text(""),
            ),
            // Horizontal Divider
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Image.asset(  'assets/images/test.webp',
                  //   height: 180, width: double.infinity, fit: BoxFit.cover,
                  // ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Text("Card Title", style: Theme.of(context).textTheme.headlineSmall),
                        // Container(
                        //   margin: const EdgeInsets.symmetric(vertical: 10),
                        //   child: Text("Sub title", style: Theme.of(context).textTheme.titleMedium),
                        // ),
                        const Text('Notifikasi'),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: const Divider(height: 1),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // const Text("Tonight's availability",style : TextStyle(fontWeight: FontWeight.bold),),
                        Container(width: 8),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.yellow[700], elevation: 0,
                              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                            ),
                            onPressed: () {},
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Icon(Icons.warning_amber),
                                Text(' Keterangan'),
                              ],
                            )
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Text(""),
            ),
            Text('Laporan Kegiatan ORMAS'),
            Center(
              child: Text(""),
            ),
            Container(
              width: 200,
              height: 45,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFFFFCDD2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LaporanOrmas())
                  );
                },
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(Icons.insert_chart_outlined_rounded),
                    Text(' Tabel Laporan'),
                  ],
                ),
              ),
            ),
            Center(
              child: Text(""),
            ),
            // Horizontal Divider
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Image.asset(  'assets/images/test.webp',
                  //   height: 180, width: double.infinity, fit: BoxFit.cover,
                  // ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Text("Card Title", style: Theme.of(context).textTheme.headlineSmall),
                        // Container(
                        //   margin: const EdgeInsets.symmetric(vertical: 10),
                        //   child: Text("Sub title", style: Theme.of(context).textTheme.titleMedium),
                        // ),
                        const Text('Tracking Pendaftaran'),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: const Divider(height: 1),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // const Text("Tonight's availability",style : TextStyle(fontWeight: FontWeight.bold),),

                        Container(height: 5),
                        Row(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[300], elevation: 0,
                                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                              ),
                              child: const Text("Tanggal"),
                              onPressed: (){},
                            ),
                            Container(width: 8),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[300], elevation: 0,
                                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                              ),
                              child: const Text("Jenis Permohonan"),
                              onPressed: (){},
                            ),
                            Container(width: 8),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[300], elevation: 0,
                                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                              ),
                              child: const Text("Status"),
                              onPressed: (){},
                            ),
                          ],
                        ),
                        Container(width: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[300], elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                          ),
                          child: const Text("Keterangan"),
                          onPressed: (){},
                        ),
                        Center(
                          child: Text(""),
                        ),
                        Text(''),
                        Center(
                          child: Text(""),
                        ),
                        Container(
                          width: 200,
                          height: 150,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('${this.widget.fullname} Dashboard'),
    //     actions: [
    //       IconButton(
    //         onPressed: () => handleLogout(this.widget.token),
    //         icon: Icon(Icons.logout),
    //       ),
    //     ],
    //   ),
    //   body: SingleChildScrollView(
    //     child: Column(
    //       // mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Center(
    //           child: Text(""),
    //         ),
    //         Center(
    //           child: Text(""),
    //         ),
    //         Text('Welcome back, ${this.widget.fullname}!'),
    //         // SizedBox(height: 16.0),
    //         // Text('ID: ${this.widget.id}'),
    //         SizedBox(height: 16.0),
    //         // new ClipRRect(
    //         //     borderRadius: new BorderRadius.circular(30.0),
    //         //     child: Image.network('http://sinagaemas.primasoft.co.id/picture/accounts/${this.widget.gambar}',
    //         //         fit: BoxFit.cover,
    //         //         height: 100.0, width: 100.0),
    //         // ),
    //         // Text('${this.widget.gambar}'),
    //         SizedBox(height: 16.0),
    //         Text('Nama: ${this.widget.fullname}'),
    //         SizedBox(height: 16.0),
    //         Text('Email: ${this.widget.email}'),
    //         SizedBox(height: 16.0),
    //         // Text('Token:'),
    //         // Text('${this.widget.token}'),
    //         Container(
    //           width: 150,
    //           height: 45,
    //           child: TextButton(
    //             style: TextButton.styleFrom(
    //               backgroundColor: Color(0xFF1976D2),
    //               shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(20),
    //               ),
    //             ),
    //             onPressed: () {
    //               Navigator.of(context).push(
    //                   MaterialPageRoute(builder: (context) => Profil(fullname: '${this.widget.fullname}', email: '${this.widget.email}', username: '${this.widget.username}'))
    //               );
    //             },
    //             child: Text(
    //               "View Profile",
    //               style: TextStyle(
    //                 color: Color(0xffffffff),
    //               ),
    //             ),
    //           ),
    //         ),
    //         Center(
    //           child: Text(""),
    //         ),
    //         // Horizontal Divider
    //         Card(
    //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    //           clipBehavior: Clip.antiAliasWithSaveLayer,
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: <Widget>[
    //               // Image.asset(  'assets/images/test.webp',
    //               //   height: 180, width: double.infinity, fit: BoxFit.cover,
    //               // ),
    //               Container(
    //                 padding: const EdgeInsets.all(15),
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: <Widget>[
    //                     // Text("Card Title", style: Theme.of(context).textTheme.headlineSmall),
    //                     // Container(
    //                     //   margin: const EdgeInsets.symmetric(vertical: 10),
    //                     //   child: Text("Sub title", style: Theme.of(context).textTheme.titleMedium),
    //                     // ),
    //                     const Text('DATA PENGURUS ORMAS'),
    //                   ],
    //                 ),
    //               ),
    //               Container(
    //                 margin: const EdgeInsets.symmetric(horizontal: 15),
    //                 child: const Divider(height: 1),
    //               ),
    //               Container(
    //                 padding: const EdgeInsets.all(15),
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: <Widget>[
    //                     // const Text("Tonight's availability",style : TextStyle(fontWeight: FontWeight.bold),),
    //                     Container(width: 8),
    //                     ElevatedButton(
    //                       style: ElevatedButton.styleFrom(
    //                         backgroundColor: Colors.grey[300], elevation: 0,
    //                         padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
    //                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
    //                       ),
    //                       child: const Text("Ketua Ormas : "),
    //                       onPressed: (){},
    //                     ),
    //                     Container(width: 8),
    //                     ElevatedButton(
    //                       style: ElevatedButton.styleFrom(
    //                         backgroundColor: Colors.grey[300], elevation: 0,
    //                         padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
    //                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
    //                       ),
    //                       child: const Text("Sekretaris Ormas : "),
    //                       onPressed: (){},
    //                     ),
    //                     Container(height: 5),
    //                     Row(
    //                       children: [
    //                         ElevatedButton(
    //                           style: ElevatedButton.styleFrom(
    //                             backgroundColor: Colors.grey[300], elevation: 0,
    //                             padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
    //                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
    //                           ),
    //                           child: const Text("Bendahara Ormas : "),
    //                           onPressed: (){},
    //                         ),
    //                       ],
    //                     )
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         Center(
    //           child: Text(""),
    //         ),
    //         Text('DATA ORGANISASI MASYARAKAT (ORMAS)'),
    //         SizedBox(height: 16.0),
    //         Text('Nama Ormas : '),
    //         SizedBox(height: 16.0),
    //         Text('Nama Singkat Ormas : '),
    //         SizedBox(height: 16.0),
    //         Text('Alamat Sekretariat : '),
    //         SizedBox(height: 16.0),
    //         Text('Telepon Kantor Sekretariat : '),
    //         SizedBox(height: 16.0),
    //         Text('Bidang : '),
    //         SizedBox(height: 16.0),
    //         Container(
    //           width: 200,
    //           height: 45,
    //           child: TextButton(
    //             style: TextButton.styleFrom(
    //               backgroundColor: Color(0xFF43A047),
    //               shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(20),
    //               ),
    //             ),
    //             onPressed: () {
    //               Navigator.of(context).push(
    //                   MaterialPageRoute(builder: (context) => Ormas())
    //               );
    //             },
    //             child: Text(
    //               "View Detail Data Ormas",
    //               style: TextStyle(
    //                 color: Color(0xffffffff),
    //               ),
    //             ),
    //           ),
    //         ),
    //         Center(
    //           child: Text(""),
    //         ),
    //         // Horizontal Divider
    //         Card(
    //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    //           clipBehavior: Clip.antiAliasWithSaveLayer,
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: <Widget>[
    //               // Image.asset(  'assets/images/test.webp',
    //               //   height: 180, width: double.infinity, fit: BoxFit.cover,
    //               // ),
    //               Container(
    //                 padding: const EdgeInsets.all(15),
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: <Widget>[
    //                     // Text("Card Title", style: Theme.of(context).textTheme.headlineSmall),
    //                     // Container(
    //                     //   margin: const EdgeInsets.symmetric(vertical: 10),
    //                     //   child: Text("Sub title", style: Theme.of(context).textTheme.titleMedium),
    //                     // ),
    //                     const Text('Notifikasi'),
    //                   ],
    //                 ),
    //               ),
    //               Container(
    //                 margin: const EdgeInsets.symmetric(horizontal: 15),
    //                 child: const Divider(height: 1),
    //               ),
    //               Container(
    //                 padding: const EdgeInsets.all(15),
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: <Widget>[
    //                     // const Text("Tonight's availability",style : TextStyle(fontWeight: FontWeight.bold),),
    //                     Container(width: 8),
    //                     ElevatedButton(
    //                       style: ElevatedButton.styleFrom(
    //                         backgroundColor: Colors.yellow[300], elevation: 0,
    //                         padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
    //                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
    //                       ),
    //                       onPressed: () {},
    //                       child: Wrap(
    //                         crossAxisAlignment: WrapCrossAlignment.center,
    //                         children: [
    //                           Icon(Icons.warning_amber),
    //                           Text(' Keterangan'),
    //                         ],
    //                       )
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         Center(
    //           child: Text(""),
    //         ),
    //         Text('Laporan Kegiatan ORMAS'),
    //         Center(
    //           child: Text(""),
    //         ),
    //         Container(
    //           width: 200,
    //           height: 45,
    //           child: TextButton(
    //             style: TextButton.styleFrom(
    //               backgroundColor: Color(0xFFFFCDD2),
    //               shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(20),
    //               ),
    //             ),
    //             onPressed: () {
    //               Navigator.of(context).push(
    //                   MaterialPageRoute(builder: (context) => LaporanOrmas())
    //               );
    //             },
    //               child: Wrap(
    //                 crossAxisAlignment: WrapCrossAlignment.center,
    //                 children: [
    //                   Icon(Icons.insert_chart_outlined_rounded),
    //                   Text(' Tabel Laporan'),
    //                 ],
    //               ),
    //           ),
    //         ),
    //         Center(
    //           child: Text(""),
    //         ),
    //         // Horizontal Divider
    //         Card(
    //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    //           clipBehavior: Clip.antiAliasWithSaveLayer,
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: <Widget>[
    //               // Image.asset(  'assets/images/test.webp',
    //               //   height: 180, width: double.infinity, fit: BoxFit.cover,
    //               // ),
    //               Container(
    //                 padding: const EdgeInsets.all(15),
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: <Widget>[
    //                     // Text("Card Title", style: Theme.of(context).textTheme.headlineSmall),
    //                     // Container(
    //                     //   margin: const EdgeInsets.symmetric(vertical: 10),
    //                     //   child: Text("Sub title", style: Theme.of(context).textTheme.titleMedium),
    //                     // ),
    //                     const Text('Tracking Pendaftaran'),
    //                   ],
    //                 ),
    //               ),
    //               Container(
    //                 margin: const EdgeInsets.symmetric(horizontal: 15),
    //                 child: const Divider(height: 1),
    //               ),
    //               Container(
    //                 padding: const EdgeInsets.all(15),
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: <Widget>[
    //                     // const Text("Tonight's availability",style : TextStyle(fontWeight: FontWeight.bold),),
    //
    //                     Container(height: 5),
    //                     Row(
    //                       children: [
    //                         ElevatedButton(
    //                           style: ElevatedButton.styleFrom(
    //                             backgroundColor: Colors.grey[300], elevation: 0,
    //                             padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
    //                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
    //                           ),
    //                           child: const Text("Tanggal"),
    //                           onPressed: (){},
    //                         ),
    //                         Container(width: 8),
    //                         ElevatedButton(
    //                           style: ElevatedButton.styleFrom(
    //                             backgroundColor: Colors.grey[300], elevation: 0,
    //                             padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
    //                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
    //                           ),
    //                           child: const Text("Jenis Permohonan"),
    //                           onPressed: (){},
    //                         ),
    //                         Container(width: 8),
    //                         ElevatedButton(
    //                           style: ElevatedButton.styleFrom(
    //                             backgroundColor: Colors.grey[300], elevation: 0,
    //                             padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
    //                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
    //                           ),
    //                           child: const Text("Status"),
    //                           onPressed: (){},
    //                         ),
    //                       ],
    //                     ),
    //                     Container(width: 8),
    //                     ElevatedButton(
    //                       style: ElevatedButton.styleFrom(
    //                         backgroundColor: Colors.grey[300], elevation: 0,
    //                         padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
    //                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
    //                       ),
    //                       child: const Text("Keterangan"),
    //                       onPressed: (){},
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}