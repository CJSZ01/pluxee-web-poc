import '../../domain/entities/dog_image_entity.dart';
import '../../domain/repositories/i_get_dog_image_repository.dart';
import '../datasources/get_dog_image_datasource.dart'
    show IGetDogImageDataSource;

class GetDogImageRepository implements IGetDogImageRepository {
  final IGetDogImageDataSource dataSource;

  GetDogImageRepository(this.dataSource);

  @override
  Future<DogImage> getDogImage() async {
    final response = await dataSource.getDogImage();
    return DogImage(imageUrl: response['message'], status: response['status']);
  }
}
