part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class HomeLoadData extends HomeEvent {
  const HomeLoadData();
}

class HomeToggleFavorite extends HomeEvent {
  final String foodId;

  const HomeToggleFavorite(this.foodId);

  @override
  List<Object?> get props => [foodId];
}

class HomeSearchChanged extends HomeEvent {
  final String query;

  const HomeSearchChanged(this.query);

  @override
  List<Object?> get props => [query];
}

class HomeNavTabChanged extends HomeEvent {
  final int tabIndex;

  const HomeNavTabChanged(this.tabIndex);

  @override
  List<Object?> get props => [tabIndex];
}
