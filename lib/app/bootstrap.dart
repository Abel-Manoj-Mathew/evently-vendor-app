import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:evently_vendor_app/app/app_bloc_observer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:env/env.dart';
import 'package:authentication_client/authentication_client.dart';
import 'package:supabase_authentication_client/supabase_authentication_client.dart';

final getIt = GetIt.instance;

void registerDependencies() {
  getIt.registerLazySingleton<AuthenticationClient>(
    () => SupabaseAuthenticationClient(
      supabaseClient: Supabase.instance.client,
    ),
  );
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    debugPrint(details.exceptionAsString());
  };

  Bloc.observer = const AppBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  
  await Supabase.initialize(
    url: Env.supabaseUrl,
    publishableKey: Env.supabaseAnonKey,
  );

  registerDependencies();

  runApp(await builder());
}
