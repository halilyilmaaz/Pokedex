import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex/pokemon_detail.dart';

import 'model/pokedex.dart';

class PokemonList extends StatefulWidget {
  PokemonList({Key key}) : super(key: key);

  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  var url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  Pokedex pokedex;
  Future<Pokedex> veri;
  Future<Pokedex> pokemonGetir() async {
    var response = await http.get(Uri.parse(url));
    var decodJsonVeri = json.decode(response.body);
    pokedex = Pokedex.fromMap(decodJsonVeri);
    return pokedex;
  }

  @override
  void initState() {
    super.initState();
    veri = pokemonGetir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex"),
      ),
      body: FutureBuilder(
          future: veri,
          // ignore: missing_return
          builder: (context, AsyncSnapshot<Pokedex> pokedex) {
            if (pokedex.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (pokedex.connectionState == ConnectionState.done) {
              return GridView.count(
                crossAxisCount: 2,
                children: pokedex.data.pokemon.map((poke) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PokemonDetail(
                                    pokemon: poke,
                                  )));
                    },
                    child: Hero(
                      tag: poke.img,
                      child: Card(
                        elevation: 6,
                        child: Column(
                          children: [
                            Container(
                                width: 100,
                                height: 100,
                                child: FadeInImage.assetNetwork(
                                    placeholder: "assets/loading.gif",
                                    image: poke.img)),
                            Text(poke.name, style: TextStyle(fontSize: 24)),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            }
          }),
    );
  }
}
