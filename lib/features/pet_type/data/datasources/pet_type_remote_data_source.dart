import '../../../../core/network/dio_client.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/pet_type_model.dart';

abstract class PetTypeRemoteDataSource {
  Future<List<PetTypeModel>> getAllPetTypes();
}

class PetTypeRemoteDataSourceImpl implements PetTypeRemoteDataSource {
  final DioClient _dioClient;

  PetTypeRemoteDataSourceImpl(this._dioClient);

  @override
  Future<List<PetTypeModel>> getAllPetTypes() async {
    try {
      final response = await _dioClient.get(ApiEndpoints.getAllPetTypes);
      if (response.data != null && response.data['data'] != null) {
        return (response.data['data'] as List)
            .map((json) => PetTypeModel.fromJson(json))
            .toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }
}
