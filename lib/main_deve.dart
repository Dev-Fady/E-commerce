import 'package:device_preview/device_preview.dart';
import 'package:e_commerce/core/DI/dependency_injection.dart';
import 'package:e_commerce/core/helper_functions/router/router.dart';
import 'package:e_commerce/core/cache/cache_helper.dart';
import 'package:e_commerce/core/services/custom_bloc_server.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';

import 'core/helper_functions/security.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPrefs = CacheHelper();
  await sharedPrefs.init();
  final GoRouter router = initializeRouter();
  await dotenv.load(fileName: Security.filename);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupGetit();
  Bloc.observer = CustomBlocServer();
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) {
        return FruitHub(router: router);
      },
    ),
  );
}
