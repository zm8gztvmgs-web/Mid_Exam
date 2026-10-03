import 'package:flutter/material.dart';
import 'package:shop_app/core/app_colors.dart';
import 'package:shop_app/models/product.dart';

class ProductImage extends StatelessWidget {
  final Product product;
  final double? height;
  final double? width;

  const ProductImage({super.key, required this.product, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      product.image,
      height: height,
      width: width,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return SizedBox(
          height: height,
          width: width,
          child: Icon(
            product.fallbackIcon,
            size: (height ?? 60) * 0.6,
            color: AppColors.primary,
          ),
        );
      },
    );
  }
}
