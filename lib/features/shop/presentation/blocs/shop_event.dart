part of 'shop_bloc.dart';

abstract class ShopEvent extends Equatable {
  const ShopEvent();

  @override
  List<Object> get props => [];
}

class GetShoes extends ShopEvent {}

class GetPopularShoes extends ShopEvent {}

class AddToFavorites extends ShopEvent {
  const AddToFavorites({
    required this.isAdd,
    required this.id,
  });

  final bool isAdd;
  final int id;
}
