import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/services/api_service.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(), // Aquí cambiamos la pantalla inicial
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final peliculaProvider = PeliculaProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Películas"),
      ),
      body: FutureBuilder(
        future: peliculaProvider.getPelicula(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          final List<Pelicula> peliculas = snapshot.data!;

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
      ),
    );
  }
}