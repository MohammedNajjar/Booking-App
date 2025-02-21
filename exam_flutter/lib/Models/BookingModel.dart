class BookingModel {
  final String id;
  final String name;
  final String location;
  final double price;
  final String imageUrl;
  final double rating;
  final bool isVisible;

  BookingModel({
    required this.id,
    required this.name,
    required this.location,
    required this.price,
    required this.imageUrl,
    required this.rating,
    this.isVisible = true,
  });
}
