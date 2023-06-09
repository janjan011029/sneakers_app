import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneakers_app/features/cart/repositories/istripe_repository.dart';
import 'package:sneakers_app/models/shoe_api_result.dart';

import '../../../../utils/constant/app_enums.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final IStripeRepository _stripeRepository;
  CartCubit(IStripeRepository iStripeRepository)
      : _stripeRepository = iStripeRepository,
        super(const CartState());

  void addToCart(ShoeApiResult data) {
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
      qty: 1,
    );

    emit(CartState(
      cartItems: [...state.cartItems, data],
      totalAmount: state.totalAmount,
    ));

    computeTotal();
  }

  void addQty(ShoeApiResult data) {
    final index = state.cartItems
        .indexWhere((e) => e.goatProductId == data.goatProductId);

    if (index.isNegative) return;

    state.cartItems[index] = ShoeApiResult(
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
      qty: (data.qty ?? 0) + 1,
    );

    emit(CartState(
      cartItems: state.cartItems,
      totalAmount: state.totalAmount,
    ));

    computeTotal();
  }

  void lessQty(ShoeApiResult data) {
    final index = state.cartItems
        .indexWhere((e) => e.goatProductId == data.goatProductId);

    if (index.isNegative) return;
    if (data.qty == 1) return;

    state.cartItems[index] = ShoeApiResult(
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
      qty: (data.qty ?? 0) - 1,
    );

    emit(CartState(
      cartItems: state.cartItems,
      totalAmount: state.totalAmount,
    ));

    computeTotal();
  }

  void removeItem(ShoeApiResult data) {
    List<ShoeApiResult> list = List.from(state.cartItems);

    list.removeWhere((e) => e.goatProductId == data.goatProductId);

    emit(CartState(
      cartItems: list,
      totalAmount: state.totalAmount,
    ));

    computeTotal();
  }

  void computeTotal() {
    double num = 0;
    for (var x in state.cartItems) {
      num = num + ((x.retailPrice?.toDouble() ?? 0.00) * (x.qty ?? 0));
    }

    emit(CartState(
      cartItems: state.cartItems,
      stripePaymentStatus: state.stripePaymentStatus,
      totalAmount: num.truncate(),
    ));
  }

  void resetState() {
    emit(const CartState());
  }

  Future<void> makePayment(
      {required String amount, required String currency}) async {
    try {
      emit(CartState(
        stripePaymentStatus: Status.initial,
        cartItems: state.cartItems,
        totalAmount: state.totalAmount,
      ));

      final isSuccess = await _stripeRepository.makePayment(
        amount: amount,
        currency: currency,
      );

      if (isSuccess) {
        emit(CartState(
          stripePaymentStatus: Status.success,
          cartItems: state.cartItems,
          totalAmount: state.totalAmount,
        ));
      }
    } catch (e) {
      emit(CartState(
        stripePaymentStatus: Status.failure,
        cartItems: state.cartItems,
        totalAmount: state.totalAmount,
      ));
    }
  }
}
