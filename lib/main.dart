import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pluxee_web_poc/presentation/pages/signup/login_page.dart';
import 'package:provider/provider.dart';

import 'data/datasources/get_dog_image_datasource.dart'
    show GetDogImageDataSource;
import 'data/repositories/get_dog_image_repository.dart'
    show GetDogImageRepository;
import 'domain/usecases/get_dog_image_usecase.dart' show GetDogImageUsecase;

import 'presentation/providers/dog_provider.dart';

void main() {
  final datasource = GetDogImageDataSource(Dio());
  final repository = GetDogImageRepository(datasource);
  runApp(
    ChangeNotifierProvider(
      create:
          (_) =>
              DogProvider(getDogImageUsecase: GetDogImageUsecase(repository)),
      child: MaterialApp(
        title: 'Pluxee Web POC',
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'plx'),
        home: LoginPage(),
      ),
    ),
  );
}
