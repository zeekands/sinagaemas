import 'package:get/get.dart';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart' as http;
import 'package:quickalert/quickalert.dart';
import 'package:sinagaemas/data/models/ormas_model.dart';
import 'package:sinagaemas/data/models/ormas_skkko.dart';
import 'package:sinagaemas/data/models/ormas_verification.dart';
import 'package:sinagaemas/data/providers/dashboard_provider.dart';
import 'package:sinagaemas/laporanormas.dart';
import 'package:sinagaemas/modules/dashboard/controller/dashboard_controller.dart';
import 'package:sinagaemas/modules/laporan_kegiatan/views/laporan_kegiatan_view.dart';
import 'package:sinagaemas/ormas.dart';
import 'package:sinagaemas/profil.dart';
import 'package:sinagaemas/utils/base_state.dart';

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

  const DashboardPage(
      {super.key,
      required this.id,
      required this.tanggal,
      required this.fullname,
      required this.email,
      required this.username,
      required this.role,
      // required this.gambar,
      // required this.gambar_asli,
      required this.status,
      required this.token});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Future<void> handleLogout(String token) async {
    const url = 'http://sinagaemas.primasoft.co.id/api/logout';
    final headers = {
      'Authorization': 'Bearer ${widget.token}',
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
          if (context.mounted) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
              (route) => false,
            );
          }
        });
  }

  final controller = Get.put(DashboardController());

  // var isLoading = false;
  // late OrmasItem? dataOrmas;
  // late List<SkkkoItem?> dataSkkko;
  // late List<OrmasItemVerification?> dataOrmasVerification;

  // @override
  // void initState() {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   super.initState();
  // }

  // Future<void> getSkkkoData() async {
  //   await DashboardProvider().getSkkkoData().then((value) async {
  //     var thisSkkko = value.data.data
  //         .where((element) => element.userId == widget.id)
  //         .toList();

  //     setState(() {
  //       if (thisSkkko.isNotEmpty) {
  //         dataSkkko = thisSkkko;
  //         isLoading = false;
  //       } else {
  //         dataSkkko = [];
  //         isLoading = false;
  //       }
  //     });
  //   });
  // }

  // Future<void> getOrmasData() async {
  //   await DashboardProvider().getOrmas().then((value) {
  //     var thisOrmas = value.data.data
  //         .where((element) => element.userId == widget.id)
  //         .toList();
  //     setState(() {
  //       if (thisOrmas.isNotEmpty) {
  //         dataOrmas = thisOrmas.first;
  //         isLoading = false;
  //       } else {
  //         dataOrmas = null;
  //         isLoading = false;
  //       }
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.fullname} Dashboard'),
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
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const DashboardPage(
                    id: 0,
                    tanggal: '',
                    fullname: '',
                    email: '',
                    username: '',
                    role: '',
                    status: '',
                    token: '',
                  )));
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
                Icons.person_pin_rounded,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Profil(
                        fullname: widget.fullname,
                        email: widget.email,
                        username: widget.username)));
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.remove_red_eye_rounded,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Ormas(
                          item: controller.dataOrmas.value.data!.first,
                        )));
              },
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
                Icons.logout_rounded,
                color: Colors.red,
              ),
              onPressed: () => handleLogout(widget.token),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Obx(
          () {
            final state = controller.dataOrmas.value;

            switch (state.status) {
              case StatusState.loading:
                return const Center(child: CircularProgressIndicator());
              case StatusState.initial:
                return const Center(child: CircularProgressIndicator());
              case StatusState.success:
                if (state.data?.isNotEmpty == true) {
                  return buildBody(context);
                } else {
                  return const Center(
                    child: Text('Data Tidak Ditemukan'),
                  );
                }
              case StatusState.error:
                return const Center(child: Text("Data Tidak Ditemukan!"));
            }
          },
        ),
      ),
    );
  }

  RefreshIndicator buildBody(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => controller.refresh(),
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () {
                final state = controller.dataOrmas.value;
                switch (state.status) {
                  case StatusState.loading:
                    return const Center(child: CircularProgressIndicator());
                  case StatusState.initial:
                    return const Center(child: CircularProgressIndicator());
                  case StatusState.success:
                    return Column(
                      children: [
                        const Center(
                          child: Text(""),
                        ),
                        const Center(
                          child: Text(""),
                        ),
                        Text('Welcome back, ${widget.fullname}!'),
                        // SizedBox(height: 16.0),
                        // Text('ID: ${this.widget.id}'),
                        const SizedBox(height: 16.0),
                        // new ClipRRect(
                        //     borderRadius: new BorderRadius.circular(30.0),
                        //     child: Image.network('http://sinagaemas.primasoft.co.id/picture/accounts/${this.widget.gambar}',
                        //         fit: BoxFit.cover,
                        //         height: 100.0, width: 100.0),
                        // ),
                        // Text('${this.widget.gambar}'),
                        const SizedBox(height: 16.0),
                        Text('Nama: ${widget.fullname}'),
                        const SizedBox(height: 16.0),
                        Text('Email: ${widget.email}'),
                        const SizedBox(height: 16.0),
                        // Text('Token:'),
                        // Text('${this.widget.token}'),
                        SizedBox(
                          width: 150,
                          height: 45,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: const Color(0xFF1976D2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Profil(
                                      fullname: widget.fullname,
                                      email: widget.email,
                                      username: widget.username)));
                            },
                            child: const Text(
                              "View Profile",
                              style: TextStyle(
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                        const Center(
                          child: Text(""),
                        ),
                        // Horizontal Divider
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // Image.asset(  'assets/images/test.webp',
                              //   height: 180, width: double.infinity, fit: BoxFit.cover,
                              // ),
                              Container(
                                padding: const EdgeInsets.all(15),
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    // Text("Card Title", style: Theme.of(context).textTheme.headlineSmall),
                                    // Container(
                                    //   margin: const EdgeInsets.symmetric(vertical: 10),
                                    //   child: Text("Sub title", style: Theme.of(context).textTheme.titleMedium),
                                    // ),
                                    Text('DATA PENGURUS ORMAS'),
                                  ],
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 15),
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
                                        backgroundColor: Colors.grey[300],
                                        elevation: 0,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 20),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0)),
                                      ),
                                      child: Text(
                                          "Ketua Ormas : ${state.data![0].namaKetua}"),
                                      onPressed: () {},
                                    ),
                                    Container(width: 8),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.grey[300],
                                        elevation: 0,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 20),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0)),
                                      ),
                                      child: Text(
                                          "Sekretaris Ormas : ${state.data![0].namaSekretaris}"),
                                      onPressed: () {},
                                    ),
                                    Container(height: 5),
                                    Row(
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.grey[300],
                                            elevation: 0,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 0, horizontal: 20),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        18.0)),
                                          ),
                                          child: Text(
                                              "Bendahara Ormas : ${state.data![0].namaBendahara}"),
                                          onPressed: () {},
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Center(
                          child: Text(""),
                        ),
                        const Text('DATA ORGANISASI MASYARAKAT (ORMAS)'),
                        const SizedBox(height: 16.0),
                        Text('Nama Ormas : ${state.data![0].namaOrmas}'),
                        const SizedBox(height: 16.0),
                        Text(
                            'Nama Singkat Ormas : ${state.data![0].namaSingkatOrmas}'),
                        const SizedBox(height: 16.0),
                        Text(
                            'Alamat Sekretariat : ${state.data![0].alamatSekretariat}'),
                        const SizedBox(height: 16.0),
                        Text(
                            'Telepon Kantor Sekretariat : ${state.data![0].noTelp}'),
                        const SizedBox(height: 16.0),
                        Text('Bidang : ${state.data![0].bidangKegiatan}'),
                        const SizedBox(height: 16.0),
                        SizedBox(
                          width: 200,
                          height: 45,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: const Color(0xFF43A047),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Ormas(
                                        item: state.data![0],
                                      )));
                            },
                            child: const Text(
                              "View Detail Data Ormas",
                              style: TextStyle(
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                        const Center(
                          child: Text(""),
                        ),
                      ],
                    );
                  case StatusState.error:
                    return Text(state.message);
                }
              },
            ),

            // Horizontal Divider
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Notifikasi'),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: const Divider(height: 1),
                    ),
                    Obx(() {
                      final dataVerifikasi = controller.dataVerifikasi.value;
                      switch (dataVerifikasi.status) {
                        case StatusState.initial:
                          return const Center(
                              child: CircularProgressIndicator());
                        case StatusState.loading:
                          return const Center(
                              child: CircularProgressIndicator());
                        case StatusState.success:
                          return ListView.builder(
                            itemCount: dataVerifikasi.data?.length,
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(15),
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => Container(
                              padding: const EdgeInsets.all(15),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              decoration: const BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.notification_important),
                                  Flexible(
                                    child: Text(
                                        '${dataVerifikasi.data?[index].keterangan}'),
                                  ),
                                ],
                              ),
                            ),
                          );

                        case StatusState.error:
                          return Text(dataVerifikasi.message);
                      }
                    }),
                  ],
                ),
              ),
            ),
            const Center(
              child: Text(""),
            ),
            const Text('Laporan Kegiatan ORMAS'),
            const Center(
              child: Text(""),
            ),
            SizedBox(
              width: 200,
              height: 45,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFFFFCDD2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LaporanKegiatanView()));
                },
                child: const Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(Icons.insert_chart_outlined_rounded),
                    Text(' Tabel Laporan'),
                  ],
                ),
              ),
            ),
            const Center(
              child: Text(""),
            ),
            // Horizontal Divider
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(15),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Tracking Pendaftaran'),
                        ],
                      ),
                    ),
                    const Divider(height: 1),
                    Obx(() {
                      final dataSkkko = controller.dataSkkko.value;

                      switch (dataSkkko.status) {
                        case StatusState.initial:
                          return const Center(
                              child: CircularProgressIndicator());
                        case StatusState.loading:
                          return const Center(
                              child: CircularProgressIndicator());
                        case StatusState.success:
                          if (dataSkkko.data?.isEmpty == true ||
                              dataSkkko.data == null) {
                            return const Center(
                                child: Text('Data Tidak Ditemukan'));
                          }
                          return ListView.builder(
                              itemCount: dataSkkko.data?.length,
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(15),
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 5.0,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          '${dataSkkko.data?[index].tanggalSkkko}',
                                          style: const TextStyle(fontSize: 12)),
                                      Text(
                                        '${dataSkkko.data?[index].pendaftaran}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        '${controller.dataVerifikasi.value.data?[index].status}',
                                        style:
                                            const TextStyle(color: Colors.red),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                          'Keterangan : ${controller.dataVerifikasi.value.data?[index].keterangan}'),
                                    ],
                                  ),
                                );
                              });

                        case StatusState.error:
                          return Text(dataSkkko.message);
                      }
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
