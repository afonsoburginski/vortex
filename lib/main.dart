import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:vortex/src/modules/home/home_page.dart';
import 'package:vortex/src/modules/login/login_page.dart';
import 'package:vortex/src/modules/splash/splash_page.dart';
//import 'package:vortex/src/modules/splash/splash_page.dart';

import 'shared/themes/app_colors.dart';
=======
import 'package:firebase_core/firebase_core.dart';
import 'package:vortex/app_widget.dart';
>>>>>>> b0aa9a6f7e28790249ceb057e180e00813e15ea0

void main() {
  runApp(const AppFirebase());
}

class AppFirebase extends StatefulWidget {
  const AppFirebase({Key? key}) : super(key: key);

  @override
  _AppFirebaseState createState() => _AppFirebaseState();
}

class _AppFirebaseState extends State<AppFirebase> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return MaterialApp(
      title: 'Vortex',
      theme: ThemeData(
        primaryColor: AppColors.primary,
      ),
      home: const HomePage(),
=======
    // return MaterialApp(
    //   title: 'Vortex',
    //   theme: ThemeData(
    //     primaryColor: AppColors.primary,
    //   ),
    //   home: const LoginPage(),
    // );
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Material(
            child: Center(
              child: Text(
                "Não foi possível inicializar o Firebase",
                textDirection: TextDirection.ltr,
              ),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          return const AppWidget();
        } else {
          return const Material(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
>>>>>>> b0aa9a6f7e28790249ceb057e180e00813e15ea0
    );
  }
}
