import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/product.dart';
import '../services/api_service.dart';
import '../services/database_service.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ApiService _apiService;
  final DatabaseService _dbService;

  ProductCubit(this._apiService, this._dbService) : super(ProductState());

  Future<void> fetchProducts() async {
    emit(ProductState(isLoading: true));

    try {
      // Try to fetch from API
      final products = await _apiService.fetchProducts();
      await _dbService.insertProducts(products);
      emit(ProductState(products: products));
    } catch (e) {
      // Fallback to local database
      final products = await _dbService.getProducts();
      emit(ProductState(
        products: products,
        error: products.isEmpty ? 'Failed to load products: $e' : null,
      ));
    }
  }
}