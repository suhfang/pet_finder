import 'package:flutter/material.dart';
import 'package:pet_finder/presentation/router.dart';

void main() {
  runApp(
      PetFinderApp(
        router: AppRouter(),
      )
  );
}

class PetFinderApp extends StatelessWidget {
  final AppRouter router;
  const PetFinderApp({ Key? key, required this.router }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: router.generateRoute,
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
          brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      theme: ThemeData(
          brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
    );
  }
}
