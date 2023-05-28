part of 'favorite_cubit.dart';

class FavoriteState extends Equatable {
  const FavoriteState({
    this.favoriteItems = const <ShoeApiResult>[],
  });

  final List<ShoeApiResult> favoriteItems;
  @override
  List<Object?> get props => [
        favoriteItems,
      ];
}
