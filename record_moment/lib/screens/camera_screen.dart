import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record_moment/screens/camera_result_screen.dart';

class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameraList;
  const CameraScreen({Key? key, required this.cameraList}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  int _selectedCameraIndex = 0;
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    if (widget.cameraList.isNotEmpty) {
      _cameraController = CameraController(
          widget.cameraList[_selectedCameraIndex], ResolutionPreset.medium);
      _initializeControllerFuture = _cameraController.initialize();
    }
  }

  @override
  void dispose() {
    try {
      _cameraController.dispose();
    } catch (e) {
      print(e);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('카메라 화면'),
      ),
      body: Column(
        children: [
          widget.cameraList.isEmpty
              ? Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                  child: const CircularProgressIndicator(),
                )
              : FutureBuilder(
                  future: _initializeControllerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Hero(
                        tag: 'image',
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width,
                          child: CameraPreview(_cameraController),
                        ),
                      );
                    }
                    return Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      child: const CircularProgressIndicator(),
                    );
                  },
                ),
          Spacer(),
          GestureDetector(
            onTap: () async {
              if (widget.cameraList.isEmpty) return;
              try {
                await _initializeControllerFuture;
                XFile image = await _cameraController.takePicture();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CameraResultScreen(
                      image: image,
                    ),
                  ),
                );
              } catch (e) {
                print(e);
              }
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.brown),
                color: Colors.black26,
              ),
              child: Icon(Icons.camera_alt),
            ),
          ),
        ],
      ),
    );
  }
}
