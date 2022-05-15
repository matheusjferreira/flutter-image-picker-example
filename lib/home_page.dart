import 'package:flutter/material.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Picker Exemple')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                child: controller.image != null
                    ? Image.file(controller.image!)
                    : const Center(
                        child: Text('No image...'),
                      ),
              ),
            ),
            ElevatedButton(
              child: const Text("Pick Image from Gallery"),
              onPressed: () async {
                await controller.pickImage();
                setState(() {});
              },
            ),
            ElevatedButton(
              child: const Text("Pick Image from Camera"),
              onPressed: () async {
                await controller.pickCamera();
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}