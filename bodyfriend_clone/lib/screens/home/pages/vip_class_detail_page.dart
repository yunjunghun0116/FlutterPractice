import 'package:bodyfriend_clone/constants.dart';
import 'package:bodyfriend_clone/models/vip_class.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../utils/local_utils.dart';
import '../../../utils/network_utils.dart';

class VIPClassDetailPage extends StatefulWidget {
  final int vipClassId;
  const VIPClassDetailPage({
    Key? key,
    required this.vipClassId,
  }) : super(key: key);

  @override
  State<VIPClassDetailPage> createState() => _VIPClassDetailPageState();
}

class _VIPClassDetailPageState extends State<VIPClassDetailPage> {
  bool isFullImage = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: NetworkUtils().getVIPClassDetail(widget.vipClassId),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          VIPClass vipClass = snapshot.data;
          String statusText = vipClass.status == 'ACTIVE'
              ? (vipClass.applied! ? '신청완료' : '신청하기')
              : '신청마감';
          Color buttonColor =
              vipClass.status == 'ACTIVE' ? kMainColor : kGreyColor;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: kWhiteColor,
              foregroundColor: kBlackColor,
              title: const Text(
                'VIP클래스 상세',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              elevation: 1,
            ),
            body: ListView(
              children: [
                CachedNetworkImage(
                  imageUrl: vipClass.detailImage,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        vipClass.title,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                                'assets/memberships/ic_time_gray5_18px@3x.png'),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            getDateTime(vipClass.eventDate),
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            ' | ${vipClass.eventStartTime}~${vipClass.eventEndTime} (${vipClass.eventMinute})',
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: Image.asset(
                              'assets/memberships/ic_map_pin_gray5_18px@3x.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            vipClass.placeName,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            '신청기간 ',
                            style: TextStyle(
                              color: kGreyColor,
                            ),
                          ),
                          Text(getApplyDateTime(
                              vipClass.applyStartDate, vipClass.applyEndDate)),
                          const SizedBox(width: 10),
                          const Text(
                            '참가비 ',
                            style: TextStyle(
                              color: kGreyColor,
                            ),
                          ),
                          vipClass.price > 0
                              ? Container(
                                  padding: const EdgeInsets.all(2),
                                  child: Text(
                                    '${vipClass.price} 원',
                                  ),
                                )
                              : Container(
                                  padding: const EdgeInsets.all(2),
                                  child: const Text(
                                    '무료',
                                  ),
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: isFullImage ? null : 300,
                  child: Html(
                    data: vipClass.imageForm,
                  ),
                ),
                isFullImage
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            isFullImage = !isFullImage;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.all(16),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: kGreyColor),
                          ),
                          child: const Text(
                            'VIP클래스정보 접기',
                            style: TextStyle(
                              color: kGreyColor,
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            isFullImage = !isFullImage;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.all(16),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: kGreyColor),
                          ),
                          child: const Text(
                            'VIP클래스정보 더보기',
                            style: TextStyle(
                              color: kGreyColor,
                            ),
                          ),
                        ),
                      ),
              ],
            ),
            bottomNavigationBar: GestureDetector(
              onTap: () {
                print('신청하기');
              },
              child: Container(
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom),
                alignment: Alignment.center,
                height: 50,
                decoration: BoxDecoration(
                  color: buttonColor,
                  gradient: vipClass.status == 'ACTIVE'
                      ? LinearGradient(
                          colors: [kMainColor.withOpacity(0.7), kMainColor],
                        )
                      : null,
                ),
                child: Text(
                  statusText,
                  style: const TextStyle(
                    color: kWhiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
