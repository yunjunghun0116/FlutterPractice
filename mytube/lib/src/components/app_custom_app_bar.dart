import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AppCustomAppBar extends StatelessWidget {
  const AppCustomAppBar({Key? key}) : super(key: key);

  Widget _logo() {
    return Container(
      width: 130.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.grey.withOpacity(0.3),
      ),
      alignment: Alignment.center,
      child: Text(
        '정훈튜브',
        style: TextStyle(
          fontSize: 24.0,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _actions() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            print('bell clicked');
          },
          child: Container(
            width: 30.0,
            height: 30.0,
            child: SvgPicture.asset('assets/svg/icons/bell.svg'),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed('/search');
          },
          child: Container(
            width: 40.0,
            height: 40.0,
            child: SvgPicture.asset('assets/svg/icons/search.svg'),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        CircleAvatar(
          backgroundColor: Colors.grey.withOpacity(0.5),
          backgroundImage: Image.network(
                  'https://yt3.ggpht.com/pR5GyqHb4jp_P7jRnawuoVczXBYCEtTTHyILKfmM_PRz9jjiLSXlxJqx3uSbuI9g69DUq-REFQ=s600-c-k-c0x00ffffff-no-rj-rp-mo')
              .image,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _logo(),
          _actions(),
        ],
      ),
    );
  }
}
