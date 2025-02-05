part of 'delete_favorite_cubit.dart';

abstract class DeleteFavoriteState {}

class DeleteFavoriteInitial extends DeleteFavoriteState {}

class DeleteFavoriteLoading extends DeleteFavoriteState {}

class DeleteFavoriteSuccess extends DeleteFavoriteState {
  final DeleteFavoraiteEntitty favorite;
  DeleteFavoriteSuccess({required this.favorite});
}

class DeleteFavoriteFailure extends DeleteFavoriteState {
  final Faliure error;
  DeleteFavoriteFailure({required this.error});
}
