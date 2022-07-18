import 'package:app/constants/constants_color.dart';
import 'package:app/controllers/user_controller.dart';
import 'package:app/icon.dart';
import 'package:app/screens/home/pages/invite/invite_page.dart';
import 'package:app/screens/home/pages/membership_grade_info_page.dart';
import 'package:app/screens/home/pages/point_page/point_history_page.dart';
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
                        '${controller.user!.name}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("님"),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => MembershipGradeInfoPage());
                        },
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: kMintColor,
                          ),
                          child: Text(
                            controller.user!.memberGradeType,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kWhiteColor,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      FutureBuilder(
                          future: UserController.to.getUserPoint(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return GestureDetector(
                                onTap: () => Get.to(
                                  () => const PointHistoryPage(),
                                ),
                                child: Text(
                                  '${snapshot.data}P',
                                  style: TextStyle(
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
                  Divider(),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("보유쿠폰"),
                            FutureBuilder(
                                future: UserController.to.getCouponCount(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(
                                      '${snapshot.data}',
                                      style: TextStyle(
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
                      Text(' | '),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("사용중 제품"),
                            FutureBuilder(
                                future: UserController.to.getUsingCount(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(
                                      '${snapshot.data}',
                                      style: TextStyle(
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
            onTap: () {
              Get.to(() => const InvitePage());
            },
            child: FittedBox(
              child: Container(
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                    Container(
                      alignment: Alignment.center,
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(icFriendInvite),
                        ),
                      ),
                    ),
                    const Text(
                      "친구초대",
                      style: TextStyle(
                        color: kWhiteColor,
                      ),
                    ),
                    const Text(
                      '0',
                      style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 16,
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
