import 'package:flutter/material.dart';

class MainRiderScreen extends StatefulWidget {
  @override
  _MainRiderScreenState createState() => _MainRiderScreenState();
}

class _MainRiderScreenState extends State<MainRiderScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  bool isLoading = false;

  Widget _riderNameArea() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 30.0,
        horizontal: 50.0,
      ),
      child: Column(
        children: [
          Row(
            children: [Text('라이더')],
          ),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: '라이더 닉네임을 입력하세요',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _riderPhoneArea() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 30.0,
        horizontal: 50.0,
      ),
      child: Column(
        children: [
          Row(
            children: [Text('연락처')],
          ),
          TextField(
            controller: phoneController,
            decoration: InputDecoration(
              hintText: '라이더 연락처를 입력하세요',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _submitButton() {
    return TextButton(
      onPressed: () async {},
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 30.0,
        ),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text('라이더 지원하기'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _riderNameArea(),
          _riderPhoneArea(),
          _submitButton(),
        ],
      ),
    );
  }
}
