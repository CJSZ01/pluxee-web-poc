import '../../../domain/domain.dart';

class ProductListState {
  final bool isLoading;
  final List<Product> products;
  final List<Product> cart;
  final String errorMessage;

  ProductListState({
    this.isLoading = false,
    this.products = const [],
    this.errorMessage = '',
    this.cart = const [],
  });

  factory ProductListState.initial() {
    return ProductListState(
      isLoading: false,
      products: [],
      errorMessage: '',
      cart: [],
    );
  }

  ProductListState copyWith({
    bool? isLoading,
    List<Product>? products,
    String? errorMessage,
    List<Product>? cart,
  }) {
    return ProductListState(
      isLoading: isLoading ?? this.isLoading,
      products: products ?? this.products,
      errorMessage: errorMessage ?? this.errorMessage,
      cart: cart ?? this.cart,
    );
  }
}
