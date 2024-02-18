import 'package:catbreeds/src/paginas/BreedDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BreedScreen extends StatefulWidget {
  const BreedScreen({super.key});

  @override
  State<BreedScreen> createState() => _BreedScreenState();
}

class _BreedScreenState extends State<BreedScreen> {
  List<dynamic> _breeds = [];
  List<dynamic> _filteredBreeds = [];
  @override
  void initState() {
    super.initState();
    _fetchBreeds();
  }

  Future<void> _fetchBreeds() async {
    try {
      final response = await http.get(
        Uri.parse('https://api.thecatapi.com/v1/breeds'),
        headers: {
          'x-api-key': 'bda53789-d59e-46cd-9bc4-2936630fde39',
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          _breeds = json.decode(response.body);
          _filteredBreeds = List.from(_breeds);
        });
      } else {
        throw Exception('Failed to fetch breeds');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void _filterBreeds(String query) {
    setState(() {
      _filteredBreeds = _breeds
          .where((breed) =>
              breed['name'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Cat Breeds'),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: _filterBreeds,
                  decoration: InputDecoration(
                    labelText: 'Search',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              Expanded(
                child: _filteredBreeds.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: _filteredBreeds.length,
                        itemBuilder: (context, index) {
                          final breed = _filteredBreeds[index];
                          final imageUrl = breed['wikipedia_ur'] ??
                              'https://via.placeholder.com/150';
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      BreedDetailScreen(breed: breed),
                                ),
                              );
                            },
                            child: Card(
                              margin: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          breed['name'],
                                          style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text('Más...'),
                                      ],
                                    ),
                                  ),
                                  Image.network(
                                    imageUrl,
                                    height: 150.0,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Origin: ${breed['origin']}'),
                                          Text(
                                              'Temperament: ${breed['temperament']}')
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              )
            ],
          )),
    );
  }
}
