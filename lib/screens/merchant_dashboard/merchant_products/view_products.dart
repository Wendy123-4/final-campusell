import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appme/models/product.dart';
import 'package:flutter_appme/screens/merchant_dashboard/merchant_products/product_list.dart';
import 'package:flutter_appme/services/database_service.dart';
import 'package:flutter_appme/shared/filter_product_list.dart';
import 'package:provider/provider.dart';

class ViewProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Product>>(
      stream: DatabaseService().products,
      initialData: [],
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final user = context.watch<User>();
          List<Product> filteredProducts =
              FilterProductList(uid: user.uid, productList: snapshot.data)
                  .filterProductList();

          if (filteredProducts.isNotEmpty) {
            return ProductList(
              products: filteredProducts,
            );
          }
        }
        return Center(child: Text("No products have been added yet"));
      },
    );
  }
}
