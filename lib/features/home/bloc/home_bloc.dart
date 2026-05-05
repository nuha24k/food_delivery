import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/models/food_item_model.dart';
import '../../../core/models/category_model.dart';
import '../data/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _repository;

  HomeBloc({required HomeRepository repository})
      : _repository = repository,
        super(const HomeState()) {
    on<HomeLoadData>(_onLoadData);
    on<HomeToggleFavorite>(_onToggleFavorite);
    on<HomeSearchChanged>(_onSearchChanged);
    on<HomeNavTabChanged>(_onNavTabChanged);
  }

  Future<void> _onLoadData(
    HomeLoadData event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      final results = await Future.wait([
        _repository.getCategories(),
        _repository.getPicksForYou(),
        _repository.getPopularRestaurants(),
      ]);
      emit(state.copyWith(
        status: HomeStatus.success,
        categories: results[0] as List<CategoryModel>,
        picksForYou: results[1] as List<FoodItemModel>,
        popularRestaurants: results[2] as List<FoodItemModel>,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: HomeStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  void _onToggleFavorite(
    HomeToggleFavorite event,
    Emitter<HomeState> emit,
  ) {
    final updatedPicks = state.picksForYou.map((item) {
      if (item.id == event.foodId) {
        return item.copyWith(isFavorite: !item.isFavorite);
      }
      return item;
    }).toList();

    final updatedPopular = state.popularRestaurants.map((item) {
      if (item.id == event.foodId) {
        return item.copyWith(isFavorite: !item.isFavorite);
      }
      return item;
    }).toList();

    emit(state.copyWith(
      picksForYou: updatedPicks,
      popularRestaurants: updatedPopular,
    ));
  }

  void _onSearchChanged(
    HomeSearchChanged event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(searchQuery: event.query));
  }

  void _onNavTabChanged(
    HomeNavTabChanged event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(currentNavIndex: event.tabIndex));
  }
}
