part of 'add_or_delete_favorites_cubit.dart';

// Define your states
abstract class AddOrDeleteFavoritesState {}

class AddOrDeleteFavoritesInitial extends AddOrDeleteFavoritesState {}

class AddOrDeleteFavoritesLoading extends AddOrDeleteFavoritesState {}

class AddOrDeleteFavoritesSuccess extends AddOrDeleteFavoritesState {
  final AddOrDeleteFavoraiteEntity favorite;
  AddOrDeleteFavoritesSuccess({required this.favorite});
}

class AddOrDeleteFavoritesFailure extends AddOrDeleteFavoritesState {
  final Faliure error;
  AddOrDeleteFavoritesFailure({required this.error});
}
