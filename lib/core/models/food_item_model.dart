import 'package:equatable/equatable.dart';

class FoodItemModel extends Equatable {
  final String id;
  final String name;
  final String restaurant;
  final String imageUrl;
  final double rating;
  final int reviewCount;
  final int deliveryTimeMinutes;
  final String difficulty;
  final double price;
  final bool isFavorite;

  const FoodItemModel({
    required this.id,
    required this.name,
    required this.restaurant,
    required this.imageUrl,
    required this.rating,
    required this.reviewCount,
    required this.deliveryTimeMinutes,
    required this.difficulty,
    required this.price,
    this.isFavorite = false,
  });

  FoodItemModel copyWith({
    String? id,
    String? name,
    String? restaurant,
    String? imageUrl,
    double? rating,
    int? reviewCount,
    int? deliveryTimeMinutes,
    String? difficulty,
    double? price,
    bool? isFavorite,
  }) {
    return FoodItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      restaurant: restaurant ?? this.restaurant,
      imageUrl: imageUrl ?? this.imageUrl,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      deliveryTimeMinutes: deliveryTimeMinutes ?? this.deliveryTimeMinutes,
      difficulty: difficulty ?? this.difficulty,
      price: price ?? this.price,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        restaurant,
        imageUrl,
        rating,
        reviewCount,
        deliveryTimeMinutes,
        difficulty,
        price,
        isFavorite,
      ];
}
