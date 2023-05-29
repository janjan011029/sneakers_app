import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/shoe_api_result.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(const FavoriteState());

  void addToFavorite(ShoeApiResult data) {
    final res = state.favoriteItems.where((e) => e.id == data.id);

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
}
