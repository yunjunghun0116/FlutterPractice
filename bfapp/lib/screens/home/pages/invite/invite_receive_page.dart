import 'package:app/constants/constants_color.dart';
import 'package:flutter/material.dart';

class InviteReceivePage extends StatelessWidget {
  const InviteReceivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "받은 초대",
          style: TextStyle(fontSize: 16),
        ),
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        elevation: 1,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 14,
                  color: kGreyColor,
                ),
                children: [
                  const TextSpan(text: "전체"),
                  TextSpan(
                    text: ' 0',
                    style: const TextStyle(
                      color: kMainColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: kLightGreyColor,
            ),
          ],
        ),
      ),
    );
  }
}
