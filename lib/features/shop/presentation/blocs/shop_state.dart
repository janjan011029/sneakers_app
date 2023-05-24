part of 'shop_bloc.dart';

class ShopState extends Equatable {
  const ShopState({
    this.shoes = const [],
    this.getShoesStatus = Status.initial,
    this.errMsg = '',
  });

  final List<ShoeApiResult> shoes;
  final Status getShoesStatus;
  final String errMsg;

  ShopState copyWith({
    List<ShoeApiResult>? shoes,
    Status? getShoesStatus,
    String? errMsg,
  }) {
    return ShopState(
      shoes: shoes ?? this.shoes,
      getShoesStatus: getShoesStatus ?? this.getShoesStatus,
      errMsg: errMsg ?? this.errMsg,
    );
  }

  @override
  List<Object?> get props => [
        shoes,
        getShoesStatus,
      ];
}
