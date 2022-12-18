import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'dart:developer';

class RecognizationPage extends StatefulWidget {

  final String? path;
  const RecognizationPage({Key? key, this.path}) : super(key: key);

  @override
  State<RecognizationPage> createState() => _RecognizationPageState();
}

class _RecognizationPageState extends State<RecognizationPage> {
  bool _isBusy = false;

  TextEditingController txtFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();

    final InputImage inputImage = InputImage.fromFilePath(widget.path!);
    processingImage(inputImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recognization Page"),
      ),
      body: _isBusy == true? Center(
        child: CircularProgressIndicator(),
      ) : Container(
        padding: const EdgeInsets.all(20),
        child: TextFormField(
          maxLines: MediaQuery.of(context).size.height.toInt(),
          controller: txtFieldController,
          decoration: const InputDecoration(hintText: "Text Recognition Results"),
        ),
      ),
    );
  }

  void processingImage(InputImage image) async {

    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

    setState(() {
      _isBusy = true;
    });

    log(image.filePath!);
    final RecognizedText recognizedText = await textRecognizer.processImage(image);

    txtFieldController.text = recognizedText.text;

    setState(() {
      _isBusy = false;
    });
  }
}
