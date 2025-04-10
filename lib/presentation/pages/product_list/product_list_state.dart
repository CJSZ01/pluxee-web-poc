import '../../../domain/domain.dart';

class ProductListState {
  final bool isLoading;
  final List<Product> products;
  final String errorMessage;

  ProductListState({
    this.isLoading = false,
    this.products = const [],
    this.errorMessage = '',
  });

  factory ProductListState.initial() {
    return ProductListState(isLoading: false, products: [], errorMessage: '');
  }

  ProductListState copyWith({
    bool? isLoading,
    List<Product>? products,
    String? errorMessage,
  }) {
    return ProductListState(
      isLoading: isLoading ?? this.isLoading,
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
