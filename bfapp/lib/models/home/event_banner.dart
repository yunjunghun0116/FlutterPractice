class EventBanner {
  final int eventId;
  final String mainBannerType;
  final String homeBannerImage;

  EventBanner(
      {required this.eventId,
      required this.mainBannerType,
      required this.homeBannerImage});

  factory EventBanner.fromJson(json) => EventBanner(
        eventId: json['eventId'],
        mainBannerType: json['mainBannerType'],
        homeBannerImage: json['homeBannerImage'],
      );
}
