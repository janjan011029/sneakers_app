part of 'cart_cubit.dart';

class CartState extends Equatable {
  const CartState({
    this.cartItems = const [],
    this.totalAmount = 0,
    this.stripePaymentStatus = Status.initial,
  });
  final List<ShoeApiResult> cartItems;
  final int totalAmount;
  final Status stripePaymentStatus;
  @override
  List<Object?> get props => [
        cartItems,
        totalAmount,
        stripePaymentStatus,
      ];
}
