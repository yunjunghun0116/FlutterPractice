import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:record_moment/widgets/custom_text_form_field.dart';

class CameraResultScreen extends StatefulWidget {
  final XFile image;
  const CameraResultScreen({Key? key, required this.image}) : super(key: key);

  @override
  State<CameraResultScreen> createState() => _CameraResultScreenState();
}

class _CameraResultScreenState extends State<CameraResultScreen> {

  final _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('디테일 이미지'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Hero(
              tag: 'image',
              child: Image.file(
                File(widget.image.path),
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
              ),
            ),
            // CustomTextFormField(
            //   label: '제목',
            //   onSaved: (val) {},
            //   validator: (val) {
            //     return null;
            //   },
            // ),
            // CustomTextFormField(
            //   label: '내용',
            //   onSaved: (val) {},
            //   validator: (val) {
            //     return null;
            //   },
            // ),
            TextField(
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelStyle: const TextStyle(
                  fontSize: 18,
                ),
                labelText: 'gkgk',
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                  ),
                ),
              ),
              keyboardType: TextInputType.text,
              maxLines: 100,
              minLines: 1,
            )
          ],
        ),
      ),
    );
  }
}
