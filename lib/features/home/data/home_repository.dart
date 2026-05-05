import '../../../core/models/food_item_model.dart';
import '../../../core/models/category_model.dart';

class HomeRepository {
  Future<List<CategoryModel>> getCategories() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return const [
      CategoryModel(
        id: '1',
        name: 'Food',
        imageUrl:
            'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=200&q=80',
      ),
      CategoryModel(
        id: '2',
        name: 'Stores',
        imageUrl:
            'https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=200&q=80',
      ),
      CategoryModel(
        id: '3',
        name: 'Groceries',
        imageUrl:
            'https://images.unsplash.com/photo-1542838132-92c53300491e?w=200&q=80',
      ),
    ];
  }

  Future<List<FoodItemModel>> getPicksForYou() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return const [
      FoodItemModel(
        id: '1',
        name: 'Taco Bell',
        restaurant: 'By Walmart',
        imageUrl:
            'https://images.unsplash.com/photo-1565299585323-38d6b0865b47?w=400&q=80',
        rating: 4.7,
        reviewCount: 2300,
        deliveryTimeMinutes: 25,
        difficulty: 'Easy',
        price: 12.99,
      ),
      FoodItemModel(
        id: '2',
        name: 'Burger King',
        restaurant: 'By BK Official',
        imageUrl:
            'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400&q=80',
        rating: 4.5,
        reviewCount: 1800,
        deliveryTimeMinutes: 20,
        difficulty: 'Easy',
        price: 9.99,
      ),
      FoodItemModel(
        id: '3',
        name: 'Pizza Hut',
        restaurant: 'By Pizza Hut',
        imageUrl:
            'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=400&q=80',
        rating: 4.8,
        reviewCount: 3100,
        deliveryTimeMinutes: 30,
        difficulty: 'Medium',
        price: 15.99,
      ),
      FoodItemModel(
        id: '4',
        name: 'Sushi Roll',
        restaurant: 'By Tokyo Kitchen',
        imageUrl:
            'https://images.unsplash.com/photo-1553621042-f6e147245754?w=400&q=80',
        rating: 4.9,
        reviewCount: 980,
        deliveryTimeMinutes: 35,
        difficulty: 'Hard',
        price: 22.50,
      ),
    ];
  }

  Future<List<FoodItemModel>> getPopularRestaurants() async {
    await Future.delayed(const Duration(milliseconds: 700));
    return const [
      FoodItemModel(
        id: '5',
        name: 'McDonald\'s',
        restaurant: 'Fast Food',
        imageUrl:
            'https://images.unsplash.com/photo-1550547660-d9450f859349?w=400&q=80',
        rating: 4.6,
        reviewCount: 5200,
        deliveryTimeMinutes: 15,
        difficulty: 'Easy',
        price: 8.50,
      ),
      FoodItemModel(
        id: '6',
        name: 'KFC',
        restaurant: 'Fried Chicken',
        imageUrl:
            'https://images.unsplash.com/photo-1513639776629-7b61b0ac49cb?w=400&q=80',
        rating: 4.4,
        reviewCount: 4100,
        deliveryTimeMinutes: 20,
        difficulty: 'Easy',
        price: 10.99,
      ),
      FoodItemModel(
        id: '7',
        name: 'Starbucks',
        restaurant: 'Coffee & Bakery',
        imageUrl:
            'https://images.unsplash.com/photo-1559925393-8be0ec4767c8?w=400&q=80',
        rating: 4.8,
        reviewCount: 8900,
        deliveryTimeMinutes: 10,
        difficulty: 'Easy',
        price: 6.50,
      ),
    ];
  }
}
