import 'package:flutter/material.dart';

class ImageFeature extends StatelessWidget {
  const ImageFeature({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //-----------appbar
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Multi language translator"),
      ),
      //-----------------body
      body: ListView(children: const []),
    );
  }
}
