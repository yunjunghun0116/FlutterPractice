import 'package:app/components/view/navigation_bar_view.dart';
import 'package:app/constants/constants_color.dart';
import 'package:flutter/material.dart';

class InviteReceivePage extends StatelessWidget {
  const InviteReceivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBarView(
          title: '받은 초대'
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
