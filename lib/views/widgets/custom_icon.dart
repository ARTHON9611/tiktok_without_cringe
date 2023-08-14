import 'package:flutter/material.dart';

class customIcon extends StatelessWidget {
  const customIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 40,height: 30,

    child: Stack(children: [
      Container(width: 40,
      margin: EdgeInsets.only(left: 10),

      decoration: BoxDecoration(
        color: Color.fromARGB(255, 250,45,108),
        borderRadius: BorderRadius.circular(7)
      ),

      ),
        Container(width: 40,
      margin: EdgeInsets.only(right: 10),

      decoration: BoxDecoration(
        color: Color.fromARGB(255,32,211,234),
        borderRadius: BorderRadius.circular(7)
      ),

      ),
       Container(width: 40,height: double.infinity,
       margin: EdgeInsets.only(left: 3,right: 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7)
      ),
      ),
      Center(child: Container(height: double.infinity,child: Icon(Icons.add,color: Colors.black,size: 20,)))






    ]),
    
    
    
    
    
    );
  }
}