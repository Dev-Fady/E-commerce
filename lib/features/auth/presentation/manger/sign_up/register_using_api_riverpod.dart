import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/DI/dependency_injection.dart';
import 'package:e_commerce/core/errors/faliures.dart';
import 'package:e_commerce/core/services/api/api_service.dart';
import 'package:e_commerce/features/auth/data/model/user_model_api.dart';
import 'package:e_commerce/features/auth/data/repos/register_using_api_repo_impl.dart';
import 'package:e_commerce/features/auth/domain/entites/register_using_api_entity.dart';
import 'package:e_commerce/features/auth/domain/repo/register_using_api_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerUsingApiProvider = FutureProvider.family<
    Either<Faliure, RegisterUsingApiEntity>,
    UserModelApi>((ref, userModelApi) async {
  final register = ref.watch(registerUsingApiRepoProvider);
  final result = await register.register(userModelApi);
  return result;
  // return result.fold(
  //   (failure) {
  //     throw Exception(failure);
  //   },
  //   (regiter) {
  //     return regiter;
  //   },
  // );
});

final registerUsingApiRepoProvider = Provider<RegisterUsingApiRepo>((ref) {
  return RegisterUsingApiRepoImpl(apiService: getIt<ApiService>());
});
