import 'package:flutter/material.dart';
import 'package:hackathon_app/presentation/core/routes/routes.dart';
import 'package:hackathon_app/presentation/views/pages/login_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
      home: const LoginPage(),
      title: 'Hackathon App',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      routes: appRoutes,
      initialRoute: LoginPage.routeName,
  );
}
