import 'package:becertus_proyecto/Students/screens/Started/loading.dart';
import 'package:becertus_proyecto/Students/screens/home_screen.dart';
import 'package:becertus_proyecto/Students/screens/login_screen.dart';
import 'package:becertus_proyecto/bd/firebase.dart';
import 'package:becertus_proyecto/functions/Provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "BEUCAL",
    options: firebaseOptions,
  );
  await initializeDateFormatting('es', null);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NotasProvider()),
        // Otros proveedores aquí si es necesario
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: const Color.fromARGB(255, 230, 230, 230),
                displayColor: Colors.white,
              ),
        ),
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              User? user = snapshot.data;
              if (user == null) {
                return SplashScreen();
              }
              return const HomeScreen();
            } else {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
        routes: <String, WidgetBuilder>{
          '/login': (context) => const Login(),
          '/home': (context) => const HomeScreen(),
          // Añade las rutas para las otras pantallas según sea necesario
        });
  }
}
