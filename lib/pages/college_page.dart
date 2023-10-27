
import 'package:couteau/components/card_list.dart';
import 'package:couteau/util/drawer_comp.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CollegePage extends StatefulWidget {
  const CollegePage({super.key});

  @override
  State<CollegePage> createState() => _CollegePageState();
}

class _CollegePageState extends State<CollegePage> {

  TextEditingController _controller = TextEditingController();
  List collegeList = [];


  void fetchAPI() async{

    if(_controller.text.isEmpty) return;

    String name = _controller.text.replaceAll(" ", "+");
    var response = await Dio().get('http://universities.hipolabs.com/search?country='+name);

    setState(() {
      collegeList.clear();
      collegeList.addAll(response.data);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Universidades"),
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

          Expanded(
            child: ListView.builder(
              itemCount: collegeList.length,
          
              itemBuilder: (context, index) {
                return Cardlist(
                  CollegeName: collegeList[index]['name'], 
                  CollegeDomain: collegeList[index]['domains'][0],
                  CollegeURL: collegeList[index]['web_pages'][0],
                );
              },
            ),
          )

        ],
      ),
      
      drawer: MyDrawer(),
    );
  }
}