class BookingModel {
  final String id;
  final String name;
  final String location;
  final String image;
  final double price;
  final double rating;
  final String address;
  final bool isAvailable;

  BookingModel({
    required this.id,
    required this.name,
    required this.location,
    required this.image,
    required this.price,
    required this.rating,
    required this.address,
    this.isAvailable = true,
  });
}
