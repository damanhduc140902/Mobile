// import 'dart:async';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:money_manager/components/Category.dart';
// import 'package:money_manager/screens/CategoryScreen.dart';
// import 'package:provider/provider.dart';
//
// import 'components/TitleText1.dart';
// import 'firebase_options.dart';
// import 'screens/Authentication.dart';
// import 'src/widgets.dart';
//
// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => ApplicationState(),
//       builder: (context, _) => App(),
//     ),
//   );
// }
//
// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Firebase Meetup',
//       theme: ThemeData(
//         buttonTheme: Theme.of(context).buttonTheme.copyWith(
//               highlightColor: Color.fromARGB(255, 35, 111, 87),
//             ),
//         primarySwatch: Colors.teal,
//         textTheme: GoogleFonts.robotoTextTheme(
//           Theme.of(context).textTheme,
//         ),
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: const HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ApplicationState>(
//       builder: (context, appState, _) => Authentication(
//         email: appState.email,
//         loginState: appState.loginState,
//         verifyEmail: appState.verifyEmail,
//         signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
//         cancelRegistration: appState.cancelRegistration,
//         registerAccount: appState.registerAccount,
//         signOut: appState.signOut,
//       ),
//     );
//   }
// }
//
// class ApplicationState extends ChangeNotifier {
//   ApplicationState() {
//     init();
//   }
//
//   Future<void> init() async {
//     await Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform,
//     );
//
//     FirebaseAuth.instance.userChanges().listen((user) {
//       if (user != null) {
//         _loginState = ApplicationLoginState.loggedIn;
//       }
//     });
//
//     FirebaseAuth.instance.userChanges().listen((user) {
//       if (user != null) {
//         _loginState = ApplicationLoginState.loggedIn;
//
//         _categorySubscription = FirebaseFirestore.instance
//             .collection('userData/${user.uid}/categories')
//             .snapshots()
//             .listen((snapshot) {
//           for (final document in snapshot.docs) {
//             _categories.add(Category(
//                 index: document.data()['index'] as int,
//                 icon: document.data()['icon'] as String,
//                 color: document.data()['color'] as String,
//                 description: document.data()['description'] as String));
//           }
//           notifyListeners();
//         });
//
//       } else {
//         _loginState = ApplicationLoginState.loggedOut;
//         _categorySubscription?.cancel();
//       }
//       notifyListeners();
//     });
//   }
//
//   ApplicationLoginState _loginState = ApplicationLoginState.loggedOut;
//
//   ApplicationLoginState get loginState => _loginState;
//
//   String? _email;
//
//   String? get email => _email;
//
//   StreamSubscription<QuerySnapshot>? _categorySubscription;
//
//   List<Category> _categories = [];
//
//   List<Category> get categories => _categories;
//
//   Future<void> verifyEmail(
//     String email,
//     void Function(FirebaseAuthException e) errorCallback,
//   ) async {
//     try {
//       var methods =
//           await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
//       if (methods.contains('password')) {
//         _loginState = ApplicationLoginState.password;
//       } else {
//         _loginState = ApplicationLoginState.register;
//       }
//       _email = email;
//       notifyListeners();
//     } on FirebaseAuthException catch (e) {
//       errorCallback(e);
//     }
//   }
//
//   Future<void> signInWithEmailAndPassword(
//     String email,
//     String password,
//     void Function(FirebaseAuthException e) errorCallback,
//   ) async {
//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//     } on FirebaseAuthException catch (e) {
//       errorCallback(e);
//     }
//   }
//
//   void cancelRegistration() {
//     _loginState = ApplicationLoginState.loggedOut;
//     notifyListeners();
//   }
//
//   Future<void> registerAccount(
//       String email,
//       String displayName,
//       String password,
//       void Function(FirebaseAuthException e) errorCallback) async {
//     try {
//       var credential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password);
//       await credential.user!.updateDisplayName(displayName);
//     } on FirebaseAuthException catch (e) {
//       errorCallback(e);
//     }
//   }
//
//   void signOut() {
//     FirebaseAuth.instance.signOut();
//     GoogleSignIn().signOut();
//     FacebookAuth.instance.logOut();
//   }
//
// }
//
