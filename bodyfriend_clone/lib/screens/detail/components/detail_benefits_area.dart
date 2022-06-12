import 'package:bodyfriend_clone/constants.dart';
import 'package:bodyfriend_clone/models/benefit/benefit.dart';
import 'package:flutter/material.dart';

class DetailBenefitsArea extends StatelessWidget {
  final List<Benefit>? benefits;
  const DetailBenefitsArea({Key? key, this.benefits}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 60,
              alignment: Alignment.center,
              child: const Text(
                '혜택',
                style: TextStyle(
                  color: kGreyColor,
                ),
              ),
            ),
            benefits != null && benefits!.isNotEmpty
                ? Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...benefits!.map((e) {
                          return Row(
                            children: [
                              Text(
                                e.highlight,
                                style: TextStyle(
                                  color: Color(
                                    int.parse('0xFF${e.color.substring(1)}'),
                                  ),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(e.text.replaceAll(e.highlight, '')),
                            ],
                          );
                        }).toList(),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  color: kMainColor,
                                )),
                                child: const Text(
                                  '제휴카드',
                                  style: TextStyle(
                                    color: kMainColor,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  color: kMainColor,
                                )),
                                child: const Text(
                                  '무이자',
                                  style: TextStyle(
                                    color: kMainColor,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  color: kMainColor,
                                )),
                                child: const Text(
                                  '선납금',
                                  style: TextStyle(
                                    color: kMainColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                : Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: kMainColor,
                      )),
                      child: const Text(
                        '무이자/제휴카드 혜택',
                        style: TextStyle(
                          color: kMainColor,
                        ),
                      ),
                    ),
                  ),
            const SizedBox(width: 20),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Container(
              width: 60,
              alignment: Alignment.center,
              child: const Text(
                '할인',
                style: TextStyle(
                  color: kGreyColor,
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: kRedColor,
                )),
                child: const Text(
                  '할인쿠폰 보기',
                  style: TextStyle(
                    color: kRedColor,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 60,
              alignment: Alignment.center,
              child: const Text(
                '배송',
                style: TextStyle(
                  color: kGreyColor,
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: const Text(
                  '배송비 무료 (제주도 배송비 추가)',
                ),
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ],
    );
  }
}
