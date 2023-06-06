import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers_app/models/shoe_api_result.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());

  void addToCart(ShoeApiResult data) {
    final index = state.cartItems
        .indexWhere((e) => e.goatProductId == data.goatProductId);

    data = ShoeApiResult(
      brand: data.brand,
      colorway: data.colorway,
      description: data.description,
      goatProductId: data.goatProductId,
      id: data.id,
      imageLinks: data.imageLinks,
      isFavorite: data.isFavorite,
      lowestResellPrice: data.lowestResellPrice,
      make: data.make,
      releaseDate: data.releaseDate,
      resellLinks: data.resellLinks,
      retailPrice: data.retailPrice,
      shoeName: data.shoeName,
      silhoutte: data.silhoutte,
      styleId: data.styleId,
      thumbnail: data.thumbnail,
      urlKey: data.urlKey,
      qty: index.isNegative ? 1 : (data.qty! + 1),
    );

    if (!index.isNegative) {
      List<ShoeApiResult> list = List.from(state.cartItems);

      list.removeWhere((e) => e.goatProductId == data.goatProductId);
    }

    emit(CartState(
      cartItems: [
        ...state.cartItems,
        data,
      ],
      totalAmount: computeTotal(),
    ));
  }

  void removeItem(ShoeApiResult data) {
    List<ShoeApiResult> list = List.from(state.cartItems);

    list.removeWhere((e) => e.goatProductId == data.goatProductId);

    emit(CartState(
      cartItems: list,
      totalAmount: computeTotal(),
    ));
  }

  double computeTotal() {
    double num = 0;
    for (var x in state.cartItems) {
      num = num + ((x.retailPrice?.toDouble() ?? 0.00) * (x.qty ?? 0));
    }

    return num;
  }
}
