import 'package:flutter/material.dart';
import 'package:pluxee_web_poc/domain/usecases/get_product_usecase.dart';

import '../../domain/entities/product_entity.dart';

class ProductProvider extends ChangeNotifier {
  final GetProductUseCase _productUseCase;

  ProductProvider({required GetProductUseCase productUseCase})
    : _productUseCase = productUseCase;
  List<Product> _products = [];

  List<Product> get products => _products;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String? _error;

  String? get error => _error;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();
    try {
      _products = await _productUseCase.getProducts();
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
