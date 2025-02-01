import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/DI/dependency_injection.dart';
import 'package:e_commerce/core/errors/faliures.dart';
import 'package:e_commerce/core/services/api/api_service.dart';
import 'package:e_commerce/core/services/api/token_storage.dart';
import 'package:e_commerce/features/auth/data/model/login_request.dart';
import 'package:e_commerce/features/auth/data/repos/login_using_api_repo_impl.dart';
import 'package:e_commerce/features/auth/domain/entites/login_using_api_entity.dart';
import 'package:e_commerce/features/auth/domain/repo/login_using_api_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginUsingApiProvider =
    FutureProvider.family<Either<Faliure, LoginUsingApiEntity>, LoginRequest>(
        (ref, loginRequest) async {
  final login = ref.watch(loginUsingApiRepoProvider);
  final result = await login.Login(loginRequest: loginRequest);
  result.fold(
    (failure) {
      return Left(failure.message);
    },
    (loginEntity) {
      TokenStorage().saveTokenLogin(loginEntity.token);
      return Right(loginEntity);
    },
  );
  return result;
});

final loginUsingApiRepoProvider = Provider<LoginUsingApiRepo>((ref) {
  return LoginUsingApiRepoImpl(apiService: getIt<ApiService>());
});
