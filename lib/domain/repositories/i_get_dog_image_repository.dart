import '../entities/dog_image_entity.dart';

abstract class IGetDogImageRepository {
  Future<DogImage> getDogImage();
}
