import 'package:app/components/view/navigation_bar_view.dart';
import 'package:app/constants/constants_color.dart';
import 'package:app/controllers/user_controller.dart';
import 'package:app/icon.dart';
import 'package:app/models/home/recommend_friend/recommend_model.dart';
import 'package:app/screens/home/pages/invite/components/invite_text_field.dart';
import 'package:app/screens/home/pages/invite/invite_info_page.dart';
import 'package:app/screens/home/pages/invite/invite_receive_page.dart';
import 'package:app/screens/home/pages/invite/invite_status_page.dart';
import 'package:app/utils/format_utils.dart';
import 'package:app/utils/network_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvitePage extends StatefulWidget {
  const InvitePage({Key? key}) : super(key: key);

  @override
  State<InvitePage> createState() => _InvitePageState();
}

class _InvitePageState extends State<InvitePage> {
  // 유의 사항
  bool isOpened = false;
  // 초대 현황
  bool inviteStatus = false;
  // 총 포인트
  bool allPointStatus = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final ScrollController _scrollController = ScrollController();

  bool canSendSMS() {
    if (_nameController.text.isEmpty || _phoneController.text.isEmpty) {
      return false;
    }
    return true;
  }

  void sendSMS(BuildContext context) {
    if (canSendSMS()) {
      if (kNumberRegExp.hasMatch(_phoneController.text) &&
          _phoneController.text.length < 12) {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      '${_nameController.text}(${_phoneController.text}님께 초대문자\n(SMS)를 보내시겠습니까?',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: kLightGreyColor,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: const Text(
                                '취소',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 50,
                            color: kLightGreyColor,
                          ),
                          Expanded(
                              child: GestureDetector(
                            onTap: () {
                              //Todo: 확인버튼 클릭시 이벤트
                            },
                            child: const Text(
                              '확인',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 텍스트필드 포커스 해제
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: NavigationBarView(
            title: '친구 초대'
        ),
        body: ListView(
          controller: _scrollController,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.width / 2,
              decoration: const BoxDecoration(
                  image: const DecorationImage(
                image: AssetImage(
                  imgRecommendTop,
                ),
                fit: BoxFit.cover,
              )),
            ),
            kFriendInfoArea(
              nameController: _nameController,
              phoneController: _phoneController,
              refreshFunction: (String s) => setState(() {}),
              canSendSMS: () => canSendSMS(),
              sendSMS: () => sendSMS(context),
            ),
            Divider(
              color: kLightBackgroundColor,
              thickness: 10,
            ),
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
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              color: kLightBackgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 20,
                        color: kGreyColor,
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        '유의사항',
                        style: TextStyle(
                          color: kGreyColor,
                          fontSize: 12,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => setState(() {
                          if (!isOpened) {
                            _scrollController.jumpTo(980 -
                                MediaQuery.of(context).size.height +
                                MediaQuery.of(context).padding.bottom);
                          }
                          isOpened = !isOpened;
                        }),
                        child: Icon(
                          isOpened
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: kGreyColor,
                        ),
                      ),
                    ],
                  ),
                  isOpened
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Divider(),
                            kNoticeText(
                                '초대받을 친구의 이름은 실명으로 입력해주시고, 휴대폰번호를 정확하게 입력해주세요.'),
                            kNoticeText(
                                '부정확한 정보 입력 시 친구분께 초대코드가 전달되지 않을 수 있습니다.'),
                            kNoticeText('초대할 수 있는 친구의 수에 제한은 없습니다.'),
                            kNoticeText(
                                '동일한 휴대폰 번호는 1번만 초대하실 수 있습니다. 단, 초대코드 유효기간 3개월이 지난 후에는 다시 초대하실 수 있습니다. (유효기간은 회사 정책에 따라 변경될 수 있습니다).'),
                            kNoticeText(
                                '비정상적인 방법을 통한 친구 초대는 관리자에 의해 제한 또는 취소될 수 있습니다.'),
                            kNoticeText(
                                '친구초대로 받을 수 있는 혜택은 화면 상단의 "친구초대란?"을 눌러 확인하실 수 있습니다.'),
                            kNoticeText(
                                '친구초대는 당사의 사정에 의해 사전 고지 없이 변경 또는 중단될 수 있습니다.'),
                          ],
                        )
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget kNoticeText(String text) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        alignment: Alignment.center,
        height: 12,
        child: const Icon(
          Icons.circle,
          size: 2,
          color: kGreyColor,
        ),
      ),
      const SizedBox(
        width: 5,
      ),
      Expanded(
        child: Text(
          text,
          style: const TextStyle(color: kGreyColor, fontSize: 10, height: 1.2),
        ),
      ),
    ],
  );
}

Widget kFriendInfoArea({
  required TextEditingController nameController,
  required TextEditingController phoneController,
  required Function refreshFunction,
  required Function canSendSMS,
  required Function sendSMS,
}) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              '초대받을 친구',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const Spacer(),
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: kGreyColor),
              ),
              child: const Icon(
                Icons.question_mark,
                size: 12,
                color: kGreyColor,
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => InviteInfoPage());
              },
              child: const Text(
                '친구초대란',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: kGreyColor,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          '이름 (실명으로 입력)',
          style: TextStyle(
            fontSize: 14,
            color: kGreyColor,
          ),
        ),
        InviteTextField(
          controller: nameController,
          hintText: '이름 입력',
          refreshFunction: (s) => refreshFunction(s),
        ),
        const SizedBox(height: 20),
        const Text(
          '휴대폰번호',
          style: TextStyle(
            fontSize: 14,
            color: kGreyColor,
          ),
        ),
        InviteTextField(
          controller: phoneController,
          hintText: '- 없이 숫자만 입력',
          refreshFunction: (s) => refreshFunction(s),
          textInputType: TextInputType.number,
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () => sendSMS(),
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: canSendSMS() ? null : kLightGreyColor,
              gradient: canSendSMS()
                  ? LinearGradient(
                      colors: [kMainColor.withOpacity(0.7), kMainColor])
                  : null,
            ),
            child: const Text(
              '초대하기',
              style: TextStyle(
                color: kWhiteColor,
                fontSize: 18,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              '이 번호로 초대문자(SMS)가 전송됩니다.',
              style: TextStyle(
                color: kGreyColor,
              ),
            ),
          ],
        ),
      ],
    ),
  );
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
    children: [
      Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text('초대 현황', style: TextStyle(fontSize: 16)),
                const Spacer(),
                GestureDetector(
                  onTap: () => Get.to(() => const InviteStatusPage()),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: kGreyColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                border: Border.all(
                                                    color: kGreyColor),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                border: Border.all(
                                                    color: kGreyColor),
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
                        GestureDetector(
                          onTap: () {
                            Get.to(() => InviteReceivePage());
                          },
                          child: Row(
                            children: [
                              const Text('받은 초대 ',
                                  style: TextStyle(fontSize: 16)),
                              Text(
                                '${recommend.receiveNumber}',
                                style: TextStyle(
                                  color: kMainColor,
                                  fontSize: 15,
                                ),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: kGreyColor,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  }
                  return Container();
                }),
          ],
        ),
      ),
      inviteStatus
          ? Positioned(
              top: 95,
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
                      '내 초대를 받아 바디프랜드\n제품을 구매 또는 렌탈한 친구 수',
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
              top: 95,
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
                          style:
                              const TextStyle(fontSize: 12, color: kGreyColor),
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
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '친구초대 제도를 통해\n나에게 지급된 포인트',
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
