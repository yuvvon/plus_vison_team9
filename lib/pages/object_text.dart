import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_vision/flutter_vision.dart';
import 'package:image_picker/image_picker.dart';


class YoloImage extends StatefulWidget {
  const YoloImage({Key? key}) : super(key: key);

  @override
  State<YoloImage> createState() => _YoloImageState();
}

class _YoloImageState extends State<YoloImage> {
  late FlutterVision vision;
  late List<Map<String, dynamic>> yoloResults;
  File? imageFile;
  int imageHeight = 1;
  int imageWidth = 1;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    vision = FlutterVision();
    loadYoloModel().then((value) {
      setState(() {
        yoloResults = [];
        isLoaded = true;
      });
    });
  }

  @override
  void dispose() async {
    super.dispose();
    await vision.closeYoloModel();
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoaded) {
      return const Scaffold(
        body: Center(
          child: Text("Model not loaded, waiting for it"),
        ),
      );
    }
    return Container( // Container로 감싸서 배경색을 흰색으로 설정
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        children: [
          imageFile != null ? Image.file(imageFile!) : const SizedBox(),
          ...displayLabelsAndConfidence(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: pickImage,
                  child: const Text("Pick image"),
                ),
                ElevatedButton(
                  onPressed: yoloOnImage,
                  child: const Text("Detect"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(
                          imageFile: imageFile,
                          yoloResults: yoloResults,
                        ),
                      ),
                    );
                  },
                  child: Text("View Result"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> loadYoloModel() async {
    await vision.loadYoloModel(
        labels: 'assets/classes.txt',
        modelPath: 'assets/new_float16.tflite',
        modelVersion: "yolov8",
        numThreads: 2,
        useGpu: true);
    setState(() {
      isLoaded = true;
    });
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    // Capture a photo
    final XFile? photo = await picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      setState(() {
        imageFile = File(photo.path);
      });
    }
  }

  yoloOnImage() async {
    yoloResults.clear();
    Uint8List byte = await imageFile!.readAsBytes();
    final image = await decodeImageFromList(byte);
    imageHeight = image.height;
    imageWidth = image.width;
    final result = await vision.yoloOnImage(
        bytesList: byte,
        imageHeight: image.height,
        imageWidth: image.width,
        iouThreshold: 0.8,
        confThreshold: 0.4,
        classThreshold: 0.5);
    if (result.isNotEmpty) {
      setState(() {
        yoloResults = result;
      });
    }
  }

  List<Widget> displayLabelsAndConfidence() {
    if (yoloResults.isEmpty) return [];

    Color textColor = Colors.black; // 텍스트 색상 설정

    return yoloResults.map((result) {
      return Positioned(
        left: 0,
        bottom: 0,
        child: Container(
          margin: const EdgeInsets.fromLTRB(140, 0, 0, 150),
          width: imageWidth.toDouble(),
          color: Colors.white, // 배경색을 흰색으로 설정
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "${result['tag']}",
            style: TextStyle(
              color: textColor,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,

            ),
          ),
        ),
      );
    }).toList();
  }

}

class ResultPage extends StatelessWidget {
  final File? imageFile;
  final List<Map<String, dynamic>> yoloResults;

  ResultPage({required this.imageFile, required this.yoloResults});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detection Result"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: imageFile != null ? Image.file(imageFile!) : SizedBox(),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.black.withOpacity(0.5),
            child: Text(
              yoloResults.isNotEmpty ? yoloResults[0]['tag'] : '',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}



