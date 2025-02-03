import 'package:e_commerce/core/DI/dependency_injection.dart';
import 'package:e_commerce/core/helper_functions/router/router_name.dart';
import 'package:e_commerce/features/auth/presentation/manger/login/login_cubit.dart';
import 'package:e_commerce/features/auth/presentation/manger/sign_up/sign_up_cubit.dart';
import 'package:e_commerce/features/auth/presentation/view/login/login_view.dart';
import 'package:e_commerce/features/auth/presentation/view/signup/sign_up_view.dart';
import 'package:e_commerce/features/best_selling_fruits/presentation/view/bset_selling_view.dart';
// import 'package:e_commerce/features/home/domain/entites/categories_entity.dart';
import 'package:e_commerce/features/home/presentation/view/home_view.dart';
import 'package:e_commerce/features/main/presentation/view/main_view.dart';
import 'package:e_commerce/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:e_commerce/features/product_details/view/product_details_view.dart';
import 'package:e_commerce/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../features/auth/domain/repo/auth_repo.dart';
import '../../../features/home/domain/entites/categories_details_entity.dart';
import '../../../features/home/presentation/view/productis_screen/categories_details_rivepod_work.dart';
import '../../../features/home/presentation/view/productis_screen/widget/all_productis.dart';

GoRouter createRouter(String initialLocation) {
  return GoRouter(
    initialLocation: initialLocation,
    routes: [
      GoRoute(
        path: RouterName.product_details_view,
        name: RouterName.product_details_view,
        builder: (context, state) {
          final product = state.extra as CategoriesDetailsEntity;
          return ProductDetailsView(data: product);
        },
      ),
      GoRoute(
        path: RouterName.splashScreen,
        name: RouterName.splashScreen,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
          path: RouterName.categories_details_rivepod_work,
          name: RouterName.categories_details_rivepod_work,
          builder: (context, state) {
            final int category = state.extra as int;
            return CategoriesDetailsRivepodWork(
              categoryId: category,
            );
          }),
      GoRoute(
          path: RouterName.all_productis,
          name: RouterName.all_productis,
          builder: (context, state) {
            final categoriesDtails =
                state.extra as List<CategoriesDetailsEntity>;
            return AllProductis(
              data: categoriesDtails,
            );
          }),
      GoRoute(
        path: RouterName.onBoarding,
        name: RouterName.onBoarding,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: RouterName.home,
        name: RouterName.home,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: RouterName.main_view,
        name: RouterName.main_view,
        builder: (context, state) => const MainView(),
      ),
      GoRoute(
        path: RouterName.bestSelling,
        name: RouterName.bestSelling,
        builder: (context, state) => const BsetSellingView(),
      ),
      GoRoute(
        path: RouterName.login,
        name: RouterName.login,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(
            getIt<AuthRepo>(),
          ),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: RouterName.signUP,
        name: RouterName.signUP,
        builder: (context, state) => BlocProvider(
          create: (context) => SignUpCubit(
            getIt<AuthRepo>(),
          ),
          child: const SignUpView(),
        ),
      ),
    ],
  );
}

GoRouter initializeRouter() {
  return createRouter(RouterName.splashScreen);
}
