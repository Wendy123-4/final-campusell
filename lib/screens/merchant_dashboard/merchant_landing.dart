import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appme/models/merchant.dart';
import 'package:flutter_appme/screens/merchant_dashboard/merchant_profile.dart';
import 'package:flutter_appme/services/database_service.dart';
import 'package:flutter_appme/shared/loading.dart';

class MerchantLanding extends StatelessWidget {
  final User firebaseUser;

  MerchantLanding({@required this.firebaseUser});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MerchantData>(
      stream: DatabaseService(uid: firebaseUser.uid).merchantData,
      initialData: null,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          MerchantData merchantData = snapshot.data;
          return MerchantProfile(
            merchantData: merchantData,
          );
        }
        return Loading();
      },
    );
  }
}
