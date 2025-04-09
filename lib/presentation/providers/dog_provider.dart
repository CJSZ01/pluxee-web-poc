import 'package:flutter/material.dart';

import '../../domain/entities/dog_image_entity.dart' show DogImage;
import '../../domain/usecases/get_dog_image_usecase.dart'
    show GetDogImageUsecase;

class DogProvider with ChangeNotifier {
  final GetDogImageUsecase getDogImageUsecase;

  DogImage? dogImage;

  bool isLoading = false;
  String? error;

  DogProvider({required this.getDogImageUsecase});

  Future<void> getDogImage() async {
    isLoading = true;
    notifyListeners();
    try {
      dogImage = await getDogImageUsecase();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
