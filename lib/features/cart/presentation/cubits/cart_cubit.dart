import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers_app/models/shoe_api_result.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());

  void addToCart(ShoeApiResult data) {
    emit(CartState(
      cartItems: [
        ...state.cartItems,
        data,
      ],
    ));
  }

  void removeItem(ShoeApiResult data) {
    List<ShoeApiResult> list = List.from(state.cartItems);

    list.removeWhere((e) => e.goatProductId == data.goatProductId);

    emit(CartState(
      cartItems: list,
    ));
  }
}
