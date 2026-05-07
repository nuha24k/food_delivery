import 'package:equatable/equatable.dart';
import '../../../../core/models/food_item_model.dart';

abstract class ProductDetailsEvent extends Equatable {
  const ProductDetailsEvent();

  @override
  List<Object?> get props => [];
}

class LoadProductDetails extends ProductDetailsEvent {
  final FoodItemModel food;

  const LoadProductDetails(this.food);

  @override
  List<Object?> get props => [food];
}

class ToggleFavoriteStatus extends ProductDetailsEvent {}
