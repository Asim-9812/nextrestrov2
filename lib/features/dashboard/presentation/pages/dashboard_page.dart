import 'package:flutter/material.dart';
import '../../../../core/constants/app_sizes.dart';
import '../widgets/best_sellers_grid.dart';
import '../widgets/brands_grid.dart';
import '../widgets/dashboard_categories.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/dashboard_main_banner.dart';
import '../widgets/dashboard_search_bar.dart';
import '../widgets/featured_deals.dart';
import '../widgets/new_arrivals_banner.dart';
import '../widgets/recommended_pets_list.dart';
import '../widgets/section_title.dart';
import '../widgets/shop_by_pets.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DashboardHeader(),
              const DashboardSearchBar(),
              const DashboardCategories(),
              const DashboardMainBanner(),
              AppSizes.gapH24,
              SectionTitle(title: 'Recommended For Your Pets', onSeeAll: () {}),
              const RecommendedPetsList(),
              AppSizes.gapH24,
              SectionTitle(title: 'Shop By Pets', onSeeAll: () {}),
              const ShopByPets(),
              const FeaturedDeals(),
              SectionTitle(title: 'Best Sellers \u{1F525}', onSeeAll: () {}),
              const BestSellersGrid(),
              AppSizes.gapH24,
              const NewArrivalsBanner(),
              SectionTitle(title: 'Shop By Brands', onSeeAll: () {}),
              const BrandsGrid(),
              AppSizes.gapH32,
            ],
          ),
        ),
      ),
    );
  }
}
