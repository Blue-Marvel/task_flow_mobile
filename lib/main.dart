import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:task_flow_mobile/utils/colors.dart';
import 'package:task_flow_mobile/utils/route.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: secondaryColor,
          primaryColor: primaryColor,
          scaffoldBackgroundColor: bgColor,
          appBarTheme: const AppBarTheme(
            foregroundColor: textColor,
            backgroundColor: bgColor,
          ),
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: textColor,
                displayColor: textColor,
              )),
      routerDelegate: RoutemasterDelegate(routesBuilder: (context) => route),
      routeInformationParser: const RoutemasterParser(),
    );
  }
}
