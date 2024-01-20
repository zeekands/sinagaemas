import 'package:flutter/material.dart';
import 'package:sinagaemas/data/models/ormas_model.dart';
import 'package:sinagaemas/laporanormas.dart';
import 'package:sinagaemas/utils/preview_pdf.dart';

class Ormas extends StatefulWidget {
  final OrmasItem item;

  const Ormas({super.key, required this.item});
  @override
  _OrmasState createState() => _OrmasState();
}

class _OrmasState extends State<Ormas> {
  // Whether the textfield is read-only or not
  final bool _isReadonly = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Organisasi Masyarakat")),
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LaporanOrmas()));
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
            const Center(
              child: Text(""),
            ),
            TextFormField(
              readOnly: _isReadonly,
              validator: (e) {
                if (e!.isEmpty) {
                  return "Masukkan Nama Ormas";
                }
                return null;
              },
              // onSaved: (e)=> role = e!,
              initialValue: widget.item.namaSingkatOrmas,
              decoration: const InputDecoration(
                  icon: Icon(Icons.insert_comment),
                  labelText: "Nama Singkat Ormas"),
            ),
            TextFormField(
              readOnly: _isReadonly,
              validator: (e) {
                if (e!.isEmpty) {
                  return "Masukkan Alamat Sekretariat";
                }
                return null;
              },
              // onSaved: (e)=> role = e!,
              initialValue: widget.item.alamatSekretariat,
              decoration: const InputDecoration(
                  icon: Icon(Icons.add_location_alt),
                  labelText: "Alamat Sekretariat"),
            ),
            TextFormField(
              readOnly: _isReadonly,
              validator: (e) {
                if (e!.isEmpty) {
                  return "Masukkan Kecamatan";
                }
                return null;
              },
              // onSaved: (e)=> role = e!,
              initialValue: widget.item.kecamatan,
              decoration: const InputDecoration(
                  icon: Icon(Icons.add_home_work), labelText: "Kecamatan"),
            ),
            TextFormField(
              readOnly: _isReadonly,
              validator: (e) {
                if (e!.isEmpty) {
                  return "Masukkan Kodepos";
                }
                return null;
              },
              // onSaved: (e)=> role = e!,
              initialValue: widget.item.kodepos.toString(),
              decoration: const InputDecoration(
                  icon: Icon(Icons.insert_comment), labelText: "Kodepos"),
            ),
            TextFormField(
              readOnly: _isReadonly,
              validator: (e) {
                if (e!.isEmpty) {
                  return "Masukkan No. SK Ormas";
                }
                return null;
              },
              // onSaved: (e)=> role = e!,
              initialValue: widget.item.noSkOrmas,
              decoration: const InputDecoration(
                  icon: Icon(Icons.insert_comment), labelText: "No. SK Ormas"),
            ),
            TextFormField(
              readOnly: _isReadonly,
              validator: (e) {
                if (e!.isEmpty) {
                  return "Masukkan No. Telpon Kantor Sekretariat";
                }
                return null;
              },
              // onSaved: (e)=> role = e!,
              initialValue: widget.item.noTelp,
              decoration: const InputDecoration(
                  icon: Icon(Icons.contact_phone),
                  labelText: "No. Telpon Kantor Sekretariat"),
            ),
            TextFormField(
              readOnly: _isReadonly,
              validator: (e) {
                if (e!.isEmpty) {
                  return "Masukkan Nama Bank";
                }
                return null;
              },
              // onSaved: (e)=> role = e!,
              initialValue: widget.item.namaBank,
              decoration: const InputDecoration(
                  icon: Icon(Icons.paid), labelText: "Nama Bank"),
            ),
            TextFormField(
              readOnly: _isReadonly,
              validator: (e) {
                if (e!.isEmpty) {
                  return "Masukkan Atas Nama";
                }
                return null;
              },
              // onSaved: (e)=> role = e!,
              initialValue: widget.item.namaPemilikBank,
              decoration: const InputDecoration(
                  icon: Icon(Icons.person), labelText: "Atas Nama"),
            ),
            TextFormField(
              readOnly: _isReadonly,
              validator: (e) {
                if (e!.isEmpty) {
                  return "Masukkan No. Rekening";
                }
                return null;
              },
              // onSaved: (e)=> role = e!,
              initialValue: widget.item.noRekening,
              decoration: const InputDecoration(
                  icon: Icon(Icons.add_card), labelText: "No. Rekening"),
            ),
            TextFormField(
              readOnly: _isReadonly,
              validator: (e) {
                if (e!.isEmpty) {
                  return "Masukkan Bidang Kegiatan";
                }
                return null;
              },
              // onSaved: (e)=> role = e!,
              initialValue: widget.item.bidangKegiatan,
              decoration: const InputDecoration(
                  icon: Icon(Icons.insert_comment),
                  labelText: "Bidang Kegiatan"),
            ),
            TextFormField(
              readOnly: _isReadonly,
              validator: (e) {
                if (e!.isEmpty) {
                  return "Masukkan Foto Kantor / Sekretariat Ormas";
                }
                return null;
              },
              // onSaved: (e)=> role = e!,
              initialValue: widget.item.fotoKantorOrmas,
              decoration: const InputDecoration(
                  icon: Icon(Icons.image),
                  labelText: "Foto Kantor / Sekretariat Ormas"),
            ),
            const SizedBox(
              height: 16,
            ),
            Image.network(
              "http://sinagaemas.primasoft.co.id/picture/fotokantorormas/${widget.item.fotoKantorOrmas}",
              width: 200,
              height: 200,
            ),
            TextFormField(
              readOnly: _isReadonly,
              validator: (e) {
                if (e!.isEmpty) {
                  return "Masukkan SKT / SK Kemenkumham";
                }
                return null;
              },
              // onSaved: (e)=> role = e!,
              initialValue: widget.item.skKemenkumham,
              decoration: InputDecoration(
                icon: const Icon(Icons.picture_as_pdf_outlined),
                labelText: "SKT / SK Kemenkumham",
                suffixIcon: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ViewPDFOnNewPage(
                              url:
                                  "http://sinagaemas.primasoft.co.id/uploadpdf/skkemenkumham/${widget.item.skKemenkumham}",
                              title: 'SKT / SK Kemenkumham')));
                    },
                    icon: const Icon(Icons.remove_red_eye)),
              ),
            ),
            const Center(
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
            const Center(
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
