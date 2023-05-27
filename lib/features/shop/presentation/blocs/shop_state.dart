part of 'shop_bloc.dart';

class ShopState extends Equatable {
  const ShopState({
    this.shoes = const [],
    this.popularShoes = const [],
    this.getShoesStatus = Status.initial,
    this.getPopularShoesStatus = Status.initial,
    this.errMsg = '',
  });

  final List<ShoeApiResult> shoes;
  final List<ShoeApiResult> popularShoes;
  final Status getShoesStatus;
  final Status getPopularShoesStatus;
  final String errMsg;

  ShopState copyWith({
    List<ShoeApiResult>? shoes,
    List<ShoeApiResult>? popularShoes,
    Status? getShoesStatus,
    Status? getPopularShoesStatus,
    String? errMsg,
  }) {
    return ShopState(
      shoes: shoes ?? this.shoes,
      popularShoes: popularShoes ?? this.popularShoes,
      getShoesStatus: getShoesStatus ?? this.getShoesStatus,
      getPopularShoesStatus:
          getPopularShoesStatus ?? this.getPopularShoesStatus,
      errMsg: errMsg ?? this.errMsg,
    );
  }

  @override
  List<Object?> get props => [
        shoes,
        popularShoes,
        getShoesStatus,
        getPopularShoesStatus,
        errMsg,
      ];
}
