import 'package:e_commerce/core/services/api/token_storage.dart';
import 'package:e_commerce/features/profile/presentation/view/widget/body_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../manger/profile_rivepod.dart';

class RivedpodWork extends ConsumerWidget {
  const RivedpodWork({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getProfileAsync =
        ref.watch(getProfileProvider(TokenStorage().getToken()));
    return getProfileAsync.when(
      data: (data) {
        return BodyProfile(profileEntity: data);
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) {
        print('Error: $err');
        return Center(
          child: Text('Error: ${err.toString()}'),
        );
      },
    );
  }
}
