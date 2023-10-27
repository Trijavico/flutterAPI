
import 'package:couteau/util/drawer_comp.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AgePage extends StatefulWidget {
  const AgePage({super.key});

  @override
  State<AgePage> createState() => _AgePageState();
}

class _AgePageState extends State<AgePage> {

  TextEditingController _controller = TextEditingController();
  String messageToUsr = "No se ha introducido nada";
  Widget urlImage = Icon(Icons.question_mark, size: 100,);

  void fetchAPI() async{

    String name = _controller.text.isNotEmpty ? _controller.text : "null";

    var response = await Dio().get('https://api.agify.io/?name=' + name);

    setState(() {
      if(name == "null"){
        messageToUsr = "No se ha introducido nada";
      }else{


        if(response.data['age'] > 33 ) {
          messageToUsr = "Viejo de " + response.data['age'].toString();
          urlImage = Icon(Icons.person_add_alt_1_rounded, size: 100,);
          return;
        }

        if(response.data['age'] >= 18 && response.data['age'] <= 33) {
          messageToUsr = "Adulto de " + response.data['age'].toString();
          urlImage = Icon(Icons.emoji_people_sharp, size: 100,);
          return;
        }else{
          messageToUsr = "Joven de " + response.data['age'].toString();
          urlImage = Icon(Icons.person_remove_alt_1, size: 100,);
        }

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Adivinar edad"),
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [


          Padding(
            padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Escribe tu nombre",
              ),
              controller: _controller,
            ),
          ),

          SizedBox(height: 25,),

          ElevatedButton(
            onPressed: fetchAPI,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
            ),  
            child: Text("Adinivar"),),

          SizedBox(height: 25,),

          Container(
            padding: EdgeInsets.all(25.0),
            width: 300 ,
            decoration: BoxDecoration(
              color: Colors.amber[200],
              borderRadius: BorderRadius.circular(8),
            ),

            child: Center(child: Text(messageToUsr)),
          ),

          SizedBox(height: 25,),

          Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Container(
              child: urlImage,
            )
          )

        ],
      ),

      drawer: MyDrawer(),
    );
  }
}