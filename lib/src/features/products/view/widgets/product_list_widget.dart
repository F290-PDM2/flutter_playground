import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

import '../../model/product_model.dart';

class ListProductsWidget extends StatelessWidget {
  const ListProductsWidget({super.key, required this.products});

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(product.thumbnail),
            ),
            title: Text(product.title),
            subtitle: Row(
              mainAxisAlignment: .start,
              children: [
                StarRating(
                  rating: product.rating,
                  starCount: 5,
                  color: Colors.amber,
                  size: 16,
                  mainAxisAlignment: .start,
                ),
                SizedBox(width: 16),
                Row(
                  children: [
                    Icon(Icons.discount),
                    SizedBox(width: 4),
                    Text(product.discountPercentage.toString()),
                  ],
                ),
              ],
            ),
            // trailing: Icon(Icons.arrow_forward),
            onTap: () => Navigator.pushNamed(
              context,
              '/product-details',
              arguments: product,
            ),
          ),
        );
      },
    );
  }
}
