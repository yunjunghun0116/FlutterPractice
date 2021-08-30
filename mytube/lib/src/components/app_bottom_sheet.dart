import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({Key? key}) : super(key: key);

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '만들기',
          style: TextStyle(fontSize: 16.0),
        ),
        IconButton(
          onPressed: Get.back,
          icon: Icon(Icons.close),
        ),
      ],
    );
  }

  Widget _itemButton(
      {required String icon,
      double? iconSize,
      required String label,
      required void Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.withOpacity(0.3),
            ),
            child: Center(
              child: Container(
                width: iconSize ?? 20,
                height: iconSize ?? 20,
                child: SvgPicture.asset(
                  'assets/svg/icons/$icon.svg',
                ),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Text(label),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      child: Container(
        padding: EdgeInsets.only(left: 10.0),
        height: 200,
        color: Colors.white,
        child: Column(
          children: [
            _header(),
            SizedBox(
              height: 10.0,
            ),
            _itemButton(
              icon: 'upload',
              iconSize: 20,
              label: '동영상업로드',
              onTap: () {
                print('동영상업로드기능');
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            _itemButton(
              icon: 'broadcast',
              iconSize: 20,
              label: '실시간 스트리밍 시작',
              onTap: () {
                print('실시간 스트리밍 시작');
              },
            ),
          ],
        ),
      ),
    );
  }
}
