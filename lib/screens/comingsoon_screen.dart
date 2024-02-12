import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:uts_menu_bar_salsacamelia/models/model_film.dart';
import 'package:uts_menu_bar_salsacamelia/screens/edit_comingsoon.dart';

class Comingsoon extends StatefulWidget {
  const Comingsoon({Key? key}) : super(key: key);

  @override
  State<Comingsoon> createState() => _ComingsoonState();
}

class _ComingsoonState extends State<Comingsoon> {
  List<ModelFilm> comingsoonList = [];
  bool isLoading = true;
  String error = '';

  @override
  void initState() {
    super.initState();
    fetchComingsoonData();
  }

  Future<void> fetchComingsoonData() async {
    try {
      final response = await Dio()
          .get('https://elerning2salsacameliazahra.000webhostapp.com/API/comingsoon.php');

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;

        setState(() {
          comingsoonList.clear();

          for (var item in data) {
            ModelFilm Comingsoon = ModelFilm.fromJson(item);
            comingsoonList.add(Comingsoon);
          }
        });
      } else {
        showSnackbar('Gagal memuat data');
      }
    } catch (e) {
      showSnackbar('Error: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> deleteComingsoon(int id) async {
    try {
      final response = await Dio().post(
        'https://elerning2salsacameliazahra.000webhostapp.com/API/deletenews.php',
        data: {'id': id.toString()},
      );

      print(response);

      if (response.statusCode == 200) {
        setState(() {
          comingsoonList.removeWhere((element) => element.id == id);
        });
        showSnackbar('Item berhasil dihapus');
      } else {
        showSnackbar('Gagal menghapus');
      }
    } catch (e) {
      showSnackbar('Error saat menghapus data: $e');
    }
  }

  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Data Comingsoon',
            style: GoogleFonts.poppins(
              color: Colors.indigo[800],
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : error.isNotEmpty
              ? Center(child: Text(error))
              : comingsoonList.isEmpty
                  ? const Center(child: Text('Tidak ada data'))
                  : ListView.builder(
                      itemCount: comingsoonList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            title: Text(
                              comingsoonList[index].namaFilm,
                              style: GoogleFonts.poppins(
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Deskripsi: ${comingsoonList[index].deskripsiFilm}',
                                  style: GoogleFonts.poppins(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  'Waktu: ${DateFormat("yyyy-MM-dd HH:mm:ss").format(comingsoonList[index].datetime)}',
                                  style: GoogleFonts.poppins(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EditComingsoon(
                                          comingSoon: comingsoonList[index],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title:
                                              const Text('Delete Confirmation'),
                                          content: const Text(
                                            'Are you sure you want to delete this item?',
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                deleteComingsoon(comingsoonList[index].id);
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Delete'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
    );
  }
}