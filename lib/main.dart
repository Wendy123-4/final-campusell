import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appme/screens/authentication/authentication_wrapper.dart';
import 'package:flutter_appme/screens/first_page.dart';
import 'package:flutter_appme/screens/landing_page.dart';
import 'package:flutter_appme/screens/merchant_dashboard/add_product.dart';
import 'package:flutter_appme/screens/merchant_dashboard/edit_merchant/edit_merchant_landing.dart';
import 'package:flutter_appme/screens/registration_flow/finish_registration.dart';
import 'package:flutter_appme/screens/registration_flow/merchant_information.dart';
import 'package:flutter_appme/screens/registration_flow/merchant_password.dart';
import 'package:flutter_appme/screens/registration_flow/merchant_profile_pic.dart';
import 'package:flutter_appme/screens/shopper/display_prod.dart';
import 'package:flutter_appme/screens/shopper/shopper_landing.dart';
import 'package:flutter_appme/screens/shopper/shopper_search_bar.dart';
import 'package:flutter_appme/screens/splash_screen.dart';
import 'package:flutter_appme/services/authentication_service.dart';
import 'package:flutter_appme/shared/constants.dart';
import 'package:provider/provider.dart';
import '';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider<User>(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            scaffoldBackgroundColor: vanillaBaby,
            appBarTheme: AppBarTheme(
              color: softWork,
            )),
        initialRoute: "/",
        routes: {
          "/authenticationPage": (context) => Wrapper(),
          "/registrationMerchantInformation": (context) =>
              RegistrationMerchantInformation(),
          "/registrationProfilePic": (context) => RegistrationProfilePic(),
          "/registrationMerchantPassword": (context) =>
              RegistrationMerchantPassword(),
          "/completeMerchantRegistration": (context) => CompleteRegistration(),
          "/addProduct": (context) => AddProduct(),
          "/editMerchantDetails": (context) => EditMerchantLanding(),
          "/shopperLanding": (context) => ShopperLanding(),
          "/searchBar": (context) => SearchBar(),
          "/displayProductPage": (context) => DisplayProductPage()
        },
        home: Home(),
      ),
    );
  }
}
