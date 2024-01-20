import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:sinagaemas/modules/laporan_kegiatan/controller/laoran_kegiatan_controller.dart';
import 'package:sinagaemas/ormas.dart';

void main() => runApp(const LaporanOrmas());

/// This Widget is the main application widget.
class LaporanOrmas extends StatelessWidget {
  static const String _title = 'Tabel Laporan Kegiatan Ormas';

  const LaporanOrmas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatelessWidget(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  // MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.of(context).push(
          //   MaterialPageRoute(builder: (context) => DashboardPage(id: 0, tanggal: '', fullname: '', email: '', username: '', role: '', status: '', token: '',))
          //   );
        },
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
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(builder: (context) => Profil(fullname: '${this.widget.fullname}', email: '${this.widget.email}', username: '${this.widget.username}'))
                //   );
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.remove_red_eye_rounded,
                color: Colors.black,
              ),
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(builder: (context) => Ormas())
                //   );
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.cancel_rounded,
                color: Colors.black,
              ),
              onPressed: () {},
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
      body: SingleChildScrollView(
        child: DataTable(
          columnSpacing: (MediaQuery.of(context).size.width / 20) * 0.5,
          dataRowHeight: 100,
          columns: const <DataColumn>[
            DataColumn(
              label: Text(
                'Tanggal',
                // style: TextStyle(fontStyle: FontStyle.italic),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'Judul',
                // style: TextStyle(fontStyle: FontStyle.italic),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'Deskripsi',
                // style: TextStyle(fontStyle: FontStyle.italic),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'File',
                // style: TextStyle(fontStyle: FontStyle.italic),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'Action',
                // style: TextStyle(fontStyle: FontStyle.italic),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
          rows: [
            DataRow(
              cells: <DataCell>[
                const DataCell(Text('20 Desember 2023')),
                const DataCell(Text('Dummy Judul')),
                const DataCell(Text('Dummy Deskripsi')),
                const DataCell(Text('dummy.file')),
                DataCell(
                  SizedBox(
                    width: 84,
                    height: 45,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFF00E676),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {},
                      child: const Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Icon(Icons.picture_as_pdf_sharp),
                          Text('Lihat'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   // appBar: AppBar(
    //   //   title: const Text('Data Table'),
    //   // ),
    //   body: SingleChildScrollView(
    //     child: DataTable(
    //       columnSpacing: (MediaQuery.of(context).size.width / 20) * 0.5,
    //       dataRowHeight: 100,
    //       columns: const <DataColumn>[
    //         DataColumn(
    //           label: Text(
    //             'Tanggal',
    //             // style: TextStyle(fontStyle: FontStyle.italic),
    //             style: TextStyle(fontWeight: FontWeight.bold),
    //           ),
    //         ),
    //         DataColumn(
    //           label: Text(
    //             'Judul',
    //             // style: TextStyle(fontStyle: FontStyle.italic),
    //             style: TextStyle(fontWeight: FontWeight.bold),
    //           ),
    //         ),
    //         DataColumn(
    //           label: Text(
    //             'Deskripsi',
    //             // style: TextStyle(fontStyle: FontStyle.italic),
    //             style: TextStyle(fontWeight: FontWeight.bold),
    //           ),
    //         ),
    //         DataColumn(
    //           label: Text(
    //             'File',
    //             // style: TextStyle(fontStyle: FontStyle.italic),
    //             style: TextStyle(fontWeight: FontWeight.bold),
    //           ),
    //
    //         ),
    //         DataColumn(
    //           label: Text(
    //             'Action',
    //             // style: TextStyle(fontStyle: FontStyle.italic),
    //             style: TextStyle(fontWeight: FontWeight.bold),
    //           ),
    //
    //         ),
    //       ],
    //       rows: [
    //         DataRow(
    //           cells: <DataCell>[
    //             DataCell(Text('20 Desember 2023')),
    //             DataCell(Text('Dummy Judul')),
    //             DataCell(Text('Dummy Deskripsi')),
    //             DataCell(Text('dummy.file')),
    //             DataCell(
    //               Container(
    //                 width: 84,
    //                 height: 45,
    //                 child: TextButton(
    //                   style: TextButton.styleFrom(
    //                     backgroundColor: Color(0xFF00E676),
    //                     shape: RoundedRectangleBorder(
    //                       borderRadius: BorderRadius.circular(20),
    //                     ),
    //                   ),
    //                   onPressed: () {
    //                   },
    //                   child: Wrap(
    //                     crossAxisAlignment: WrapCrossAlignment.center,
    //                     children: [
    //                       Icon(Icons.picture_as_pdf_sharp),
    //                       Text('Lihat'),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
