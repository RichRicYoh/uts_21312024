import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

class AddProductController extends GetxController {
  late TextEditingController cNpm;
  late TextEditingController cNama;
  late TextEditingController cAlamat;
  late TextEditingController cProgram;
  late TextEditingController cJk;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> addProduct(
      String npm, String nama, String alamat, String jk, String program) async {
    CollectionReference mahasis = firestore.collection("mahasiswa");
    try {
      await mahasis.add({
        "npm": npm,
        "nama": nama,
        "alamat": alamat,
        "program_studi": program,
        "jk": jk
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data produk",
          onConfirm: () {
            cNpm.clear();
            cNama.clear();
            cAlamat.clear();
            cProgram.clear();
            cJk.clear();
            Get.back();
            Get.back();
            textConfirm:
            "OK";
          });
    } catch (e) {}
  }

  @override
  void onInit() {
    // TODO: implement onI
    cNpm = TextEditingController();
    cNama = TextEditingController();
    cAlamat = TextEditingController();
    cProgram = TextEditingController();
    cJk = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cNpm.dispose();
    cNama.dispose();
    cAlamat.dispose();
    cProgram.dispose();
    cJk.dispose();
    super.onClose();
  }
}
