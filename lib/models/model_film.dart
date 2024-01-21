import 'package:intl/intl.dart';

class ModelFilm {
  final int id;
  final String namaFilm;
  final String deskripsiFilm;
  final DateTime datetime;

  ModelFilm({
    required this.id,
    required this.namaFilm,
    required this.deskripsiFilm,
    required this.datetime,
  });

  factory ModelFilm.fromJson(Map<String, dynamic> json) {
    DateTime parsedDatetime;

    try {
      parsedDatetime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(json['datetime']);
    } catch (e) {
      // Jika parsing gagal, gunakan waktu saat ini dan catat pesan kesalahan
      print("Error parsing datetime: $e");
      parsedDatetime = DateTime.now();
    }

    return ModelFilm(
      id: json['id'] as int,
      namaFilm: json['nama_film'] as String,
      deskripsiFilm: json['deskripsi_film'] as String,
      datetime: parsedDatetime,
    );
  }
}
