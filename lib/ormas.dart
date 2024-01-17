import 'package:flutter/material.dart';
import 'package:sinagaemas/laporanormas.dart';

class Ormas extends StatefulWidget {
  @override
  _OrmasState createState() => _OrmasState();
}

class _OrmasState extends State<Ormas> {

  // Whether the textfield is read-only or not
  bool _isReadonly = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Detail Organisasi Masyarakat")
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
                Icons.cancel_rounded,
                color: Colors.black,
              ),
              onPressed: () {},
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
            TextFormField(
              readOnly: _isReadonly,
              validator: (e) {
                if (e!.isEmpty) {
                  return "Masukkan Nama Ormas";
                }
              },
              // onSaved: (e)=> role = e!,
              initialValue: '',
              decoration: InputDecoration(
                  icon: Icon(Icons.insert_comment),
                  labelText: "Nama Singkat Ormas"
              ),
            ),
            TextFormField(
              readOnly: _isReadonly,
              validator: (e) {
                if (e!.isEmpty) {
                  return "Masukkan Alamat Sekretariat";
                }
              },
              // onSaved: (e)=> role = e!,
              initialValue: '',
              decoration: InputDecoration(
                  icon: Icon(Icons.add_location_alt),
                  labelText: "Alamat Sekretariat"
              ),
            ),
            TextFormField(
              readOnly: _isReadonly,
              validator: (e) {
                if (e!.isEmpty) {
                  return "Masukkan Kecamatan";
                }
              },
              // onSaved: (e)=> role = e!,
              initialValue: '',
              decoration: InputDecoration(
                  icon: Icon(Icons.add_home_work),
                  labelText: "Kecamatan"
              ),
            ),
            TextFormField(
              readOnly: _isReadonly,
              validator: (e) {
                if (e!.isEmpty) {
                  return "Masukkan Kodepos";
                }
              },
              // onSaved: (e)=> role = e!,
              initialValue: '',
              decoration: InputDecoration(
                  icon: Icon(Icons.insert_comment),
                  labelText: "Kodepos"
              ),
            ),
            TextFormField(
              readOnly: _isReadonly,
              validator: (e) {
                if (e!.isEmpty) {
                  return "Masukkan No. SK Ormas";
                }
              },
              // onSaved: (e)=> role = e!,
              initialValue: '',
              decoration: InputDecoration(
                  icon: Icon(Icons.insert_comment),
                  labelText: "No. SK Ormas"
              ),
            ),
            TextFormField(
              readOnly: _isReadonly,
              validator: (e) {
                if (e!.isEmpty) {
                  return "Masukkan No. Telpon Kantor Sekretariat";
                }
              },
              // onSaved: (e)=> role = e!,
              initialValue: '',
              decoration: InputDecoration(
                  icon: Icon(Icons.contact_phone),
                  labelText: "No. Telpon Kantor Sekretariat"
              ),
            ),
            TextFormField(
              readOnly: _isReadonly,
              validator: (e) {
                if (e!.isEmpty) {
                  return "Masukkan Nama Bank";
                }
              },
              // onSaved: (e)=> role = e!,
              initialValue: '',
              decoration: InputDecoration(
                  icon: Icon(Icons.paid),
                  labelText: "Nama Bank"
              ),
            ),
            TextFormField(
              readOnly: _isReadonly,
              validator: (e) {
                if (e!.isEmpty) {
                  return "Masukkan Atas Nama";
                }
              },
              // onSaved: (e)=> role = e!,
              initialValue: '',
              decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: "Atas Nama"
              ),
            ),
            TextFormField(
              readOnly: _isReadonly,
              validator: (e) {
                if (e!.isEmpty) {
                  return "Masukkan No. Rekening";
                }
              },
              // onSaved: (e)=> role = e!,
              initialValue: '',
              decoration: InputDecoration(
                  icon: Icon(Icons.add_card),
                  labelText: "No. Rekening"
              ),
            ),
            TextFormField(
              readOnly: _isReadonly,
              validator: (e) {
                if (e!.isEmpty) {
                  return "Masukkan Bidang Kegiatan";
                }
              },
              // onSaved: (e)=> role = e!,
              initialValue: '',
              decoration: InputDecoration(
                  icon: Icon(Icons.insert_comment),
                  labelText: "Bidang Kegiatan"
              ),
            ),
            TextFormField(
              readOnly: _isReadonly,
              validator: (e) {
                if (e!.isEmpty) {
                  return "Masukkan Foto Kantor / Sekretariat Ormas";
                }
              },
              // onSaved: (e)=> role = e!,
              initialValue: '',
              decoration: InputDecoration(
                  icon: Icon(Icons.image),
                  labelText: "Foto Kantor / Sekretariat Ormas"
              ),
            ),
            TextFormField(
              readOnly: _isReadonly,
              validator: (e) {
                if (e!.isEmpty) {
                  return "Masukkan SKT / SK Kemenkumham";
                }
              },
              // onSaved: (e)=> role = e!,
              initialValue: '',
              decoration: InputDecoration(
                  icon: Icon(Icons.picture_as_pdf_outlined),
                  labelText: "SKT / SK Kemenkumham"
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
    // return Scaffold(
    //     appBar: AppBar(
    //         title: Text("Detail Organisasi Masyarakat")
    //     ),
    //     body: Form(
    //       child: ListView(
    //         children: <Widget>[
    //           Center(
    //             child: Text(""),
    //           ),
    //           TextFormField(
    //             readOnly: _isReadonly,
    //             validator: (e) {
    //               if (e!.isEmpty) {
    //                 return "Masukkan Nama Ormas";
    //               }
    //             },
    //             // onSaved: (e)=> role = e!,
    //             initialValue: '',
    //             decoration: InputDecoration(
    //                 icon: Icon(Icons.insert_comment),
    //                 labelText: "Nama Singkat Ormas"
    //             ),
    //           ),
    //           TextFormField(
    //             readOnly: _isReadonly,
    //             validator: (e) {
    //               if (e!.isEmpty) {
    //                 return "Masukkan Alamat Sekretariat";
    //               }
    //             },
    //             // onSaved: (e)=> role = e!,
    //             initialValue: '',
    //             decoration: InputDecoration(
    //                 icon: Icon(Icons.add_location_alt),
    //                 labelText: "Alamat Sekretariat"
    //             ),
    //           ),
    //           TextFormField(
    //             readOnly: _isReadonly,
    //             validator: (e) {
    //               if (e!.isEmpty) {
    //                 return "Masukkan Kecamatan";
    //               }
    //             },
    //             // onSaved: (e)=> role = e!,
    //             initialValue: '',
    //             decoration: InputDecoration(
    //                 icon: Icon(Icons.add_home_work),
    //                 labelText: "Kecamatan"
    //             ),
    //           ),
    //           TextFormField(
    //             readOnly: _isReadonly,
    //             validator: (e) {
    //               if (e!.isEmpty) {
    //                 return "Masukkan Kodepos";
    //               }
    //             },
    //             // onSaved: (e)=> role = e!,
    //             initialValue: '',
    //             decoration: InputDecoration(
    //                 icon: Icon(Icons.insert_comment),
    //                 labelText: "Kodepos"
    //             ),
    //           ),
    //           TextFormField(
    //             readOnly: _isReadonly,
    //             validator: (e) {
    //               if (e!.isEmpty) {
    //                 return "Masukkan No. SK Ormas";
    //               }
    //             },
    //             // onSaved: (e)=> role = e!,
    //             initialValue: '',
    //             decoration: InputDecoration(
    //                 icon: Icon(Icons.insert_comment),
    //                 labelText: "No. SK Ormas"
    //             ),
    //           ),
    //           TextFormField(
    //             readOnly: _isReadonly,
    //             validator: (e) {
    //               if (e!.isEmpty) {
    //                 return "Masukkan No. Telpon Kantor Sekretariat";
    //               }
    //             },
    //             // onSaved: (e)=> role = e!,
    //             initialValue: '',
    //             decoration: InputDecoration(
    //                 icon: Icon(Icons.contact_phone),
    //                 labelText: "No. Telpon Kantor Sekretariat"
    //             ),
    //           ),
    //           TextFormField(
    //             readOnly: _isReadonly,
    //             validator: (e) {
    //               if (e!.isEmpty) {
    //                 return "Masukkan Nama Bank";
    //               }
    //             },
    //             // onSaved: (e)=> role = e!,
    //             initialValue: '',
    //             decoration: InputDecoration(
    //                 icon: Icon(Icons.paid),
    //                 labelText: "Nama Bank"
    //             ),
    //           ),
    //           TextFormField(
    //             readOnly: _isReadonly,
    //             validator: (e) {
    //               if (e!.isEmpty) {
    //                 return "Masukkan Atas Nama";
    //               }
    //             },
    //             // onSaved: (e)=> role = e!,
    //             initialValue: '',
    //             decoration: InputDecoration(
    //                 icon: Icon(Icons.person),
    //                 labelText: "Atas Nama"
    //             ),
    //           ),
    //           TextFormField(
    //             readOnly: _isReadonly,
    //             validator: (e) {
    //               if (e!.isEmpty) {
    //                 return "Masukkan No. Rekening";
    //               }
    //             },
    //             // onSaved: (e)=> role = e!,
    //             initialValue: '',
    //             decoration: InputDecoration(
    //                 icon: Icon(Icons.add_card),
    //                 labelText: "No. Rekening"
    //             ),
    //           ),
    //           TextFormField(
    //             readOnly: _isReadonly,
    //             validator: (e) {
    //               if (e!.isEmpty) {
    //                 return "Masukkan Bidang Kegiatan";
    //               }
    //             },
    //             // onSaved: (e)=> role = e!,
    //             initialValue: '',
    //             decoration: InputDecoration(
    //                 icon: Icon(Icons.insert_comment),
    //                 labelText: "Bidang Kegiatan"
    //             ),
    //           ),
    //           TextFormField(
    //             readOnly: _isReadonly,
    //             validator: (e) {
    //               if (e!.isEmpty) {
    //                 return "Masukkan Foto Kantor / Sekretariat Ormas";
    //               }
    //             },
    //             // onSaved: (e)=> role = e!,
    //             initialValue: '',
    //             decoration: InputDecoration(
    //                 icon: Icon(Icons.image),
    //                 labelText: "Foto Kantor / Sekretariat Ormas"
    //             ),
    //           ),
    //           TextFormField(
    //             readOnly: _isReadonly,
    //             validator: (e) {
    //               if (e!.isEmpty) {
    //                 return "Masukkan SKT / SK Kemenkumham";
    //               }
    //             },
    //             // onSaved: (e)=> role = e!,
    //             initialValue: '',
    //             decoration: InputDecoration(
    //                 icon: Icon(Icons.picture_as_pdf_outlined),
    //                 labelText: "SKT / SK Kemenkumham"
    //             ),
    //           ),
    //           Center(
    //             child: Text(""),
    //           ),
    //           // Center(
    //           //   child: ElevatedButton(
    //           //     onPressed: () {
    //           //
    //           //     },
    //           //     child: const Text("Kembali"),
    //           //   ),
    //           // ),
    //           Center(
    //             child: Text(""),
    //           ),
    //         ],
    //       ),
    //     ),
    // );
  }
}