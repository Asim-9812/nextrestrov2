import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../product_type/presentation/bloc/product_type_bloc.dart';
import '../../../product_type/presentation/bloc/product_type_state.dart';
import '../../../product_type/presentation/pages/product_type_products_page.dart';

class ShopCategoryIcons extends StatelessWidget {
  const ShopCategoryIcons({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color> pastelColors = [
      const Color(0xFFFFE5D9),
      const Color(0xFFF2EEFF),
      const Color(0xFFE8F9F1),
      const Color(0xFFE0F2FE),
      const Color(0xFFFFECEB),
      const Color(0xFFF7F8FA),
    ];

    return BlocBuilder<ProductTypeBloc, ProductTypeState>(
      builder: (context, state) {
        if (state is ProductTypeLoading) {
          return const SizedBox(
            height: 80,
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is ProductTypeLoaded) {
          return Container(
            height: 90,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: state.productTypes.length,
              itemBuilder: (context, index) {
                final type = state.productTypes[index];
                final color = pastelColors[index % pastelColors.length];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductTypeProductsPage(productType: type),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.03),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Icon(Icons.category_outlined, color: Colors.black54, size: 24),
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: 70,
                          child: Text(
                            type.productTypeName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold, 
                              fontSize: 10,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is ProductTypeError) {
          return Center(child: Text(state.message));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
