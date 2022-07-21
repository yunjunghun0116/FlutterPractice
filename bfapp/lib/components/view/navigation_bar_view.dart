

import 'package:app/constants/constants_color.dart';
import 'package:app/enum/enum.dart';
import 'package:app/icon.dart';
import 'package:app/screens/home/pages/guide_screen_page.dart';
import 'package:app/screens/mybf/pages/grade_page.dart';
import 'package:app/screens/shopping/pages/product_search_page.dart';
import 'package:app/screens/shopping/pages/shopping_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationBarView extends StatelessWidget implements PreferredSizeWidget {

  final String title;
  final Color? backgroundColor;
  final NavigationType type;
  final List<NavigationButtonType>? buttonTypes;
  Function(NavigationButtonType? type)? onPressed;

  NavigationBarView({Key? key,
    this.title = '',
    this.backgroundColor = kWhiteColor,
    this.type = NavigationType.back,
    this.buttonTypes,
    this.onPressed,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Container(
          color: backgroundColor,
          width: MediaQuery.of(context).size.width,
          height: preferredSize.height,
          child: Stack(
            children: [
              Visibility(
                visible: type == NavigationType.back,
                child: Container(
                    margin: const EdgeInsets.only(left: 12),
                    height: preferredSize.height,
                    child: IconButton(
                      icon: Image.asset(icBackArrow, width: 24, height: 24),
                      onPressed: () {
                        onPressed?.call(null);
                        Get.back();
                      },
                    )),
              ),
              Center(
                  child: title.isEmpty ?
                  Image.asset(
                      icMainToolbarTitle,
                      color: kWhiteColor,
                      height: 30) :
                  Text(title,
                      style: const TextStyle(
                          color: kBlackColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold))
              ),
              Visibility(
                  visible: type != NavigationType.close,
                  child: SizedBox(
                      height: preferredSize.height,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: getChildren(),
                      )
                  )
              ),
              Visibility(
                visible: type == NavigationType.close,
                child: Container(
                  alignment: Alignment.centerRight,
                    margin: const EdgeInsets.only(right: 12),
                    height: preferredSize.height,
                    child: IconButton(
                      icon: Image.asset(icClose, width: 24, height: 24),
                      onPressed: () {
                        onPressed?.call(null);
                        Get.back();
                      },
                    )),
              ),
            ],
          ),
        )
    );
  }

  List<Widget> getChildren() {
    List<Widget> lists = [];
    buttonTypes?.forEach((element) {
      String imageName = '';
      Function() _onPressed;
      switch(element) {
        case NavigationButtonType.notification:
          imageName = icBell;
          _onPressed = () {
            // TODO: 페이지 이동 추가
            // Get.to(() => const ());
          };
          break;
        case NavigationButtonType.search:
          imageName = icSearch;
          _onPressed = () {
            Get.to(() => const ProductSearchPage());
          };
          break;
        case NavigationButtonType.grade:
          imageName = icInfo;
          _onPressed = () {
            Get.to(() => const GradePage());
          };
          break;
        case NavigationButtonType.setting:
          imageName = icSetting;
          _onPressed = () {
            // TODO: 페이지 이동 추가
            // Get.to(() => const ());
          };
          break;
        case NavigationButtonType.guide:
          imageName = icoTip;
          _onPressed = () {
            Get.to(() => const GuideScreen());
          };
          break;
        case NavigationButtonType.information:
          imageName = icInfo;
          _onPressed = () {
            Get.to(() => const GuideScreen());
          };
          break;
        case NavigationButtonType.cart:
          imageName = icShoppingCart;
          _onPressed = () {
            Get.to(() => const ShoppingCartScreen());
          };
          break;
        default:
          _onPressed = () { };
          break;
      }

      lists.add(IconButton(
          icon: Image.asset(imageName,
              width: 24,
              height: 24,
              color: backgroundColor == kWhiteColor ? kBlackColor : kWhiteColor),
          onPressed: () {
            onPressed?.call(element);
            _onPressed();
          })
      );
    });

    return lists;
  }
}
