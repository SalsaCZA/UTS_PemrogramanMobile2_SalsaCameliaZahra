import 'package:intl/intl.dart';

class ModelFilm {
  final int id;
  final String namaFilm;
  late String deskripsiFilm;
  late DateTime datetime;

  ModelFilm({
    required this.id,
    required this.namaFilm,
    required this.deskripsiFilm,
    required this.datetime,
  });

  factory ModelFilm.fromJson(Map<String, dynamic> json) {
    return ModelFilm(
      id: json['id'] as int,
      namaFilm: json['nama_film'] as String,
      deskripsiFilm: json['deskripsi_film'] as String,
      datetime: DateTime.parse(json['datetime'] as String),
    );
  }

  // Method to convert the object to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama_film': namaFilm,
      'deskripsi_film': deskripsiFilm,
      'datetime': DateFormat("yyyy-MM-dd HH:mm:ss").format(datetime),
    };
  }

  // Method to update object properties from a Map
  void updateFromMap(Map<String, dynamic> map) {
    deskripsiFilm = map['deskripsi_film'] as String;
    datetime = DateTime.parse(map['datetime'] as String);
  }
}
