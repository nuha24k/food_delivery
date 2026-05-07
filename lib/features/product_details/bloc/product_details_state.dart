import 'package:equatable/equatable.dart';
import '../../../../core/models/food_item_model.dart';

abstract class ProductDetailsState extends Equatable {
  const ProductDetailsState();

  @override
  List<Object?> get props => [];
}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsLoaded extends ProductDetailsState {
  final FoodItemModel food;

  const ProductDetailsLoaded({required this.food});

  @override
  List<Object?> get props => [food];
}

class ProductDetailsError extends ProductDetailsState {
  final String message;

  const ProductDetailsError({required this.message});

  @override
  List<Object?> get props => [message];
}
