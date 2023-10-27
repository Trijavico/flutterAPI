import 'package:couteau/util/drawer_comp.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class NasaNewsScaffold extends StatefulWidget {
  @override
  _NasaNewsScaffoldState createState() => _NasaNewsScaffoldState();
}

class _NasaNewsScaffoldState extends State<NasaNewsScaffold> {
  final String apiKey = 's9lqdZxPOlCP74UPVUCZdjL89zW1NFZyE26YfqUC'; // Reemplaza con tu API Key de la NASA
  final String apiUrl = 'https://api.nasa.gov/planetary/apod?count=3&api_key=';

  List<Map<String, String>> news = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final dio = Dio();
    final response = await dio.get('$apiUrl$apiKey');

    if (response.statusCode == 200) {
      setState(() {
        news = (response.data as List).map((item) {
          return {
            'title': item['title'].toString(),
            'url': item['url'].toString(),
            'explanation': item['explanation'].toString(),
          };
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NASA News'),
        backgroundColor: Colors.black, // Cambia el color de fondo del app bar
      ),
      drawer: MyDrawer(),
      body: Container(
        padding: EdgeInsets.all(16), // Añade un espacio alrededor del contenido
        child: ListView.builder(
          itemCount: news.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 3, // Agrega una sombra al card
              margin: EdgeInsets.only(bottom: 16), // Espacio entre cards
              child: ListTile(
                title: Text(
                  news[index]['title']!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(news[index]['explanation']!),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  // Abre el navegador para ver la noticia original
                  
                },
              ),
            );
          },
        ),
      ),
    );
  }
}