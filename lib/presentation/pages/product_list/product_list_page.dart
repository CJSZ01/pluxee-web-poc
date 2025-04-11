import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/colors.dart';
import 'product_list_cubit.dart';
import 'product_list_state.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  late final ProductListCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = ProductListCubit();
    cubit.fetchProducts();
  }

  Widget _buildDrawer() {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0)),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: const EdgeInsets.only(left: 20, top: 20),
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.rectangle,
            ),
            child: Text(
              'Pluxee Web POC',
              style: TextStyle(
                color: AppColors.secondary,
                fontSize: 28,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // Handle navigation to Home
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Handle navigation to Settings
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // Handle logout
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Products',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        backgroundColor: AppColors.secondary,
        leading:
            isSmallScreen
                ? Builder(
                  builder:
                      (context) => IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                )
                : null,
      ),
      drawer: isSmallScreen ? _buildDrawer() : null,
      body: Row(
        children: [
          if (!isSmallScreen) _buildDrawer(),
          Expanded(
            child: BlocConsumer<ProductListCubit, ProductListState>(
              listener: (context, state) {
                if (state.isLoading) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Loading products...')),
                  );
                }
                if (state.errorMessage.isNotEmpty) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
                }
              },
              bloc: cubit,
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state.products.isEmpty) {
                  return const Center(child: Text('No products found'));
                }

                final screenWidth = MediaQuery.of(context).size.width;

                return screenWidth < 600
                    ? ListView.builder(
                      padding: const EdgeInsets.all(20),
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        final product = state.products[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: ListTile(
                            leading: SizedBox(
                              height: 50,
                              width: 50,
                              child: Image.network(product.thumbnail ?? ''),
                            ),
                            title: Text(product.title ?? ''),
                            subtitle: Text(product.description ?? ''),
                            trailing: Text('\$${product.price}'),
                          ),
                        );
                      },
                    )
                    : LayoutBuilder(
                      builder: (context, constraints) {
                        final crossAxisCount =
                            constraints.maxWidth > 1200
                                ? 5
                                : constraints.maxWidth > 800
                                ? 4
                                : 2;

                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                childAspectRatio: 1,
                              ),
                          padding: const EdgeInsets.all(20),
                          itemCount: state.products.length,
                          itemBuilder: (context, index) {
                            final product = state.products[index];
                            return LayoutBuilder(
                              builder: (context, constraints) {
                                final isSmallCard = constraints.maxWidth < 200;
                                return Card(
                                  child: Container(
                                    padding: EdgeInsets.all(
                                      constraints.maxWidth * 0.05,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: constraints.maxHeight * 0.4,
                                          width: constraints.maxWidth * 0.8,
                                          child: Image.network(
                                            product.thumbnail ?? '',
                                            fit: BoxFit.cover,
                                            errorBuilder: (
                                              context,
                                              error,
                                              stackTrace,
                                            ) {
                                              return const Icon(Icons.error);
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: constraints.maxHeight * 0.02,
                                        ),
                                        FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            product.title ?? '',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: isSmallCard ? 1 : 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        SizedBox(
                                          height: constraints.maxHeight * 0.02,
                                        ),
                                        if (!isSmallCard)
                                          Text(
                                            product.description ?? '',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        const Spacer(),
                                        Text(
                                          '\$${product.price}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                    );
              },
            ),
          ),
        ],
      ),
    );
  }
}
