import 'package:bodyfriend_clone/constants.dart';
import 'package:bodyfriend_clone/models/vip_class.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/local_utils.dart';

class VIPClassDetailPage extends StatefulWidget {
  final VIPClass vipClass;
  const VIPClassDetailPage({
    Key? key,
    required this.vipClass,
  }) : super(key: key);

  @override
  State<VIPClassDetailPage> createState() => _VIPClassDetailPageState();
}

class _VIPClassDetailPageState extends State<VIPClassDetailPage> {
  bool isFullImage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
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
            imageUrl: widget.vipClass.detailImage,
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
                  widget.vipClass.title,
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
                      getDateTime(widget.vipClass.eventDate),
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      ' | ${widget.vipClass.eventStartTime}~${widget.vipClass.eventEndTime} (${widget.vipClass.eventMinute})',
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
                      widget.vipClass.placeName,
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
                    Text(getApplyDateTime(widget.vipClass.applyStartDate,
                        widget.vipClass.applyEndDate)),
                    const SizedBox(width: 10),
                    const Text(
                      '참가비 ',
                      style: TextStyle(
                        color: kGreyColor,
                      ),
                    ),
                    widget.vipClass.price > 0
                        ? Container(
                            padding: const EdgeInsets.all(2),
                            child: Text(
                              '${widget.vipClass.price} 원',
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
            child: Image.asset(
              'assets/memberships/guide_relocation_amount@3x.png',
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
          isFullImage
              ? Container()
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
      bottomNavigationBar: BottomAppBar(
        child: GestureDetector(
          onTap: () {
            print('신청하기');
          },
          child: Container(
            alignment: Alignment.center,
            height: 50,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [kMainColor.withOpacity(0.7), kMainColor])),
            child: const Text(
              '신청하기',
              style: TextStyle(
                color: kWhiteColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
