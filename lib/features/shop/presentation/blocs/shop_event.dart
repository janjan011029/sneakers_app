part of 'shop_bloc.dart';

abstract class ShopEvent extends Equatable {
  const ShopEvent();

  @override
  List<Object> get props => [];
}

class GetShoes extends ShopEvent {}

class GetPopularShoes extends ShopEvent {}
