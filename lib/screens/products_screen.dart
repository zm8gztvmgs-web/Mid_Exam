import 'package:flutter/material.dart';
import 'package:shop_app/core/app_colors.dart';
import 'package:shop_app/data/products_data.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/screens/product_details_screen.dart';
import 'package:shop_app/widgets/product_grid_item.dart';
import 'package:shop_app/widgets/product_list_item.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  bool _isGrid = true;
  bool _isSearching = false;
  String _query = '';

  List<Product> get _filtered {
    if (_query.isEmpty) return products;
    return products
        .where((p) => p.name.toLowerCase().contains(_query.toLowerCase()))
        .toList();
  }

  void _openDetails(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ProductDetailsScreen(product: product)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = _filtered;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: _isSearching
            ? TextField(
                autofocus: true,
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                  hintText: 'Search products...',
                  hintStyle: TextStyle(color: Colors.white70),
                  border: InputBorder.none,
                ),
                onChanged: (value) => setState(() => _query = value),
              )
            : const Text('Products'),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                if (!_isSearching) _query = '';
              });
            },
          ),
          IconButton(
            icon: Icon(_isGrid ? Icons.view_list : Icons.grid_view),
            onPressed: () => setState(() => _isGrid = !_isGrid),
          ),
        ],
      ),
      body: items.isEmpty
          ? const Center(child: Text('No products found'))
          : Padding(
              padding: const EdgeInsets.all(12),
              child: _isGrid
                  ? GridView.builder(
                      itemCount: items.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.85,
                      ),
                      itemBuilder: (context, index) => ProductGridItem(
                        product: items[index],
                        onTap: () => _openDetails(items[index]),
                      ),
                    )
                  : ListView.separated(
                      itemCount: items.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 10),
                      itemBuilder: (context, index) => ProductListItem(
                        product: items[index],
                        onTap: () => _openDetails(items[index]),
                      ),
                    ),
            ),
    );
  }
}
