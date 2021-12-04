import 'package:flutter/material.dart';

class ArtistCard extends StatelessWidget {
  final String imageUrl;
  final String designerName;
  final String shopName;
  final String shopAddress;
  final double distance;
  final int portfolioCount;
  final int viewCount;
  final int likeCount;
  final List portfolioList;
  const ArtistCard({
    Key? key,
    required this.imageUrl,
    required this.designerName,
    required this.shopName,
    required this.shopAddress,
    required this.distance,
    required this.portfolioCount,
    required this.viewCount,
    required this.likeCount,
    required this.portfolioList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: Colors.black,
                        overflow: TextOverflow.ellipsis,
                      ),
                      children: [
                        TextSpan(
                          text: designerName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(text: ' | $shopName'),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        overflow: TextOverflow.ellipsis,
                      ),
                      children: [
                        TextSpan(text: shopAddress),
                        TextSpan(
                          text: ' $distance km',
                          style: const TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: Colors.black26,
                        fontSize: 10,
                        overflow: TextOverflow.ellipsis,
                      ),
                      children: [
                        TextSpan(text: '포트폴리오($portfolioCount)'),
                        TextSpan(
                          text: ' | 조회수($viewCount)',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const Icon(Icons.star_outline),
                  Text('$likeCount'),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                  children: portfolioList.map((e) {
                return Container(
                  margin: const EdgeInsets.all(2),
                  width: 100,
                  height: 100,
                  color: Colors.red,
                );
              }).toList()),
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}
