class Pokemon {
  final String name;
  final String type;
  final String imageUrl;
  final List<String> abilities;

  Pokemon({
    required this.name,
    required this.type,
    required this.imageUrl,
    required this.abilities,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    List<String> abilities = [];
    for (var ability in json['abilities']) {
      abilities.add(ability['ability']['name']);
    }

    return Pokemon(
      name: json['name'],
      type: json['types'][0]['type']['name'],
      imageUrl: json['sprites']['other']['showdown']['front_default'],
      abilities: abilities,
    );
  }
}
