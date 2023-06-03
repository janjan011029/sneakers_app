part of 'cart_cubit.dart';

class CartState extends Equatable {
  const CartState({
    this.cartItems = const [],
  });
  final List<ShoeApiResult> cartItems;
  @override
  List<Object?> get props => [];
}
