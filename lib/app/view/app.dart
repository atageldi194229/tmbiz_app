import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tmbiz/app/app.dart';
import 'package:tmbiz/l10n/l10n.dart';
import 'package:tmbiz/language/language.dart';
import 'package:tmbiz/player/player.dart';
import 'package:turkmen_localization_support/turkmen_localization_support.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required StreamController<Exception> exceptionStream,
  }) : _exceptionStream = exceptionStream;

  // ignore: unused_field
  final StreamController<Exception> _exceptionStream;

  @override
  Widget build(BuildContext context) {
    final appCubit = AppCubit()..loadConfig();
    final languageBloc = LanguageBloc();

    final videoPlayerBloc = VideoPlayerBloc()..add(VideoPlayerRequested());

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: appCubit),
        BlocProvider.value(value: languageBloc),
        BlocProvider.value(value: videoPlayerBloc),
      ],
      child: const AppBlocListeners(
        child: AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: AppColors.primary,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: const AppDarkTheme().themeData,
      localizationsDelegates: const [
        ...AppLocalizations.localizationsDelegates,
        ...TkDelegates.delegates,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      // home: const BottomNavBar(),
    );
  }
}
