import 'package:bodyfriend_clone/controllers/user_controller.dart';
import 'package:bodyfriend_clone/models/invite_reward/invite_reward.dart';
import 'package:bodyfriend_clone/utils/network_utils.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/recommend/recommend.dart';

class InviteRewardPage extends StatefulWidget {
  const InviteRewardPage({Key? key}) : super(key: key);

  @override
  State<InviteRewardPage> createState() => _InviteRewardPageState();
}

class _InviteRewardPageState extends State<InviteRewardPage> {
  bool inviteStatus = false;
  bool allPointStatus = false;

  List benefitNumberList = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NetworkUtils().getInviteReward(
          UserController.to.user!.id, UserController.to.user!.accessToken),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          InviteReward reward = snapshot.data as InviteReward;
          benefitNumberList.clear();
          for (var element in reward.benefitNumberList) {
            benefitNumberList.add(element['benefitNumber'] - 1);
          }
          return ListView(
            children: [
              kInviteInfoArea(
                context,
                inviteStatus: inviteStatus,
                allPointStatus: allPointStatus,
                invitePressed: () {
                  setState(() {
                    inviteStatus = true;
                    allPointStatus = false;
                  });
                },
                allPointPressed: () {
                  setState(() {
                    inviteStatus = false;
                    allPointStatus = true;
                  });
                },
                clearPressed: () {
                  setState(() {
                    inviteStatus = false;
                    allPointStatus = false;
                  });
                },
              ),
              Container(
                height: 150,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: kLightGreyColor,
                  )),
                  child: GridView.builder(
                    itemCount: 10,
                    //gridDelegate : gridView의 설정 - 한 행에 몇개의 아이템을 놓을것이고,아이템마다의 space를 설정도가능
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 75,
                        alignment: Alignment.center,
                        child: Container(
                          width: 40,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: kLightGreyColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: benefitNumberList.contains(index)
                              ? const Icon(
                                  Icons.card_giftcard,
                                  color: kLightGreyColor,
                                )
                              : null,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}

Widget kInviteInfoArea(
  BuildContext context, {
  required bool inviteStatus,
  required bool allPointStatus,
  required Function invitePressed,
  required Function allPointPressed,
  required Function clearPressed,
}) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Padding(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder(
            future: NetworkUtils().getUserRecommendedHistory(
                UserController.to.user!.id,
                UserController.to.user!.accessToken),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Recommend recommend = snapshot.data as Recommend;
                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 60,
                      color: kSubBlackColor,
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        '초대 현황',
                                        style: TextStyle(
                                          color: kWhiteColor,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      GestureDetector(
                                        onTap: () => invitePressed(),
                                        child: Container(
                                          width: 16,
                                          height: 16,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border:
                                                Border.all(color: kGreyColor),
                                          ),
                                          child: const Icon(
                                            Icons.question_mark,
                                            size: 12,
                                            color: kGreyColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text:
                                                '${recommend.recommendNumber}',
                                            style: const TextStyle(
                                              color: kMainColor,
                                            )),
                                        TextSpan(
                                            text:
                                                '/${recommend.nextBenefitNumber}',
                                            style: const TextStyle(
                                              color: kGreyColor,
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: VerticalDivider(
                              color: kWhiteColor,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        '총 포인트',
                                        style: TextStyle(
                                          color: kWhiteColor,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      GestureDetector(
                                        onTap: () => allPointPressed(),
                                        child: Container(
                                          width: 16,
                                          height: 16,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border:
                                                Border.all(color: kGreyColor),
                                          ),
                                          child: const Icon(
                                            Icons.question_mark,
                                            size: 12,
                                            color: kGreyColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '${recommend.reward}P',
                                    style: const TextStyle(
                                      color: kMainColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: kMainColor,
                      )),
                      child: const Text(
                        '혜택 전체보기',
                        style: TextStyle(
                          color: kMainColor,
                        ),
                      ),
                    ),
                  ],
                );
              }
              return Container();
            }),
      ),
      inviteStatus
          ? Positioned(
              top: 80,
              left: 30,
              child: Container(
                width: 180,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  border: Border.all(color: kGreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '초대 현황',
                          style: TextStyle(fontSize: 12, color: kGreyColor),
                        ),
                        GestureDetector(
                          onTap: () => clearPressed(),
                          child: const Icon(
                            Icons.clear,
                            color: kGreyColor,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '내 초대를 받아 바디프렌드\n제품을 구매 또는 렌탈한 친구수',
                      style: TextStyle(
                        fontSize: 12,
                        color: kGreyColor,
                      ),
                    )
                  ],
                ),
              ),
            )
          : Container(),
      allPointStatus
          ? Positioned(
              top: 80,
              right: 30,
              child: Container(
                width: 140,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  border: Border.all(color: kGreyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '총 리워드',
                          style: TextStyle(fontSize: 12, color: kGreyColor),
                        ),
                        GestureDetector(
                          onTap: () => clearPressed(),
                          child: const Icon(
                            Icons.clear,
                            color: kGreyColor,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '친구초대 제도를 통해 \n나에게 지급된 포인트',
                      style: TextStyle(
                        fontSize: 12,
                        color: kGreyColor,
                      ),
                    )
                  ],
                ),
              ),
            )
          : Container(),
    ],
  );
}
