import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../models/shoe_api_result.dart';
import '../../../../utils/constant/app_enums.dart';
import '../../repositories/i_shop_repository.dart';

part 'shop_event.dart';
part 'shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  final IShopRepository _iShopRepository;

  ShopBloc(IShopRepository iShopRepository)
      : _iShopRepository = iShopRepository,
        super(const ShopState()) {
    on<GetShoes>(_getShoes);
    on<GetPopularShoes>(_getPopularShoes);
    on<AddToFavorites>(_addToFavorites);
    on<SetEmittedToFalse>(_setEmittedToFalse);
  }

  FutureOr<void> _getShoes(GetShoes event, Emitter<ShopState> emit) async {
    try {
      final pref = await SharedPreferences.getInstance();

      final List<String> favorites = pref.getStringList('favorites') ?? [];

      emit(state.copyWith(getShoesStatus: Status.loading));

      final itemlist = await _iShopRepository.getAllShoesApi();

      if (itemlist.isEmpty) {
        emit(state.copyWith(
          getShoesStatus: Status.failure,
        ));
      }

      if (favorites.isNotEmpty) {
        for (var fav in favorites) {
          final index =
              itemlist.indexWhere((e) => e.goatProductId == int.parse(fav));
          if (!index.isNegative) {
            itemlist[index] = itemlist[index].copyWith(
              isFavorite: true,
            );
          }
        }
      }

      if (itemlist.isNotEmpty) {
        emit(state.copyWith(
          shoes: itemlist,
          getShoesStatus: Status.success,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        getShoesStatus: Status.failure,
        errMsg: e.toString(),
      ));
    }
  }

  FutureOr<void> _getPopularShoes(
      GetPopularShoes event, Emitter<ShopState> emit) async {
    try {
      emit(state.copyWith(getShoesStatus: Status.loading));

      final itemlist = await _iShopRepository.getPopularShoesApi();

      if (itemlist.isEmpty) {
        emit(state.copyWith(
          getPopularShoesStatus: Status.failure,
        ));
      }

      if (itemlist.isNotEmpty) {
        emit(state.copyWith(
          popularShoes: itemlist,
          getPopularShoesStatus: Status.success,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        getPopularShoesStatus: Status.failure,
        errMsg: e.toString(),
      ));
    }
  }

  FutureOr<void> _addToFavorites(
      AddToFavorites event, Emitter<ShopState> emit) {
    try {
      final index = state.shoes.indexWhere((e) => e.goatProductId == event.id);
      final shoes = state.shoes[index];

      state.shoes[index] = ShoeApiResult(
        brand: shoes.brand,
        colorway: shoes.colorway,
        description: shoes.description,
        goatProductId: shoes.goatProductId,
        id: shoes.id,
        imageLinks: shoes.imageLinks,
        lowestResellPrice: state.shoes[index].lowestResellPrice,
        make: shoes.make,
        releaseDate: shoes.releaseDate,
        resellLinks: shoes.resellLinks,
        retailPrice: shoes.retailPrice,
        shoeName: shoes.shoeName,
        silhoutte: shoes.silhoutte,
        styleId: shoes.styleId,
        thumbnail: shoes.thumbnail,
        urlKey: shoes.urlKey,
        isFavorite: event.isAdd,
      );

      emit(state.copyWith(
        shoes: state.shoes,
        emitted: true,
      ));
    } catch (e) {
      emit(state.copyWith(
        getPopularShoesStatus: Status.failure,
        errMsg: e.toString(),
      ));
    }
  }

  FutureOr<void> _setEmittedToFalse(
      SetEmittedToFalse event, Emitter<ShopState> emit) {
    emit(state.copyWith(emitted: false));
  }
}
