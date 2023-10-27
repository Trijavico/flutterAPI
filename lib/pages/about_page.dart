
import 'package:couteau/util/drawer_comp.dart';
import 'package:flutter/material.dart';


class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Perfil'),
        backgroundColor: Colors.blue, // Cambia el color de fondo del AppBar
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('lib/images/pfp.jpg'), // Reemplaza con la imagen de tu perfil
            ),
            SizedBox(height: 20),
            Text(
              'Nombre: Javier Pena Pérez',
              style: TextStyle(fontSize: 20),
            ),

            SizedBox(height: 25,),

            Text(
              'Email: javier.penaperez08@gmail.com',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 25,),
            Text(
              'Teléfono: +18098886265',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}