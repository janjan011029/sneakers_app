import 'package:dio/dio.dart';
import 'package:sneakers_app/features/shop/repositories/i_shop_repository.dart';
import 'package:sneakers_app/models/shoe_api_result.dart';

import '../../../api/client.dart';
import '../../../api/dio_exception.dart';
import '../../../utils/constant/api_urls.dart';

class ShopRepository implements IShopRepository {
  final DioClient _dioClient;

  ShopRepository({required DioClient dioClient}) : _dioClient = dioClient;

  @override
  Future<List<ShoeApiResult>> getAllShoesApi() async {
    try {
      final res = await _dioClient.get(
        ApiUrls.getAllNikeShoesUrl,
      );

      final data = res.data;
      List<ShoeApiResult> shoeList = [];

      for (var x in data) {
        final shoe = ShoeApiResult.fromJson(x);
        shoeList.add(shoe);
      }

      return shoeList;
    } on DioError catch (err) {
      final errMsg = DioException.fromDioError(err).toString();

      throw errMsg;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<ShoeApiResult>> getPopularShoesApi() async {
    try {
      final res = await _dioClient.get(
        ApiUrls.getPopularShoesUrl,
      );

      final data = res.data;
      List<ShoeApiResult> shoeList = [];

      for (var x in data) {
        final shoe = ShoeApiResult.fromJson(x);
        shoeList.add(shoe);
      }

      return shoeList;
    } on DioError catch (err) {
      final errMsg = DioException.fromDioError(err).toString();

      throw errMsg;
    } catch (e) {
      throw e.toString();
    }
  }
}
