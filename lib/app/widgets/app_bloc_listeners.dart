import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tmbiz/app/app.dart';

class AppBlocListeners extends StatelessWidget {
  const AppBlocListeners({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppCubit, AppState>(
      listenWhen: (p, c) => p.status != c.status && c.status == AppStatus.success,
      listener: (context, state) {
        context.goNamed(GoRouteNames.main);
      },
      child: child,
    );
  }
}
