import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:evently_vendor_app/app/app_bloc_observer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:env/env.dart';

final getIt = GetIt.instance;

void registerDependencies() {
  // Repositories & ViewModels will be registered here.
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    debugPrint(details.exceptionAsString());
  };

  Bloc.observer = const AppBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  
  await Supabase.initialize(
    url: Env.supabaseUrl,
    anonKey: Env.supabaseAnonKey,
  );

  registerDependencies();

  runApp(await builder());
}
