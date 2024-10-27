class Item {
  final String id;
  final String title;
  final String description;
  final String imageUrl1;
  final String imageUrl2;
  final String imageUrl3;
  final String imageUrl4;

  final String attribute2;
  final int rooms;
  final int bathrooms;
  final bool isAvailable;
  final String price;
  final String Area;

  Item({
    required this.Area,
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.imageUrl1,
    required this.imageUrl2,
    required this.imageUrl3,
    required this.imageUrl4,
    required this.attribute2,
    required this.rooms,
    required this.bathrooms,
    required this.isAvailable,
  });
}
