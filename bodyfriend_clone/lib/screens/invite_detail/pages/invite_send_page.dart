import 'package:bodyfriend_clone/constants.dart';
import 'package:bodyfriend_clone/controllers/user_controller.dart';
import 'package:bodyfriend_clone/models/invite_history/invite_history.dart';
import 'package:bodyfriend_clone/models/invite_user/invite_user.dart';
import 'package:bodyfriend_clone/utils/local_utils.dart';
import 'package:bodyfriend_clone/utils/network_utils.dart';
import 'package:flutter/material.dart';

class InviteSendPage extends StatelessWidget {
  const InviteSendPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: FutureBuilder(
        future: NetworkUtils().getInviteRecommendHistory(
            UserController.to.user!.id, UserController.to.user!.accessToken),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            InviteHistory inviteHistory = snapshot.data as InviteHistory;
            return ListView(
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 14,
                      color: kGreyColor,
                    ),
                    children: [
                      TextSpan(
                          text: '${inviteHistory.numberOfElements}',
                          style: const TextStyle(
                            color: kMainColor,
                          )),
                      const TextSpan(text: '건')
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: kLightGreyColor,
                ),
                ...inviteHistory.content.map((inviteUser) {
                  InviteUser user = InviteUser.fromJson(inviteUser);
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: kLightGreyColor,
                    ))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              getDateTime(user.createdAt),
                              style: const TextStyle(
                                color: kGreyColor,
                              ),
                            ),
                            const Icon(
                              Icons.clear,
                              size: 20,
                              color: kGreyColor,
                            )
                          ],
                        ),
                        Text('${user.recommendName} | ${user.recommendMobile}')
                      ],
                    ),
                  );//[ㅇㅇ*의 위젯,최지*의 위젯 ...]
                }).toList(),
              ],
            );
          }
          return ListView(
            children: [
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 14,
                    color: kGreyColor,
                  ),
                  children: [
                    TextSpan(
                        text: '0',
                        style: TextStyle(
                          color: kMainColor,
                        )),
                    TextSpan(text: '건')
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
