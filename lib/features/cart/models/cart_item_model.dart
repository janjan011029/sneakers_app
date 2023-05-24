class CartitemModel {
  final String name;
  final String description;
  final int qty;
  final int price;
  final int rating;
  final bool isFavorite;
  final int stock;

  CartitemModel({
    required this.name,
    required this.description,
    required this.qty,
    required this.price,
    required this.rating,
    required this.isFavorite,
    required this.stock,
  });
}
