class Facility {
  final String searchContent;
  final String name;
  final String address;
  final String website;
  final double lat;
  final double long;
  final double distanceFromClient;

  Facility({
    required this.searchContent,
    required this.name,
    required this.address,
    required this.lat,
    required this.long,
    this.website = "",
    this.distanceFromClient = double.maxFinite,
  });

  String getSearchContent() => searchContent;
  String getName() => name;
  String getAddress() => address;
  String getWebsite() => website;
  double getLat() => lat;
  double getLong() => long;
}
