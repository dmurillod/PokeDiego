import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/pokemon.dart';
import '../widgets/pokemon_card.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Pokemon>>? pokemons;
  List<Pokemon> favoritePokemons = [];

  @override
  void initState() {
    super.initState();
    pokemons = ApiService.fetchPokemons();
  }

  void toggleFavorite(Pokemon pokemon) {
    setState(() {
      if (favoritePokemons.contains(pokemon)) {
        favoritePokemons.remove(pokemon);
      } else {
        favoritePokemons.add(pokemon);
      }
    });
  }

  void removeFavorite(Pokemon pokemon) {
    setState(() {
      favoritePokemons.remove(pokemon);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokémon List'), 
        actions: [
          IconButton(
            icon: Icon(Icons.star),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesScreen(
                    favoritePokemons: favoritePokemons,
                    removeFavorite: removeFavorite,
                  ),
                ),
              );
            },
          ),
        ],
      ),
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
        child: FutureBuilder<List<Pokemon>>(
          future: pokemons,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                padding: EdgeInsets.all(10),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return PokemonCard(
                    pokemon: snapshot.data![index],
                    toggleFavorite: toggleFavorite,
                    isFavorite: favoritePokemons.contains(snapshot.data![index]),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
