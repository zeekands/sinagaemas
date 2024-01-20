import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:sinagaemas/modules/laporan_kegiatan/controller/laoran_kegiatan_controller.dart';
import 'package:sinagaemas/utils/base_state.dart';
import 'package:sinagaemas/utils/preview_pdf.dart';

class LaporanKegiatanView extends StatefulWidget {
  const LaporanKegiatanView({super.key});

  @override
  State<LaporanKegiatanView> createState() => _LaporanKegiatanViewState();
}

class _LaporanKegiatanViewState extends State<LaporanKegiatanView> {
  final controller =
      Get.put(LaporanKegiatanController(), tag: 'laporan_kegiatan');

  @override
  void dispose() {
    super.dispose();
    controller.onDelete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laporan Kegiatan'),
      ),
      body: Obx(() {
        final state = controller.dataKegiatan.value;

        switch (state.status) {
          case StatusState.initial:
            return const Center(child: CircularProgressIndicator());
          case StatusState.loading:
            return const Center(child: CircularProgressIndicator());
          case StatusState.success:
            return ListView.builder(
              itemCount: state.data?.length ?? 0,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final data = state.data?[index];
                return Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(bottom: 16),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${state.data?[index].tanggal}',
                          style: const TextStyle(fontSize: 12)),
                      Text(
                        '${state.data?[index].judul}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Keterangan : ${state.data?[index].deskripsi}',
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ViewPDFOnNewPage(
                                    url:
                                        "http://sinagaemas.primasoft.co.id/uploadpdf/filekegiatan/${state.data?[index].fileKegiatan}",
                                    title:
                                        '${state.data?[index].fileKegiatanAsli}')));
                          },
                          child: const Text('View File')),
                    ],
                  ),
                );
              },
            );
          case StatusState.error:
            return Center(child: Text(state.message));
        }
      }),
    );
  }
}
