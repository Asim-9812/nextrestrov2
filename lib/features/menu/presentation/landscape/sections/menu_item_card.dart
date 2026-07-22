import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nextrestro/core/constants/app_colors.dart';
import 'package:nextrestro/core/network/api_constants.dart';
import '../../../data/models/menu_item_model.dart';

class MenuItemCard extends StatelessWidget {
  final MenuItemModel item;
  final bool isPortrait;

  const MenuItemCard({
    super.key, 
    required this.item,
    this.isPortrait = false,
  });

  @override
  Widget build(BuildContext context) {
    // Font size scaling for portrait density
    final double titleSize = isPortrait ? 10.5 : 14;
    final double subTitleSize = isPortrait ? 8.5 : 12;
    final double priceSize = isPortrait ? 11 : 15;
    final double padding = isPortrait ? 8.0 : 12.0;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(isPortrait ? 12 : 16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(isPortrait ? 12 : 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: _buildImage(),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.itemName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: titleSize,
                            fontFamily: 'Manrope',
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          item.subCategoryName,
                          style: TextStyle(
                            color: AppColors.grey,
                            fontSize: subTitleSize,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rs. ${item.price.toStringAsFixed(0)}',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: priceSize,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(isPortrait ? 2 : 4),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.add,
                            color: AppColors.primary,
                            size: isPortrait ? 12 : 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    if (item.image != null && item.image!.isNotEmpty) {
      final url = item.image!.startsWith('http') 
          ? item.image! 
          : '${ApiConstants.baseUrl}/${item.image}';
      
      return CachedNetworkImage(
        imageUrl: url,
        width: double.infinity,
        fit: BoxFit.cover,
        placeholder: (context, url) => _buildAssetPlaceholder(),
        errorWidget: (context, url, error) => _buildInitialPlaceholder(),
      );
    }
    return _buildInitialPlaceholder();
  }

  Widget _buildInitialPlaceholder() {
    return Container(
      width: double.infinity,
      color: AppColors.primary.withOpacity(0.1),
      child: Center(
        child: Text(
          item.itemName.isNotEmpty ? item.itemName[0].toUpperCase() : '?',
          style: const TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
      ),
    );
  }

  Widget _buildAssetPlaceholder() {
    String imagePath = 'assets/images/momo.jpg';
    if (item.categoryName.toLowerCase().contains('drink') || 
        item.categoryName.toLowerCase().contains('beverage')) {
      imagePath = 'assets/images/drinks.jpg';
    }
    return Image.asset(
      imagePath,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
