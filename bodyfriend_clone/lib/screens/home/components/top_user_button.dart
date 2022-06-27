import 'package:bodyfriend_clone/constants.dart';
import 'package:bodyfriend_clone/controllers/user_controller.dart';
import 'package:bodyfriend_clone/screens/home/components/top_login_button.dart';
import 'package:bodyfriend_clone/screens/invite/invite_screen.dart';
import 'package:bodyfriend_clone/screens/point_history/point_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopUserButton extends StatelessWidget {
  const TopUserButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (controller) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        controller.user!.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Text('님'),
                      const SizedBox(width: 5),
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: kMintColor,
                        ),
                        child: Text(
                          controller.user!.memberGradeType,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kWhiteColor,
                          ),
                        ),
                      ),
                      const Spacer(),
                      FutureBuilder(
                          future: UserController.to.getUserPoint(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return GestureDetector(
                                onTap: () => Get.to(
                                  () => const PointHistoryScreen(),
                                ),
                                child: Text(
                                  '${snapshot.data}P',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                            }
                            return Container();
                          }),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('보유쿠폰'),
                            FutureBuilder(
                                future: UserController.to.getCouponCount(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(
                                      '${snapshot.data}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    );
                                  }
                                  return Container();
                                }),
                          ],
                        ),
                      ),
                      const Text(' | '),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('사용중 제품'),
                            FutureBuilder(
                                future: UserController.to.getUsingCount(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(
                                      '${snapshot.data}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    );
                                  }
                                  return Container();
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Get.to(()=>const InviteScreen());
            },
            child: FittedBox(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 100,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                      kMainColor,
                      kMainColor.withOpacity(0.6),
                      kMainColor.withOpacity(0.8),
                      kMainColor
                    ])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.person_outline,
                      color: kWhiteColor,
                    ),
                    const Text(
                      '친구초대',
                      style: TextStyle(
                        color: kWhiteColor,
                      ),
                    ),
                    const Text(
                      '0',
                      style: const TextStyle(
                        color: kWhiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
//Spacer Expanded
