import '../../../models/shoe_api_result.dart';

abstract class IShopRepository {
  Future<List<ShoeApiResult>> getAllShoesApi();
}
