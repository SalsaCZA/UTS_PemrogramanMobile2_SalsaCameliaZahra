import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:uts_menu_bar_salsacamelia/models/model_film.dart';


class ComingSoon extends StatefulWidget {
  const ComingSoon({Key? key}) : super(key: key);

  @override
  State<ComingSoon> createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
  final List<ModelFilm> ComingSoonList = [];
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

        for (var item in data) {
          ModelFilm ComingSoon = ModelFilm.fromJson(item);
          ComingSoonList.add(ComingSoon);
        }
      } else {
        error = 'Gagal memuat data';
      }
    } catch (e) {
      error = 'Error: $e';
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> deleteComingsoon(int index) async {
    try {
      final response = await Dio().delete(
          'https://elerning2salsacameliazahra.000webhostapp.com/API/comingsoon.php',
          data: {'id': ComingSoonList[index].id.toString()});

      if (response.statusCode == 200) {
        // Remove the item from the list after successful deletion
        ComingSoonList.removeAt(index);
      } else {
        // Handle deletion failure
        print('Failed to delete');
      }
    } catch (e) {
      // Handle errors during deletion
      print('Error deleting record: $e');
    } finally {
      // Update the UI
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 213, 235),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Data Comingsoon',
            style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.w500, fontSize: 20),
          ),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : error.isNotEmpty
              ? Center(child: Text(error))
              : ListView.builder(
                  itemCount: ComingSoonList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                        ComingSoonList[index].namaFilm,
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ID: ${ComingSoonList[index].id}',
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                          Text(
                            'Deskripsi: ${ComingSoonList[index].deskripsiFilm}',
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                          Text(
                            'datetime: ${DateFormat("yyyy-MM-dd HH:mm:ss").format(ComingSoonList[index].datetime)}',
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          // Confirm and delete the item
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Delete Confirmation'),
                                content: Text(
                                    'Are you sure you want to delete this item?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      // Call deleteHafalan function
                                      deleteComingsoon(index);
                                      Navigator.pop(context);
                                    },
                                    child: Text('Delete'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
    );
  }
}