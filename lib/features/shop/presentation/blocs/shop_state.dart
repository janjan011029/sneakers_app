part of 'shop_bloc.dart';

class ShopState extends Equatable {
  const ShopState({
    this.shoes = const [],
    this.popularShoes = const [],
    this.favoriteShoes = const [],
    this.getShoesStatus = Status.initial,
    this.getPopularShoesStatus = Status.initial,
    this.errMsg = '',
    this.emitted = false,
  });

  final List<ShoeApiResult> shoes;
  final List<ShoeApiResult> popularShoes;
  final List<ShoeApiResult> favoriteShoes;
  final Status getShoesStatus;
  final Status getPopularShoesStatus;
  final String errMsg;
  final bool emitted;

  ShopState copyWith({
    List<ShoeApiResult>? shoes,
    List<ShoeApiResult>? popularShoes,
    List<ShoeApiResult>? favoriteShoes,
    Status? getShoesStatus,
    Status? getPopularShoesStatus,
    String? errMsg,
    bool? emitted,
  }) {
    return ShopState(
      shoes: shoes ?? this.shoes,
      popularShoes: popularShoes ?? this.popularShoes,
      favoriteShoes: favoriteShoes ?? this.favoriteShoes,
      getShoesStatus: getShoesStatus ?? this.getShoesStatus,
      getPopularShoesStatus:
          getPopularShoesStatus ?? this.getPopularShoesStatus,
      errMsg: errMsg ?? this.errMsg,
      emitted: emitted ?? this.emitted,
    );
  }

  @override
  List<Object?> get props => [
        shoes,
        popularShoes,
        favoriteShoes,
        getShoesStatus,
        getPopularShoesStatus,
        errMsg,
        emitted,
      ];
}
