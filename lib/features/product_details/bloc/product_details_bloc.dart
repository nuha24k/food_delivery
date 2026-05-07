import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_details_event.dart';
import 'product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc() : super(ProductDetailsLoading()) {
    on<LoadProductDetails>((event, emit) {
      emit(ProductDetailsLoaded(food: event.food));
    });

    on<ToggleFavoriteStatus>((event, emit) {
      if (state is ProductDetailsLoaded) {
        final currentState = state as ProductDetailsLoaded;
        final updatedFood = currentState.food.copyWith(
          isFavorite: !currentState.food.isFavorite,
        );
        emit(ProductDetailsLoaded(food: updatedFood));
      }
    });
  }
}
