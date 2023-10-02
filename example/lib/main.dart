import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_image_processing/flutter_image_processing.dart' as flutter_image_processing;
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MaterialApp(
    home: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ImagePicker _picker = ImagePicker();
  late String version;
  Image _img = Image.asset('assets/img/default.jpg');

  @override
  void initState() {
    super.initState();
    version = flutter_image_processing.opencvVersion();
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 25);
    const spacerSmall = SizedBox(height: 10);
    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter_image_processing example'
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              spacerSmall,
              Text(
                'OpenCV Version: $version',
                style: textStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: () async {
                    final imageFile = await _picker.pickImage(source: ImageSource.gallery);
                    final imagePath = imageFile?.path ?? "none";

                    await flutter_image_processing.GaussianBlur(imagePath);

                    setState(() {
                      _img = Image.file(File(imagePath));
                    });
                  },
                  child: Text("Run GaussianBlur"),
                ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () async {
                  final imageFile = await _picker.pickImage(source: ImageSource.gallery);
                  final imagePath = imageFile?.path ?? "none";

                  await flutter_image_processing.CannyDetector(imagePath);

                  setState(() {
                    _img = Image.file(File(imagePath));
                  });
                },
                child: Text("Run CannyDetector"),
              ),
              SizedBox(height: 20,),
              Center(child: _img),
            ],
          ),
        ),
      ),
    );
  }
}
