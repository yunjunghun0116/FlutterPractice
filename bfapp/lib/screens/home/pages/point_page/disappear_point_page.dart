import 'package:app/controllers/user_controller.dart';
import 'package:app/icon.dart';
import 'package:app/utils/network_utils.dart';
import 'package:flutter/material.dart';

import '../../../../components/view/navigation_bar_view.dart';
import '../../../../constants/constants_color.dart';

class DisappearPointPage extends StatelessWidget {
  const DisappearPointPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBarView(
        title: '소멸 예정 포인트',
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: NetworkUtils()
                  .getDisappearAmountPoint(UserController.to.user!.accessToken),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(20),
                    width: double.infinity,
                    color: kBackgroundColor,
                    child: Row(
                      children: [
                        const Text(
                          '소멸 예정 포인트',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const Text(
                          ' (1개월내)',
                          style: TextStyle(
                            color: kGreyColor,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '${snapshot.data}P',
                          style: const TextStyle(
                            color: kMainColor,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  color: kBackgroundColor,
                  child: Row(
                    children: [
                      const Text(
                        '소멸 예정 포인트',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const Text(
                        ' (1개월내)',
                        style: TextStyle(
                          color: kGreyColor,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        '0P',
                        style: TextStyle(
                          color: kMainColor,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                );
              }),
          Container(
            width: double.infinity,
            height: 5,
            color: kBackgroundColor,
          ),
          Expanded(
            child: FutureBuilder(
                future: NetworkUtils()
                    .getDisappearHistory(UserController.to.user!.accessToken),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List result = snapshot.data as List;
                    if (result.isNotEmpty) {
                      return ListView(
                        children: result.map((history) {
                          return Container();
                        }).toList(),
                      );
                    }
                  }
                  return Column(
                    children: [
                      const SizedBox(height: 100),
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.asset(
                          icLogoLine,
                          color: kLightGreyColor,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        '내역이 없습니다.',
                        style: TextStyle(
                          color: kLightGreyColor,
                          fontSize: 16,
                        ),
                      ),
                      const Spacer(),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
