import 'package:e_commerce/core/cache/cache_helper.dart';
import 'package:e_commerce/core/constants/constanst.dart';
import 'package:e_commerce/core/helper_functions/router/router_name.dart';
import 'package:e_commerce/core/services/api/token_storage.dart';
import 'package:e_commerce/features/profile/presentation/manger/profile_rivepod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LogoutButton extends ConsumerWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final logoutService = ref.watch(logoutProvider(TokenStorage().getToken()));
    return Align(
      alignment: Alignment.centerRight,
      child: CupertinoButton(
        onPressed: () async {
          final logoutService =
              await ref.watch(logoutProvider(TokenStorage().getToken()));
          logoutService.when(
              data: (data) async {
                await CacheHelper()
                    .saveData(key: kIsBoardingViewSeen, value: false);
                context.goNamed(RouterName.login);
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(data.message)));
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) {
                print('Error: $err');
                return Center(
                  child: Text('Error: ${err.toString()}'),
                );
              });
        },
        child: const Text(
          'تسجيل الخروج',
          style: TextStyle(
            color: CupertinoColors.destructiveRed,
          ),
        ),
      ),
    );
  }
}
