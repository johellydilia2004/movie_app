import 'dart:convert';

List<Pelicula> peliculaFromJson(String str) =>
  List<Pelicula>.from(json.decode(str).map((x) => Pelicula.fromJson(x)));

String peliculaToJson(List<Pelicula> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class Pelicula {
  final String nombreCompleto;
  final String apodo;
  final String hogwartsCasa;
  final String interpretadoPor;
  final String hijos;
  final String imagen;
  final String cumpleanios;
  final String index;

  Pelicula({
    required this.nombreCompleto,
    required this.apodo,
    required this.hogwartsCasa,
    required this.interpretadoPor,
    required this.hijos,
    required this.imagen,
    required this.cumpleanios,
    required this.index,
  });

  factory Pelicula.fromJson(Map<String, dynamic> json) {
    return Pelicula(
      nombreCompleto: json['nombreCompleto'],
      apodo: json['apodo'],
      hogwartsCasa: json['hogwartsCasa'],
      interpretadoPor: json['interpretadoPor'],
      hijos: json['hijos'],
      imagen: json['imagen'],
      cumpleanios: json['cumpleanios'],
      index: json['index'],
    );
  }

  Map<String, dynamic> toJson() => {
  "nombreCompleto": nombreCompleto,
  "apodo": apodo,
  "hogwartsCasa": hogwartsCasa,
  "interpretadoPor": interpretadoPor,
  "hijos": hijos,
  "imagen": imagen,
  "cumpleanios": cumpleanios,
  "index": index,
};
}
