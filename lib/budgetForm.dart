// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:pbp_flutter_lab/budgetData.dart';

import 'models/budgetModel.dart';
import 'main.dart';

// ignore: camel_case_types
class budgetForm extends StatefulWidget {
  const budgetForm({super.key});

  @override
  State<budgetForm> createState() => _budgetFormState();
}

// ignore: camel_case_types
class _budgetFormState extends State<budgetForm> {
  final _formKey = GlobalKey<FormState>();
  String? _judul;
  String? _nominal;
  String? _hari;
  DateTime? _tanggal;
  String tipe = "Pilih Jenis";
  List<String> daftarTipe = ["Pilih Jenis", "Pemasukan", "Pengeluaran"];
  static List<Budget> daftarBudget = [];

  void _tambahBudget() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _hari = _tanggal.toString();
        Budget budget =
            Budget(_judul!, _nominal!, tipe, _hari!.substring(0, 10));
        daftarBudget.add(budget);
      });

      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 15,
            child: ListView(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              shrinkWrap: true,
              children: <Widget>[
                const Center(child: Text("Rincian Data!")),
                const SizedBox(height: 20),
                Text(
                  "Judul: $_judul",
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Nominal: $_nominal",
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Jenis: $tipe",
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Tanggal: ${_hari?.substring(0, 10)}",
                  textAlign: TextAlign.center,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      _judul = "";
                      _nominal = "";
                      _hari = "";
                      tipe = "Pilih Jenis";
                    });
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const budgetForm()),
                    );
                  },
                  child: const Text("Kembali"),
                ),
              ],
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Budget"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            // Menambahkan clickable menu
            ListTile(
              title: const Text("Counter"),
              onTap: () {
                // Route menu ke halaman utama
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyHomePage(
                            title: "Flutter Program",
                          )),
                );
              },
            ),
            ListTile(
              title: const Text("Tambah Budget"),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const budgetForm()),
                );
              },
            ),
            ListTile(
              title: const Text("Data Budget"),
              onTap: () {
                // Route menu ke halaman form
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BudgetData(
                            budgetData: daftarBudget,
                          )),
                );
              },
            ),
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Judul",
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _judul = value!;
                    });
                  },
                  onSaved: (String? value) {
                    setState(() {
                      _judul = value!;
                    });
                  },
                  validator: (String? value) {
                    return value == null ? "Tidak Boleh Kosong!" : null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Nominal",
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _nominal = value!;
                    });
                  },
                  onSaved: (String? value) {
                    setState(() {
                      _nominal = value!;
                    });
                  },
                  validator: (String? value) {
                    return value == null ? "Tidak Boleh Kosong!" : null;
                  },
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        labelText: "Pilih Jenis",
                      ),
                      value: tipe,
                      items: daftarTipe.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          tipe = value!;
                        });
                      },
                      validator: (String? value) {
                        return value == null ? "Tidak Boleh Kosong!" : null;
                      },
                    ),
                  ),
                ],
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2002),
                      lastDate: DateTime(2030),
                    ).then((value) {
                      setState(() {
                        _tanggal = value;
                      });
                    });
                  },
                  child: const Text("Pilih Tanggal"),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue)),
                onPressed: _tambahBudget,
                child: const Text(
                  "Simpan",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
