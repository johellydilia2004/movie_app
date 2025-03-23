import 'package:flutter/material.dart';
import 'package:movie_app/services/api_service.dart';
import 'package:movie_app/models/movie.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final peliculaProvider = PeliculaProvider();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: peliculaProvider.getPelicula(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (!snapshot.hasData) {
          return Center(
            child: Text("No hay datos"),
            );
        }

        final List<Pelicula> peliculas = snapshot.data!; 

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: peliculas.length,
          itemBuilder: (context, index) {
            final pelicula = peliculas[index];
            return Card(
              child: Column(
                children: [
                  Image.network(pelicula.imagen),
                  Text(pelicula.nombreCompleto),
                  Text(pelicula.apodo),
                  Text(pelicula.hogwartsCasa),
                  Text(pelicula.interpretadoPor),
                  Text(pelicula.hijos),
                  Text(pelicula.cumpleanios),
                  Text(pelicula.index),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
