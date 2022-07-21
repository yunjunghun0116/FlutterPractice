import 'package:app/components/view/navigation_bar_view.dart';
import 'package:app/constants/constants_color.dart';
import 'package:app/controllers/user_controller.dart';
import 'package:app/models/home/point_history/point_history.dart';
import 'package:app/screens/home/pages/point_page/components/point_filter_bottom_sheet.dart';
import 'package:app/utils/local_utils.dart';
import 'package:app/utils/network_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PointHistoryPage extends StatefulWidget {
  const PointHistoryPage({Key? key}) : super(key: key);

  @override
  State<PointHistoryPage> createState() => _PointHistoryPageState();
}

class _PointHistoryPageState extends State<PointHistoryPage> {
  int totalPoint = 0;
  DateTime? filterDate;
  bool isRecently = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: NavigationBarView(
          title: '포인트'
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            color: kSubBlackColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      '사용 가능 포인트',
                      style: TextStyle(
                        fontSize: 16,
                        color: kWhiteColor,
                      ),
                    ),
                    const Spacer(),
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
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: kMainColor),
                              ),
                            );
                          }
                          return Container();
                        }),
                  ],
                ),
                const Divider(
                  color: kGreyColor,
                ),
                Row(
                  children: [
                    const Text(
                      '소멸 예정(1개월내)',
                      style: TextStyle(
                        color: kGreyColor,
                        fontSize: 14,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        //TODO 조회하기 클릭시 이벤트
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            '조회하기',
                            style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 14,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                            color: kWhiteColor,
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: kLightGreyColor,
                  ),
                  child: const Icon(
                    Icons.filter_alt_rounded,
                    size: 16,
                  ),
                ),
                const SizedBox(width: 5),
                const Text('필터'),
                const Spacer(),
                GestureDetector(
                  onTap: () async {
                    Map<String, dynamic>? result =
                        await Get.bottomSheet(const PointFilterBottomSheet());
                    if (result != null) {
                      // 어떤 카테고리 ex) 전체, 2022년 5월~ 등이 존재하는데 이를 클릭하게되면 여기로오고
                      if (result['isAll']) {
                        //전체가 클릭되었을때
                        setState(() {
                          filterDate = null;
                        });
                        return;
                      }
                      //isRecently == true: 마지막날짜를 지정하지않음
                      //isRecently == false: 마지막날짜는 지정날짜 + 1달
                      setState(() {
                        filterDate = result['date'];
                        isRecently = result['isRecently'];
                      });
                    }
                  },
                  child: Row(
                    children: [
                      Text(filterDate != null
                          ? '${filterDate!.year}년 ${filterDate!.month}월${isRecently ? '~' : ''}'
                          : '전체'),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: kGreyColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          FutureBuilder(
            future: NetworkUtils().getPointHistory(
                UserController.to.user!, filterDate, isRecently),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<PointHistory> result = snapshot.data as List<PointHistory>;
                List<PointHistory> pointHistoryList = result;
                return Column(
                  children: pointHistoryList.map((e) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: const BoxDecoration(
                          border: Border(
                              top: BorderSide(
                        color: kLightGreyColor,
                      ))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${getCategoryInPointHistory(e.pointCategory)} | ${e.pointCategoryName}',
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                getDateTime(e.txDate),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: kGreyColor,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Text(
                            '+${e.txAmount}P',
                            style: const TextStyle(
                              color: kBlueColor,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                );
              }
              return Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(16),
                    color: kSubBlackColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Text(
                              '사용 가능 포인트',
                              style: TextStyle(
                                fontSize: 16,
                                color: kWhiteColor,
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                        const Divider(
                          color: kGreyColor,
                        ),
                        Row(
                          children: [
                            const Text(
                              '소멸 예정(1개월내)',
                              style: TextStyle(
                                color: kGreyColor,
                                fontSize: 14,
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                //TODO 조회하기 클릭시 이벤트
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text(
                                    '조회하기',
                                    style: TextStyle(
                                      color: kWhiteColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 12,
                                    color: kWhiteColor,
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: kLightGreyColor,
                          ),
                          child: const Icon(
                            Icons.filter_alt_rounded,
                            size: 16,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Text('필터'),
                        const Spacer(),
                        GestureDetector(
                          onTap: () async {
                            Map<String, dynamic>? result =
                                await Get.bottomSheet(
                                    const PointFilterBottomSheet());
                            if (result != null) {
                              if (result['isAll']) {
                                setState(() {
                                  filterDate = null;
                                });
                                return;
                              }
                              setState(() {
                                filterDate = result['date'];
                                isRecently = result['isRecently'];
                              });
                            }
                          },
                          child: Row(
                            children: [
                              Text(filterDate != null
                                  ? '${filterDate!.year}년 ${filterDate!.month}월${isRecently ? '~' : ''}'
                                  : '전체'),
                              const Icon(
                                Icons.keyboard_arrow_down,
                                color: kGreyColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
