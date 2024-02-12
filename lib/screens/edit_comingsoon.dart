import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uts_menu_bar_salsacamelia/models/model_film.dart';

class EditComingsoon extends StatefulWidget {
  final ModelFilm comingSoon;

  const EditComingsoon({Key? key, required this.comingSoon}) : super(key: key);

  @override
  _EditComingsoonState createState() => _EditComingsoonState();
}

class _EditComingsoonState extends State<EditComingsoon> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _tanggalController = TextEditingController();
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

  @override
  void initState() {
    super.initState();
    _descriptionController.text = widget.comingSoon.deskripsiFilm;
    _tanggalController.text = _dateFormat.format(widget.comingSoon.datetime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Film'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Deskripsi Film',
                labelStyle: TextStyle(color: Colors.black),
              ),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _tanggalController,
              decoration: const InputDecoration(
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
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                try {
                  String deskripsiFilm = _descriptionController.text;
                  String tanggal = _tanggalController.text;

                  // Update key name to match with the API
                  Map<String, dynamic> data = {
                    'description': deskripsiFilm, // Updated key name
                    'datetime': tanggal,
                  };

                  Dio dio = Dio();
                  Response response = await dio.post(
                    // Update API URL and parameters
                    'https://elerning2salsacameliazahra.000webhostapp.com/API/editcomingsoon.php?id=${widget.comingSoon.id}',
                    data: FormData.fromMap(data),
                  );

                  print('Response: ${response.data}');

                  if (response.statusCode == 200) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Data updated successfully'),
                        backgroundColor: Colors.green,
                      ),
                    );

                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Failed to update data'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                } catch (e) {
                  print('Error: $e');
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('An error occurred. Please try again.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: Text('Update Comingsoon',
                  style: TextStyle(color: Colors.indigo[800])),
            ),
          ],
        ),
      ),
    );
  }
}
