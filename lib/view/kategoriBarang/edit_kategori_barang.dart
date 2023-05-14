import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:materiapi_2/controller/kategori_barang_controller.dart';
import 'package:materiapi_2/view/kategoriBarang/kategori_barang.dart';

class EditKategoriBrg extends StatefulWidget {
  const EditKategoriBrg({super.key, this.id, this.bfkategoriNama});

  final int? id;
  final String? bfkategoriNama;

  @override
  State<EditKategoriBrg> createState() => _EditKategoriBrgState();
}

class _EditKategoriBrgState extends State<EditKategoriBrg> {
  final kategoriController = BarangController();
  String? namaKategori;
  @override
  Widget build(BuildContext context) {
    var formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Data Kategor Barang"),
      ),
      body: Form(
        key: formkey,
        child: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Nama Kategori Barang',
              labelText: 'Nama Kategori Barang',
            ),
            onChanged: (value) {
              namaKategori = value;
            },
            initialValue: widget.bfkategoriNama,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Nama Kategori is required';
              }
              return null;
            },
          ),
          const SizedBox(height: 14.0),
          ElevatedButton(
            onPressed: () {
              if (formkey.currentState!.validate()) {
                formkey.currentState!.save();
                kategoriController.updateDataKategori(
                    widget.id!, namaKategori!);

                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const KategoriBarang()));

                var snackBar = const SnackBar(content: Text("Data Updated"));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            child: const Text('Update'),
          ),
        ],
      )),
    );
  }
}
