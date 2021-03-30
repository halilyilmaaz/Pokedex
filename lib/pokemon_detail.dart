import 'package:flutter/material.dart';

import 'model/pokedex.dart';

class PokemonDetail extends StatelessWidget {
  Pokemon pokemon;

  PokemonDetail({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
      ),
      body: Stack(
        children: [
          Container(
            child: Card(
              elevation: 6,
              child: Center(
                  child: Center(
                child: ListView(
                  children: [
                    Container(
                      child: FadeInImage.assetNetwork(
                          placeholder: "assets/loading.gif",
                          image: pokemon.img),
                    ),
                    Text(
                      "Name :" + pokemon.name,
                      style:
                          TextStyle(fontSize: 24, fontStyle: FontStyle.normal),
                    ),
                    Text(
                      "Height : " + pokemon.height,
                      style:
                          TextStyle(fontSize: 24, fontStyle: FontStyle.normal),
                    ),
                    Text(
                      "Weight : " + pokemon.weight,
                      style:
                          TextStyle(fontSize: 24, fontStyle: FontStyle.normal),
                    ),
                    Text(
                      "Candy : " + pokemon.candy,
                      style:
                          TextStyle(fontSize: 24, fontStyle: FontStyle.normal),
                    ),
                  ],
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
