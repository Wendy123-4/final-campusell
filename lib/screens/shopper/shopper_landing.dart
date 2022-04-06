import 'package:flutter/material.dart';
import 'package:flutter_appme/models/product.dart';
import 'package:flutter_appme/screens/shopper/shopper_search.dart';
import 'package:flutter_appme/services/database_service.dart';
import 'package:provider/provider.dart';

class ShopperLanding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Product>>.value(
      value: DatabaseService().products,
      initialData: [],
      child: ShopperSearch(),
    );
  }
}
