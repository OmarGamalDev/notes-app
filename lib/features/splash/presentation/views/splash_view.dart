import 'package:flutter/material.dart';
import 'package:notes_app/features/splash/presentation/views/widgets/splash_view_body.dart';


class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const String routeName = 'splash';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff313031),
      body: SplashViewBody(),
    );
  }
}
