
import 'package:couteau/util/drawer_comp.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController _controller = TextEditingController();
  Color? colorContainer = Colors.grey[500];
  String genderUser = "No se ha introducido nada";


  void fetchAPI() async{

    String name = _controller.text.isNotEmpty ? _controller.text : "null";

    var response = await Dio().get('https://api.genderize.io/?name=' + name);

    setState(() {
      genderUser = response.data['gender'];
      if(name == "null"){
        genderUser = "No se ha introducido nada";
        colorContainer = Colors.grey[500];
      }else{
        genderUser == "female" 
          ? colorContainer = Colors.pink[200] 
          : colorContainer = Colors.blue[200];
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: (){
                Scaffold.of(context).openDrawer();
              },
              color: Colors.black,
            );
          }
        ),
        title: Text("Adivinar genero"),
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
            decoration: BoxDecoration(
              color: colorContainer,
              borderRadius: BorderRadius.circular(8),
            ),

            child: Text(genderUser),
          )

        ],
      ),

      drawer: MyDrawer(),
    );
  }
}