import 'package:flutter/material.dart';
import 'package:kamoo/models/product_model.dart';
import 'package:kamoo/providers/wishlist_provider.dart';
import 'package:kamoo/theme.dart';
import 'package:provider/provider.dart';

class WishlistCard extends StatelessWidget {
  final ProductModel product;
  const WishlistCard(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(
        top: 10,
        left: 12,
        bottom: 14,
        right: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor4,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/image_shoes.png',
              width: 60,
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name!,
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '\$${product.price}',
                  style: priceTextStyle,
                )
              ],
            ),
          ),
          SizedBox(
            width: 25,
          ),
          GestureDetector(
            onTap: () {
              wishlistProvider.setProduct(product);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: Duration(seconds: 1),
                  backgroundColor: alertColor,
                  content: Text(
                    'Has been removed from the Whitelist',
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
            child: Image.asset(
              'assets/button_wishlist_blue.png',
              width: 34,
            ),
          )
        ],
      ),
    );
  }
}
