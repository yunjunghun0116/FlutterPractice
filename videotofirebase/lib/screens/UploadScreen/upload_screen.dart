import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:videotofirebase/utils/firebase_api.dart';
import 'package:video_player/video_player.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  File? file;
  String fileName = 'No File selected';
  final picker = ImagePicker();
  UploadTask? uploadTask;
  VideoPlayerController? player;

  Future uploadFile() async {
    if (file == null) return;
    fileName = basename(file!.path);
    String destination = 'files/$fileName';
    uploadTask = FirebaseApi.uploadFile(destination, file!);
    if (uploadTask == null) return;
    final snapshot = await uploadTask!.whenComplete(() {});
    final fileDownloadUrl = await snapshot.ref.getDownloadURL();
    print('download url : $fileDownloadUrl');
  }

  Future pickImageFromGallery() async {
    XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;
    File image = File(pickedFile.path);
    setState(() {
      file = image;
    });
  }

  Future pickVideoFromGallery() async {
    XFile? pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile == null) return;
    File video = File(pickedFile.path);
    player = VideoPlayerController.file(video);

    player!.initialize().then((value) {
      setState(() {});
      player!.play();
    });
    setState(() {
      file = video;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ImageUpload'),
      ),
      body: Column(
        children: [
          file != null ? Text(file!.path) : Container(),
          ElevatedButton(
            onPressed: () async {
              await pickImageFromGallery();
            },
            child: const Text('Pick image'),
          ),
          ElevatedButton(
            onPressed: () async {
              await pickVideoFromGallery();
            },
            child: const Text('Pick Video'),
          ),
          ElevatedButton(
            onPressed: () async {
              await uploadFile();
            },
            child: Text('File Upload'),
          ),
          player != null
              ? SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: VideoPlayer(player!),
                )
              : Container(),
          player != null
              ? Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        player!.pause();
                        player!.position;
                      },
                      child: Text('pause'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        player!.play();
                      },
                      child: Text('play'),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
