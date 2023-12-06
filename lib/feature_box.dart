import 'package:flutter/material.dart';

class FeatureBox extends StatelessWidget {
  final headerText;
  final descriptionText;
  final color;
  const FeatureBox({ required this.headerText,required this.descriptionText, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
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