
import 'package:couteau/pages/home_page.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Image.asset(
                  'lib/images/toolbox.png',
                  height: 240,
                ),
              ),
        
        
              const SizedBox(height: 48,),
              
              const Text(
                "Couteau",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),  
              ),
        
              const SizedBox(height: 24,),
        
              const Text(
                "Una aplicacion movil para empezar el fetching de datos por API",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,  
              ),
        
              const SizedBox(height: 48,),
        
              GestureDetector(
                onTap: () => Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => HomePage()
                  )
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(12)
                  ),
                  padding: EdgeInsets.all(25),
                  child: Center(
                    child: const Text("Empieza ahora", style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                ),
              )
              
            ],
          ),
        ),
      ),
    );
  }
}