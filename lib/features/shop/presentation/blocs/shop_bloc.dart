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
            final item = itemlist[index];

            itemlist[index] = ShoeApiResult(
              brand: item.brand,
              colorway: item.colorway,
              description: item.description,
              goatProductId: item.goatProductId,
              id: item.id,
              imageLinks: item.imageLinks,
              lowestResellPrice: item.lowestResellPrice,
              make: item.make,
              releaseDate: item.releaseDate,
              resellLinks: item.resellLinks,
              retailPrice: item.retailPrice,
              shoeName: item.shoeName,
              silhoutte: item.silhoutte,
              styleId: item.styleId,
              thumbnail: item.thumbnail,
              urlKey: item.urlKey,
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

      state.shoes[index] = ShoeApiResult(
        brand: state.shoes[index].brand,
        colorway: state.shoes[index].colorway,
        description: state.shoes[index].description,
        goatProductId: state.shoes[index].goatProductId,
        id: state.shoes[index].id,
        imageLinks: state.shoes[index].imageLinks,
        lowestResellPrice: state.shoes[index].lowestResellPrice,
        make: state.shoes[index].make,
        releaseDate: state.shoes[index].releaseDate,
        resellLinks: state.shoes[index].resellLinks,
        retailPrice: state.shoes[index].retailPrice,
        shoeName: state.shoes[index].shoeName,
        silhoutte: state.shoes[index].silhoutte,
        styleId: state.shoes[index].styleId,
        thumbnail: state.shoes[index].thumbnail,
        urlKey: state.shoes[index].urlKey,
        isFavorite: event.isAdd,
      );

      emit(state.copyWith(
        shoes: state.shoes,
      ));
    } catch (e) {
      emit(state.copyWith(
        getPopularShoesStatus: Status.failure,
        errMsg: e.toString(),
      ));
    }
  }
}
