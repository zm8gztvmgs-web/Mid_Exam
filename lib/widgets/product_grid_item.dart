import 'package:flutter/material.dart';
import 'package:shop_app/core/app_colors.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/widgets/product_image.dart';

class ProductGridItem extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductGridItem({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(child: ProductImage(product: product)),
            ),
            const SizedBox(height: 8),
            Text(
              product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w600, color: AppColors.textDark),
            ),
            const SizedBox(height: 4),
            Text(
              product.priceText,
              style: const TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
