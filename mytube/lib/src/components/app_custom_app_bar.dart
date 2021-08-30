import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppCustomAppBar extends StatelessWidget {
  const AppCustomAppBar({Key? key}) : super(key: key);

  Widget _logo() {
    return Container(
      width: 130.0,
      child: Image.asset('assets/images/logo.png'),
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
            print('search clicked');
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
