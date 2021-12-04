import 'package:flutter/material.dart';
import '../../../components/artist_card.dart';
import 'artist_division_card.dart';

class RecommendArtistArea extends StatelessWidget {
  const RecommendArtistArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ArtistDivisionCard(
          title: '추천 아티스트',
          onPressed: () {},
        ),
        const ArtistCard(
          imageUrl:
          'https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202104/17/6c0f1c1d-6c28-4734-bef3-a4dd11ebe5df.jpg',
          designerName: '라쿤 디자이너',
          shopName: '라쿤네일',
          shopAddress: '대전 서구 둔산동',
          distance: 1.5,
          portfolioCount: 100,
          viewCount: 2400,
          likeCount: 50,
          portfolioList: [1, 2, 3],
        ),
        const ArtistCard(
          imageUrl:
          'https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202104/17/6c0f1c1d-6c28-4734-bef3-a4dd11ebe5df.jpg',
          designerName: '라쿤 디자이너',
          shopName: '라쿤네일',
          shopAddress: '대전 서구 둔산동',
          distance: 1.5,
          portfolioCount: 100,
          viewCount: 2400,
          likeCount: 50,
          portfolioList: [1],
        ),
      ],
    );
  }
}
