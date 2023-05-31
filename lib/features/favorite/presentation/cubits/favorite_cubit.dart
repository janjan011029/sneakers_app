import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../models/shoe_api_result.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(const FavoriteState());

  void addToFavorite(ShoeApiResult data) async {
    final pref = await SharedPreferences.getInstance();
    final List<String> favorites = [];

    final res =
        state.favoriteItems.where((e) => e.goatProductId == data.goatProductId);

    if (res.isNotEmpty) {
      emit(FavoriteState(
        favoriteItems: state.favoriteItems,
        alreadyExist: true,
      ));

      return;
    }

    emit(FavoriteState(
      favoriteItems: [
        ...state.favoriteItems,
        data,
      ],
    ));

    for (var x in state.favoriteItems) {
      favorites.add(x.goatProductId.toString());
    }

    await pref.setStringList('favorites', favorites);
    await pref.setString('items', jsonEncode(state.favoriteItems));
  }

  bool removeFromFavorite(ShoeApiResult data) {
    final favorites = state.favoriteItems.remove(data);

    emit(FavoriteState(
      favoriteItems: state.favoriteItems,
    ));

    return favorites;
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
