import 'package:dio/dio.dart';
import 'package:e_commerce/core/helper_functions/logging_interceptor.dart';
import 'package:e_commerce/core/services/api/api_service.dart';
import 'package:e_commerce/core/services/firebase_auth_service.dart';
import 'package:e_commerce/core/services/firestore_service.dart';
import 'package:e_commerce/desh_board/core/repo/image_repo/image_repo.dart';
import 'package:e_commerce/desh_board/core/repo/image_repo/image_repo_impl.dart';
import 'package:e_commerce/desh_board/core/repo/poduct_repo/desh_products_repo.dart';
import 'package:e_commerce/desh_board/core/repo/poduct_repo/desh_products_repo_impl.dart';
import 'package:e_commerce/desh_board/core/server/fire_storage.dart';
import 'package:e_commerce/desh_board/core/server/supabase_storage_server.dart';
import 'package:e_commerce/features/auth/data/repos/auth_repo_impl.dart';
import 'package:e_commerce/features/auth/domain/repo/auth_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:e_commerce/core/repos/products_repo.dart';
import 'package:e_commerce/core/repos/products_repo_impl.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());

  getIt.registerSingleton<FirestoreService>(FirestoreService());

  getIt.registerSingleton<FireStorageService>(FireStorageService());

  getIt.registerSingleton<SupabaseStorageServer>(
    SupabaseStorageServer(),
  );

  getIt.registerSingleton<ImageRepo>(ImageRepoImpl(
    supabaseStorageServer: getIt<SupabaseStorageServer>(),
  ));

  getIt.registerSingleton<DeshProductsRepo>(
    DeshProductsRepoImpl(firestoreService: getIt<FirestoreService>()),
  );
  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImpl(firestoreService: getIt<FirestoreService>()),
  );

  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
    firebaseAuthService: getIt<FirebaseAuthService>(),
    firestoreService: getIt<FirestoreService>(),
  ));

  final dio = Dio();

  // إعداد الـ Logging Interceptor
  loggingInterceptor(dio);

  GetIt.I.registerSingleton<ApiService>(ApiService(dio));
}
