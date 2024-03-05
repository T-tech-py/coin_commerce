class LocationEntity {
  final String address;
  final String city;
  final String country;
  final num latitude;
  final num longitude;

  LocationEntity( {required this.address,
    required this.longitude,required this.latitude,required this.city, required this.country,});
}