import 'package:bodyfriend_clone/constants.dart';
import 'package:bodyfriend_clone/controllers/user_controller.dart';
import 'package:bodyfriend_clone/models/recommend/recommend.dart';
import 'package:bodyfriend_clone/screens/invite/components/invite_text_field.dart';
import 'package:bodyfriend_clone/screens/invite_detail/invite_detail_screen.dart';
import 'package:bodyfriend_clone/utils/network_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InviteScreen extends StatefulWidget {
  const InviteScreen({Key? key}) : super(key: key);

  @override
  State<InviteScreen> createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> {
  bool isOpened = false;

  bool inviteStatus = false;
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
                      '${_nameController.text}(${_phoneController.text})?????? ????????????\n(SMS)??? ??????????????????????',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 20),
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
                            child: TextButton(
                              onPressed: () {},
                              child: const Text('??????'),
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 50,
                            color: kLightGreyColor,
                          ),
                          Expanded(
                            child: TextButton(
                              onPressed: () {},
                              child: const Text('??????'),
                            ),
                          ),
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
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kWhiteColor,
          foregroundColor: kBlackColor,
          title: const Text('?????? ??????'),
        ),
        body: ListView(
          controller: _scrollController,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.width / 2,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                  'assets/memberships/img_top@3x.png',
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
                        '????????????',
                        style: TextStyle(
                          color: kGreyColor,
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
                                '???????????? ????????? ????????? ???????????? ??????????????????, ?????????????????? ???????????? ??????????????????.'),
                            kNoticeText(
                                '???????????? ?????? ?????? ??? ???????????? ??????????????? ???????????? ?????? ??? ????????????.'),
                            kNoticeText('????????? ??? ?????? ????????? ?????? ????????? ????????????.'),
                            kNoticeText(
                                '????????? ????????? ????????? 1?????? ???????????? ??? ????????????. ???, ???????????? ???????????? 3????????? ?????? ????????? ?????? ???????????? ??? ????????????. (??????????????? ?????? ????????? ?????? ????????? ??? ????????????).'),
                            kNoticeText(
                                '??????????????? ????????? ?????? ?????? ????????? ???????????? ?????? ?????? ?????? ????????? ??? ????????????.'),
                            kNoticeText(
                                '??????????????? ?????? ??? ?????? ????????? ?????? ????????? "????????????????"??? ?????? ???????????? ??? ????????????.'),
                            kNoticeText(
                                '??????????????? ????????? ????????? ?????? ?????? ?????? ?????? ?????? ?????? ????????? ??? ????????????.'),
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
      const SizedBox(width: 5),
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
              '???????????? ??????',
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
            const Text(
              '???????????????',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: kGreyColor,
                  fontSize: 16),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          '?????? (???????????? ??????)',
          style: TextStyle(
            fontSize: 14,
            color: kGreyColor,
          ),
        ),
        InviteTextField(
          controller: nameController,
          hintText: '?????? ??????',
          refreshFunction: (s) => refreshFunction(s),
        ),
        const SizedBox(height: 20),
        const Text(
          '???????????????',
          style: TextStyle(
            fontSize: 14,
            color: kGreyColor,
          ),
        ),
        InviteTextField(
          controller: phoneController,
          hintText: '- ?????? ????????? ??????',
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
              '????????????',
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
              '??? ????????? ????????????(SMS)??? ???????????????.',
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
                const Text('?????? ??????', style: TextStyle(fontSize: 16)),
                const Spacer(),
                GestureDetector(
                  onTap: () => Get.to(() => const InviteDetailScreen()),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: kGreyColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
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
                                            '?????? ??????',
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
                                            '??? ?????????',
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
                        Row(
                          children: [
                            const Text('?????? ?????? ',
                                style: TextStyle(fontSize: 16)),
                            Text('${recommend.receiveNumber}'),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: kGreyColor,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Divider(),
                        const SizedBox(height: 10),
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
                          '?????? ??????',
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
                      '??? ????????? ?????? ???????????????\n????????? ?????? ?????? ????????? ?????????',
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
                          '??? ?????????',
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
                    const SizedBox(height: 10),
                    const Text(
                      '???????????? ????????? ?????? \n????????? ????????? ?????????',
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
