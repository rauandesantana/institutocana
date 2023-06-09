import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:institutocana/paginas/home.dart';
import 'package:institutocana/paginas/login.dart';
import 'package:institutocana/paginas/signup.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      title: 'Instituto Caná',
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
        "/entrar": (context) => const LoginPage(),
        "/cadastrar": (context) => const SignUpPage(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.light,
          backgroundColor: Colors.blueGrey.shade50,
          primarySwatch: Colors.green,
          accentColor: Colors.green.shade900,
          cardColor: Colors.green.shade300,
          errorColor: Colors.red,
        ),
        useMaterial3: true,
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}