import 'package:flutter/material.dart';
import 'product_grid_tile.dart';
import 'products_manager.dart';
import '../../models/product.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavorite;
  const ProductGrid(this.showFavorite, {super.key});

  @override
  Widget build(BuildContext context) {
    // Đọc ra danh sách các product sẽ được hiển thị từ ProductsManager

    final productsManager = ProductsManager();
    // final products =
    //     showFavorite ? productsManager.favoriteItems : productsManager.items;
    final products = context.select<ProductsManager, List<Product>>(
        (productsManager) => showFavorite
            ? productsManager.favoriteItems
            : productsManager.items);

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ProductGridTitle(products[i]),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
