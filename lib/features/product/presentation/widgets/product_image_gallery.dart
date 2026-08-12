import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';

class ProductImageGallery extends StatefulWidget {
  final List<String> images;

  const ProductImageGallery({super.key, required this.images});

  @override
  State<ProductImageGallery> createState() => _ProductImageGalleryState();
}

class _ProductImageGalleryState extends State<ProductImageGallery> {
  final ScrollController _galleryController = ScrollController();
  bool _showLeftChevron = false;
  bool _showRightChevron = false;

  @override
  void initState() {
    super.initState();
    _galleryController.addListener(_updateChevronVisibility);
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateChevronVisibility());
  }

  @override
  void dispose() {
    _galleryController.removeListener(_updateChevronVisibility);
    _galleryController.dispose();
    super.dispose();
  }

  void _updateChevronVisibility() {
    if (!_galleryController.hasClients) return;
    final bool showLeft = _galleryController.offset > 5;
    final bool showRight = _galleryController.offset < (_galleryController.position.maxScrollExtent - 5);
    if (showLeft != _showLeftChevron || showRight != _showRightChevron) {
      setState(() {
        _showLeftChevron = showLeft;
        _showRightChevron = showRight;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primaryLighter,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Center(
              child: Image.asset(
                widget.images.first,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        AppSizes.gapH12,
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 40,
              child: ListView.builder(
                controller: _galleryController,
                scrollDirection: Axis.horizontal,
                itemCount: widget.images.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: AppSizes.s8),
                    padding: const EdgeInsets.all(AppSizes.s4),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.primaryLighter),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      widget.images[index],
                      fit: BoxFit.contain,
                    ),
                  );
                },
              ),
            ),
            if (_showLeftChevron)
              Positioned(
                left: 0,
                child: GestureDetector(
                  onTap: () => _galleryController.animateTo(
                    _galleryController.offset - 100,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.chevron_left, size: 16, color: AppColors.white),
                  ),
                ),
              ),
            if (_showRightChevron)
              Positioned(
                right: 0,
                child: GestureDetector(
                  onTap: () => _galleryController.animateTo(
                    _galleryController.offset + 100,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.chevron_right, size: 16, color: AppColors.white),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
