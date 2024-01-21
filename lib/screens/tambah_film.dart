import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';

class ModelFilm {
  final String namaFilm;
  final String deskripsiFilm;
  final DateTime datetime;

  ModelFilm({
    required this.namaFilm,
    required this.deskripsiFilm,
    required this.datetime,
  });

  // Konversi objek menjadi Map
  Map<String, dynamic> toMap() {
    return {
      'nama_film': namaFilm,
      'deskripsi_film': deskripsiFilm,
      'datetime': DateFormat("yyyy-MM-dd HH:mm:ss").format(datetime),
    };
  }
}

class TambahFilm extends StatefulWidget {
  const TambahFilm({Key? key}) : super(key: key);

  @override
  State<TambahFilm> createState() => _TambahFilmState();
}

class _TambahFilmState extends State<TambahFilm> {
  final TextEditingController _namaFilmController = TextEditingController();
  final TextEditingController _deskripsiFilmController = TextEditingController();
  final TextEditingController _tanggalController = TextEditingController();
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _namaFilmController,
              decoration: InputDecoration(
                labelText: 'Nama Film',
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _deskripsiFilmController,
              decoration: InputDecoration(
                labelText: 'Deskripsi Film',
                labelStyle: TextStyle(color: Colors.black),
              ),
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _tanggalController,
              decoration: InputDecoration(
                labelText: 'Tanggal',
                labelStyle: TextStyle(color: Colors.black),
              ),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  setState(() {
                    _tanggalController.text = _dateFormat.format(pickedDate);
                  });
                }
              },
            ),
            SizedBox(height: 16),
            // Replace ElevatedButton with TextButton
            TextButton(
              onPressed: () async {
                // Ambil nilai dari TextField
                String namaFilm = _namaFilmController.text;
                String description = _deskripsiFilmController.text;
                String tanggal = _tanggalController.text;

                // Buat objek ModelFilm dari nilai TextField
                ModelFilm comingsoon = ModelFilm(
                  namaFilm: namaFilm,
                  deskripsiFilm: description,
                  datetime: _dateFormat.parse(tanggal),
                );

                // Konversi objek menjadi Map
                Map<String, dynamic> data = comingsoon.toMap();

                // Convert the map to JSON
                String jsonData = jsonEncode(data);

                // Send a POST request to the PHP script
                Uri uri = Uri.parse('https://elerning2salsacameliazahra.000webhostapp.com/API/comingsoon.php');
                var response = await http.post(
                  uri,
                  headers: {"Content-Type": "application/json"},
                  body: jsonData,
                );

                // Print the response from the server
                print('Response: ${response.body}');
              },
              style: TextButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 255, 0, 234),
              ),
              child: Text('Tambah Film', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}