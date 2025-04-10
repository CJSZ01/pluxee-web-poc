import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluxee_web_poc/domain/domain.dart';

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
}
