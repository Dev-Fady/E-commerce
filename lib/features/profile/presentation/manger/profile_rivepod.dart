import 'package:e_commerce/core/services/api/api_service.dart';
import 'package:e_commerce/features/profile/data/model/logout_model.dart';
import 'package:e_commerce/features/profile/data/repo/profile_repo_impl.dart';
import 'package:e_commerce/features/profile/domian/entites/profile_entity.dart';
import 'package:e_commerce/features/profile/domian/repo/profile_rope.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/DI/dependency_injection.dart';

final getProfileProvider =
    FutureProvider.family<ProfileEntity, String>((ref, token) async {
  final categoryRepo = ref.watch(getProfileRepoProvider);

  final result = await categoryRepo.getProfile(token: token);

  return result.fold(
    (failure) {
      throw Exception(failure);
    },
    (getProfilr) => getProfilr,
  );
});

final logoutProvider =
    FutureProvider.family<LogoutModel, String>((ref, token) async {
  final logoutRepo = ref.watch(getProfileRepoProvider);

  final result = await logoutRepo.logout(token: token);

  return result.fold(
    (failure) {
      throw Exception(failure);
    },
    (getProfilr) => getProfilr,
  );
});

final getProfileRepoProvider = Provider<ProfileRope>((ref) {
  return ProfileRepoImpl(apiService: getIt<ApiService>());
});
