part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  final HomeStatus status;
  final List<CategoryModel> categories;
  final List<FoodItemModel> picksForYou;
  final List<FoodItemModel> popularRestaurants;
  final String searchQuery;
  final int currentNavIndex;
  final String? errorMessage;

  const HomeState({
    this.status = HomeStatus.initial,
    this.categories = const [],
    this.picksForYou = const [],
    this.popularRestaurants = const [],
    this.searchQuery = '',
    this.currentNavIndex = 0,
    this.errorMessage,
  });

  HomeState copyWith({
    HomeStatus? status,
    List<CategoryModel>? categories,
    List<FoodItemModel>? picksForYou,
    List<FoodItemModel>? popularRestaurants,
    String? searchQuery,
    int? currentNavIndex,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      picksForYou: picksForYou ?? this.picksForYou,
      popularRestaurants: popularRestaurants ?? this.popularRestaurants,
      searchQuery: searchQuery ?? this.searchQuery,
      currentNavIndex: currentNavIndex ?? this.currentNavIndex,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        categories,
        picksForYou,
        popularRestaurants,
        searchQuery,
        currentNavIndex,
        errorMessage,
      ];
}
