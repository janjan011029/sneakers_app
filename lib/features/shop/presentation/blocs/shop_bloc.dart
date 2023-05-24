import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/shoe_api_result.dart';
import '../../../../utils/constant/app_enums.dart';
import '../../repositories/i_shop_repository.dart';

part 'shop_event.dart';
part 'shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  final IShopRepository _iShopRepository;

  ShopBloc(IShopRepository iShopRepository)
      : _iShopRepository = iShopRepository,
        super(const ShopState()) {
    on<GetShoes>(_getShoes);
  }

  FutureOr<void> _getShoes(GetShoes event, Emitter<ShopState> emit) async {
    try {
      emit(state.copyWith(getShoesStatus: Status.loading));

      final itemlist = await _iShopRepository.getAllShoesApi();

      if (itemlist.isEmpty) {
        emit(state.copyWith(
          getShoesStatus: Status.failure,
        ));
      }

      if (itemlist.isNotEmpty) {
        emit(state.copyWith(
          shoes: itemlist,
          getShoesStatus: Status.success,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        getShoesStatus: Status.failure,
        errMsg: e.toString(),
      ));
    }
  }
}
