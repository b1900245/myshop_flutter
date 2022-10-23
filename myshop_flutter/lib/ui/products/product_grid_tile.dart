import 'package:flutter/material.dart';
import '../../models/product.dart';
import 'product_detail_screen.dart';

class ProductGridTitle extends StatelessWidget {
  const ProductGridTitle(
    this.product, {
    super.key,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: buildGridFooterBar(context),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => ProductDetailScreen(product),
              ),
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

Widget buildGridFooterBar(BuildContext context) {
  return GridTileBar(
    backgroundColor: Colors.black87,
    leading: ValueListenableBuilder<bool>(
      valueListenable: product.isFavoriteListenable,
      builder: (ctx, isFavorite, child) {
        return IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
          ),
          color: Theme.of(context).colorScheme.secondary,
          onPressed: () {
          product.isFavorite = !isFavorite;
        },
      );
    },
  ),
  );
}

//   Widget buildGridFooterBar(BuildContext context) {
//     return GridTileBar(
//       backgroundColor: Colors.black87,
//       leading: IconButton(
//         icon: Icon(
//           product.isFavorite ? Icons.favorite : Icons.favorite_border,
//         ),
//         color: Theme.of(context).colorScheme.secondary,
//         onPressed: () {
//           print('Toggle a favorite product');
//         },
//       ),
//       title: Text(
//         product.title,
//         textAlign: TextAlign.center,
//       ),
//       trailing: IconButton(
//         icon: const Icon(Icons.shopping_cart),
//         onPressed: () {
//           print('Add item to cart');
//           // final cart = context.read<CartManager>();
//           // cart.addItem(product);
//           // ScaffoldMessenger.of(context)
//           //   ..hideCurrentSnackBar()
//           //   ..showSnackBar(
//           //     SnackBar(
//           //       content: const Text(
//           //         'Item added to cart',
//           //       ),
//           //       duration: const Duration(seconds: 2),
//           //       action: SnackBarAction(
//           //         label: 'UNDO',
//           //         onPressed: () {
//           //           cart.removeSingleItem(product.id!);
//           //         },
//           //       ),
//           //     ),
//           //   );
//         },
//         color: Theme.of(context).colorScheme.secondary,
//       ),
//     );
//   }
// }
