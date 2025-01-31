import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/DI/dependency_injection.dart';
import 'package:e_commerce/core/errors/faliures.dart';
import 'package:e_commerce/core/services/api/api_service.dart';
import 'package:e_commerce/core/services/api/token_storage.dart';
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
  result.fold(
    (failure) => null,
    (registerEntity) {
      final token = registerEntity.token;
      TokenStorage().saveToken(token);
      log("*****************************$token********************************");
    },
  );
  return result;
});

final registerUsingApiRepoProvider = Provider<RegisterUsingApiRepo>((ref) {
  return RegisterUsingApiRepoImpl(apiService: getIt<ApiService>());
});

final profilePicProvider = StateProvider<File?>((ref) => null);
final isLoadingProvider = StateProvider<bool>((ref) => false);
