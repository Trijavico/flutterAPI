
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
        child: Column(
          children: [

            DrawerHeader(child: Image.asset('lib/images/toolbox.png')),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Divider(
                color: Colors.grey[700],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(Icons.home, color: Colors.white,),
                title: Text("Adivina genero", style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pushNamed(context, '/homepage');
                },
            
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(Icons.home, color: Colors.white,),
                title: Text("Adivina edad", style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pushNamed(context, '/agepage');
                },
            
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(Icons.home, color: Colors.white,),
                title: Text("Adivina Universidad", style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pushNamed(context, '/collegepage');
                },
            
              ),
            ),


            Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(Icons.home, color: Colors.white,),
                title: Text("Clima", style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pushNamed(context, '/weatherpage');
                },
            
              ),
            ),


            Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(Icons.home, color: Colors.white,),
                title: Text("Noticias", style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pushNamed(context, '/wordprespage');
                },
            
              ),
            ),


            Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(Icons.home, color: Colors.white,),
                title: Text("Acerca de", style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pushNamed(context, '/aboutpage');
                },
            
              ),
            ),

          ],
      )
    );
  }
}