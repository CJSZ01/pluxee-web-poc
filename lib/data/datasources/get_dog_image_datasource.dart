import 'package:dio/dio.dart';

abstract class IGetDogImageDataSource {
  Future<Map<String, dynamic>> getDogImage();
}

class GetDogImageDataSource implements IGetDogImageDataSource {
  final Dio dio;
  GetDogImageDataSource(this.dio);
  @override
  Future<Map<String, dynamic>> getDogImage() async {
    try {
      final response = await dio.get('https://dog.ceo/api/breeds/image/random');
      return response.data;
    } catch (e) {
      throw Exception('Erro ao carregar imagem: $e');
    }
  }
}
