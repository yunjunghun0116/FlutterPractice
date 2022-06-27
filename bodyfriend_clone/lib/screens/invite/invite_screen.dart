import 'package:bodyfriend_clone/constants.dart';
import 'package:bodyfriend_clone/controllers/user_controller.dart';
import 'package:bodyfriend_clone/models/recommend/recommend.dart';
import 'package:bodyfriend_clone/screens/invite/components/invite_text_field.dart';
import 'package:bodyfriend_clone/utils/network_utils.dart';
import 'package:flutter/material.dart';

class InviteScreen extends StatefulWidget {
  const InviteScreen({Key? key}) : super(key: key);

  @override
  State<InviteScreen> createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> {
  bool isOpened = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool canSendSMS() {
    if (_nameController.text.isEmpty || _phoneController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kWhiteColor,
          foregroundColor: kBlackColor,
          title: const Text('친구 초대'),
        ),
        body: ListView(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.width / 2,
              decoration: const BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/memberships/img_top@3x.png',
                  ),
                  fit: BoxFit.cover,
                )
              ),
            ),
            kFriendInfoArea(
              nameController: _nameController,
              phoneController: _phoneController,
              refreshFunction: (String s) => setState(() {}),
              canSendSMS: () => canSendSMS(),
            ),
            Divider(
              color: kLightBackgroundColor,
              thickness: 10,
            ),
            kInviteInfoArea(),
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
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => setState(() {
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
                            RichText(
                              text: const TextSpan(
                                style: TextStyle(
                                  color: kGreyColor,
                                ),
                                children: [
                                  TextSpan(text: '초대받을 친구의 이름은 실명\n'),
                                  TextSpan(text: '1234\n'),
                                ],
                              ),
                            ),
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

Widget kFriendInfoArea({
  required TextEditingController nameController,
  required TextEditingController phoneController,
  required Function refreshFunction,
  required Function canSendSMS,
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
            const Text(
              '친구초대란',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: kGreyColor,
                  fontSize: 16),
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
        Container(
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

Widget kInviteInfoArea() {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text('초대 현황', style: TextStyle(fontSize: 16)),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: kGreyColor,
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
                                    ],
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: '${recommend.recommendNumber}',
                                            style: const TextStyle(
                                              color: kMainColor,
                                            )),
                                        TextSpan(
                                            text: '/${recommend.nextBenefitNumber}',
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
                      children:  [
                        const Text('받은 초대 ', style: TextStyle(fontSize: 16)),
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
  );
}
