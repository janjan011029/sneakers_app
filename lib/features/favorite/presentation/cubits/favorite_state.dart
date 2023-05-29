part of 'favorite_cubit.dart';

class FavoriteState extends Equatable {
  const FavoriteState({
    this.favoriteItems = const <ShoeApiResult>[],
    this.alreadyExist = false,
  });

  final List<ShoeApiResult> favoriteItems;
  final bool alreadyExist;
  @override
  List<Object?> get props => [
        favoriteItems,
        alreadyExist,
      ];
}
