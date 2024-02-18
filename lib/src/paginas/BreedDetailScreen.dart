import 'package:flutter/material.dart';

class BreedDetailScreen extends StatelessWidget {
  final Map<String, dynamic> breed;

  const BreedDetailScreen({Key? key, required this.breed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl = breed['wikipedia_ur'] != null
        ? breed['wikipedia_url']
        : 'https://via.placeholder.com/150';

    return Scaffold(
      appBar: AppBar(
        title: Text(breed['name']),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.0),
            Image.network(
              imageUrl,
              height: 300.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              height: 320.0,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Origin: ${breed['origin']}',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    Text('Temperament: ${breed['temperament']}'),
                    SizedBox(height: 8.0),
                    Text('life span: ${breed['life_span']}'),
                    SizedBox(height: 8.0),
                    Text('Description: ${breed['description']}'),
                    SizedBox(height: 8.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
