import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluxee_web_poc/core/constants/storage_keys.dart';
import 'package:pluxee_web_poc/domain/domain.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/data.dart';
import 'product_list_state.dart';

final class ProductListCubit extends Cubit<ProductListState> {
  ProductListCubit() : super(ProductListState.initial());
  final IGetProductUseCase _getProductUsecase = GetProductUseCase(
    repository: GetProductRepository(datasource: GetProductDatasource(Dio())),
  );

  void fetchProducts() async {
    emit(state.copyWith(isLoading: true, errorMessage: ''));
    final response = await _getProductUsecase();
    if (response.isEmpty) {
      emit(state.copyWith(isLoading: false, errorMessage: 'No products found'));
      return;
    }
    emit(state.copyWith(isLoading: false, products: response));
  }

  Future<void> updateCart(Product product) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    List<Product> cart = state.cart;
    final storedCart = preferences.getString(StorageKeys.cart);
    if (storedCart == null) {
      cart.add(product);
      await preferences.setString(StorageKeys.cart, json.encode(cart));
    } else {
      final List<dynamic> cartJson = jsonDecode(storedCart);
      cart = cartJson.map((json) => Product.fromJson(json)).toList();
      cart.add(product);
      await preferences.setString(StorageKeys.cart, json.encode(cart));
    }
    emit(state.copyWith(cart: cart));
  }

  Future<void> clearCart() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(StorageKeys.cart, json.encode([]));
    emit(state.copyWith(cart: []));
  }
}
