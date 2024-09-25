import 'package:flutter/material.dart';
import '../models/pokemon.dart';
import '../widgets/pokemon_card.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Pokemon> favoritePokemons;
  final Function(Pokemon) removeFavorite;

  FavoritesScreen({required this.favoritePokemons, required this.removeFavorite});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favoritos')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.yellow, 
              Colors.blue,   
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: favoritePokemons.isEmpty
            ? Center(
                child: Text(
                  'No hay Pokémon favoritos.',
                  style: TextStyle(fontSize: 18),
                ),
              )
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                padding: EdgeInsets.all(10),
                itemCount: favoritePokemons.length,
                itemBuilder: (context, index) {
                  return PokemonCard(
                    pokemon: favoritePokemons[index],
                    toggleFavorite: removeFavorite,
                    isFavorite: true,
                  );
                },
              ),
      ),
    );
  }
}
