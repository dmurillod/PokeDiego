import 'package:flutter/material.dart';
import '../models/pokemon.dart';

class PokemonDetailScreen extends StatelessWidget {
  final Pokemon pokemon;

  PokemonDetailScreen({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pokemon.name,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.yellow, // Color amarillo
              Colors.blue,   // Color azul
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center( // Centra el contenido en el cuerpo
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Centra verticalmente
              children: [
                Card(
                  elevation: 8, // Sombra para el efecto de elevación
                  color: Colors.lightBlueAccent, // Color de fondo del Card
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0), // Esquinas redondeadas
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0), // Asegura que la imagen tenga esquinas redondeadas
                    child: Image.network(
                      pokemon.imageUrl,
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover, // Ajusta la imagen dentro del Card
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  pokemon.name.toUpperCase(),
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                SizedBox(height: 10),
                Text(
                  'Type: ${pokemon.type}',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                SizedBox(height: 20),
                Text(
                  'Abilities',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center, // Centra las habilidades
                  children: pokemon.abilities.map((ability) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Card(
                        elevation: 4,
                        color: Colors.white, // Color de fondo del Card de habilidad
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0), // Esquinas redondeadas para el card de habilidad
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            ability,
                            style: TextStyle(fontSize: 16, color: Colors.black87),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
