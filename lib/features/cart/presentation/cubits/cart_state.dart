part of 'cart_cubit.dart';

class CartState extends Equatable {
  const CartState({
    this.cartItems = const [],
    this.totalAmount = 0,
  });
  final List<ShoeApiResult> cartItems;
  final double totalAmount;
  @override
  List<Object?> get props => [
        cartItems,
        totalAmount,
      ];
}
