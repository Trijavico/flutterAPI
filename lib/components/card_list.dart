
import 'package:flutter/material.dart';

class Cardlist extends StatelessWidget {
  final String CollegeName;
  final String CollegeDomain;
  final String CollegeURL;
  
  
  
  Cardlist({
    super.key, 
    required this.CollegeName, 
    required this.CollegeDomain,
    required this.CollegeURL,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0,),
      child: Container(
        padding: EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [

            Text(CollegeName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 25,),

            Text("Dominio: " + CollegeDomain,
              style: TextStyle(
                color: Colors.white
              ),
            ),

            SizedBox(height: 16,),

            Text("Sitio web: " + CollegeURL,
              style: TextStyle(
                color: Colors.white
              ),
            )

          ],
        ),
      ),
    );
  }
}