

import '../entities/dog_image_entity.dart';
import '../repositories/i_get_dog_image_repository.dart' show IGetDogImageRepository;

class GetDogImageUsecase {
  final IGetDogImageRepository _repository;
  GetDogImageUsecase(this._repository);
  Future<DogImage> call() async {
    return await _repository.getDogImage();
  }
}
