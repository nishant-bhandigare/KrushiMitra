import 'package:agriplant/pages/onboarding_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'auth/auth.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Map<String, dynamic> userData = {}; // Define userData here

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        textTheme: GoogleFonts.nunitoTextTheme(),
      ),

      // home: const OnboardingPage(),

      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            print("\nData\n");
            print(snapshot.data);
            final user = snapshot.data;

            if (user != null) {
              userData = {
                "uid": user.uid,
                "displayName": user.displayName,
                "email": user.email,
                // "phoneNumber": user.phoneNumber,
                // "photoUrl": user.photoURL,
              };
            }

            return OnboardingPage();
          }
          return const AuthScreen();
        },
      ),
    ),
  );
}
