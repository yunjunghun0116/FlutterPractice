import 'package:bodyfriend_clone/constants.dart';
import 'package:bodyfriend_clone/controllers/user_controller.dart';
import 'package:bodyfriend_clone/models/invite_benefit/invite_benefit.dart';
import 'package:bodyfriend_clone/models/invite_goods/invite_goods.dart';
import 'package:bodyfriend_clone/utils/network_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InviteBenefitPage extends StatefulWidget {
  const InviteBenefitPage({Key? key}) : super(key: key);

  @override
  State<InviteBenefitPage> createState() => _InviteBenefitPageState();
}

class _InviteBenefitPageState extends State<InviteBenefitPage> {
  int selectedBenefitRecordNumber = 0;
  List selectedList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhiteColor,
        appBar: AppBar(
          backgroundColor: kWhiteColor,
          foregroundColor: kBlackColor,
          automaticallyImplyLeading: false,
          elevation: 1,
          title: const Text('혜택'),
          actions: [
            IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.clear,
                size: 28,
              ),
            ),
          ],
        ),
        body: FutureBuilder(
          future: NetworkUtils().getInviteBenefitList(
              UserController.to.user!.id, UserController.to.user!.accessToken),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<InviteBenefit> benefitList =
                  snapshot.data as List<InviteBenefit>;
              return ListView(
                children: benefitList.map((benefit) {
                  InviteGoods goods =
                      InviteGoods.fromJson(benefit.goodsList[0]);
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: kLightGreyColor,
                    ))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              style: const TextStyle(
                                color: kBlackColor,
                              ),
                              children: [
                                const TextSpan(text: '총 '),
                                TextSpan(
                                    text: '${benefit.recordNumber}명 ',
                                    style: const TextStyle(
                                      color: kMainColor,
                                    )),
                                const TextSpan(text: '초대 시'),
                              ]),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(goods.listImage),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Text(goods.name),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: kLightGreySubColor,
                          ),
                          child: const Text(
                            '혜택 신청하기',
                            style: TextStyle(
                              color: kLightGreyColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
            }
            return Container();
          },
        ));
  }
}
