import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pluxee_web_poc/core/navigation/routes.dart';
import 'package:provider/provider.dart';
import 'data/data.dart';
import 'domain/usecases/get_product_usecase.dart';
import 'presentation/presentation.dart';

void main() {
  final datasource = GetProductDatasource(Dio());
  final repository = GetProductRepository(datasource: datasource);
  runApp(
    ChangeNotifierProvider(
      create:
          (_) => ProductProvider(
            productUseCase: GetProductUseCase(repository: repository),
          ),

      child: MaterialApp(
        title: 'Pluxee Web POC',
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'plx'),
        routes: Navigation.routing,
      ),
    ),
  );
}
