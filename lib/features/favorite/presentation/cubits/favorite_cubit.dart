import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../models/shoe_api_result.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(const FavoriteState());

  void saveTolocal(List<String> favorites, List<ShoeApiResult> items) async {
    final pref = await SharedPreferences.getInstance();

    for (var x in items) {
      favorites.add(x.goatProductId.toString());
    }

    await pref.setStringList('favorites', favorites);
    await pref.setString('items', jsonEncode(items));
  }

  void removeItem(ShoeApiResult data) {
    List<ShoeApiResult> list = List.from(state.favoriteItems);

    list.removeWhere((e) => e.goatProductId == data.goatProductId);

    emit(FavoriteState(
      favoriteItems: list,
    ));

    saveTolocal([], state.favoriteItems);
  }

  void addToFavorite(ShoeApiResult data) async {
    final List<String> favorites = [];

    emit(FavoriteState(
      favoriteItems: [
        ...state.favoriteItems,
        data,
      ],
    ));

    saveTolocal(favorites, state.favoriteItems);
  }

  void setAlreadyExistToFalse() {
    emit(FavoriteState(
      favoriteItems: state.favoriteItems,
      alreadyExist: false,
    ));
  }

  void initState() async {
    final pref = await SharedPreferences.getInstance();
    final List<ShoeApiResult> items = [];
    final json = pref.getString('items') ?? '';

    if (json.isEmpty) return;

    final List<dynamic> data = jsonDecode(json);

    for (var x in data) {
      items.add(ShoeApiResult.fromJson(x));
    }
    emit(FavoriteState(
      favoriteItems: items,
    ));
  }
}
