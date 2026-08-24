import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/sample_data.dart';
import '../../../brand/domain/entities/brand_entity.dart';
import '../../../brand/presentation/bloc/brand_bloc.dart';
import '../../../brand/presentation/bloc/brand_state.dart';

class BrandsGrid extends StatelessWidget {
  const BrandsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandBloc, BrandState>(
      builder: (context, state) {
        if (state is BrandLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        
        List<BrandEntity> displayBrands = [];
        if (state is BrandLoaded) {
          displayBrands = state.brands;
        } else {
          displayBrands = sampleBrands;
        }

        if (displayBrands.isEmpty) return const SizedBox.shrink();

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: displayBrands.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.2,
            ),
            itemBuilder: (context, index) {
              final brand = displayBrands[index];
              return Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.pets_outlined, color: AppColors.primary.withOpacity(0.4), size: 24),
                    const SizedBox(height: 8),
                    Text(
                      brand.brandName,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
