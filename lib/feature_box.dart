import 'package:flutter/material.dart';
import 'package:my_assistant/pallete.dart';

class FeatureBox extends StatelessWidget {
  final String headerText;
  final String descriptionText;
  final color;
  const FeatureBox({super.key,  required this.headerText,required this.descriptionText, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.all(12),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20),
          boxShadow:const [
           BoxShadow(color: Pallete.color7,
            offset:  Offset(5, 5),
            blurRadius: 10),
            BoxShadow(color: Pallete.color4,
            offset:  Offset(-5, -5),
            blurRadius: 10),
          ],
          ),
      child: Padding(
       padding: const EdgeInsets.symmetric(vertical: 10, horizontal:25 ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start
          ,children: [
          Text(
            headerText,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "Cera Pro"),
          ),
          Text(
            descriptionText,
            style: const TextStyle(
                
                
                fontFamily: "Cera Pro"),
          ),
        ]),
      ),
    );
  }
}