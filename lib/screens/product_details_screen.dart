import 'package:flutter/material.dart';
import 'package:shop_app/core/app_colors.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/widgets/primary_button.dart';
import 'package:shop_app/widgets/product_image.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  Widget _infoRow(String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: AppColors.textGrey)),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: valueColor ?? AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        title: const Text('Product Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 220,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: ProductImage(product: product, height: 180),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product.priceText,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      product.description,
                      style: const TextStyle(
                        color: AppColors.textGrey,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    _infoRow('Brand', product.brand),
                    const Divider(height: 1),
                    _infoRow('Category', product.category),
                    const Divider(height: 1),
                    _infoRow(
                      'In Stock',
                      product.inStock ? 'Yes' : 'No',
                      valueColor: product.inStock
                          ? AppColors.green
                          : AppColors.red,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            PrimaryButton(
              text: 'Add to Cart',
              onPressed: () {
                final message = product.inStock
                    ? '${product.name} added to cart'
                    : '${product.name} is out of stock';
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(message)));
              },
            ),
          ],
        ),
      ),
    );
  }
}
