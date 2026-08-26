import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../injection_container.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/network/session_manager.dart';
import '../../domain/entities/product.dart';
import '../bloc/review_cubit.dart';

class ProductReviewsSection extends StatefulWidget {
  final Product product;
  final List<ProductReview> reviews;
  final int? orderId;

  const ProductReviewsSection({
    super.key,
    required this.product,
    required this.reviews,
    this.orderId,
  });

  @override
  State<ProductReviewsSection> createState() => _ProductReviewsSectionState();
}

class _ProductReviewsSectionState extends State<ProductReviewsSection> {
  final _titleController = TextEditingController();
  final _textController = TextEditingController();
  int _rating = 5;
  bool _isWritingReview = false;

  @override
  void initState() {
    super.initState();
    _checkReviewStatus();
  }

  @override
  void didUpdateWidget(covariant ProductReviewsSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.reviews != oldWidget.reviews) {
      _checkReviewStatus();
    }
  }

  void _checkReviewStatus() {
    final currentUserId = sl<SessionManager>().currentUser?.userId;
    final hasAlreadyReviewed = widget.reviews.any((r) => r.customerId == currentUserId);
    
    // Auto-expand if coming from an order and haven't reviewed yet
    // Auto-close if already reviewed
    if (widget.orderId != null && !hasAlreadyReviewed && !_isWritingReview) {
      _isWritingReview = true;
    } else if (hasAlreadyReviewed && _isWritingReview) {
      _isWritingReview = false;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _textController.dispose();
    super.dispose();
  }

  void _submitReview() {
    final customerId = sl<SessionManager>().currentUser?.userId;
    if (customerId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please login to write a review')),
      );
      return;
    }

    if (_textController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter review details')),
      );
      return;
    }

    context.read<ReviewCubit>().createProductReview(
          productId: widget.product.productId ?? 0,
          customerId: customerId,
          orderId: widget.orderId,
          rating: _rating,
          reviewTitle: _titleController.text,
          reviewText: _textController.text,
        );
    
    // Clear fields and close section after submission
    _titleController.clear();
    _textController.clear();
    setState(() {
      _rating = 5;
      _isWritingReview = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentUserId = sl<SessionManager>().currentUser?.userId;
    final hasAlreadyReviewed = widget.reviews.any((r) => r.customerId == currentUserId);

    // Calculate rating summary if there are reviews
    double avgRating = 0;
    Map<int, int> starCounts = {5: 0, 4: 0, 3: 0, 2: 0, 1: 0};
    
    if (widget.reviews.isNotEmpty) {
      double totalRating = 0;
      for (var review in widget.reviews) {
        totalRating += review.rating;
        int r = review.rating.round();
        if (starCounts.containsKey(r)) {
          starCounts[r] = starCounts[r]! + 1;
        }
      }
      avgRating = totalRating / widget.reviews.length;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Ratings & Reviews (${widget.reviews.length})', style: AppTextStyles.h3),
              if (!_isWritingReview && widget.orderId != null && !hasAlreadyReviewed)
                TextButton.icon(
                  onPressed: () => setState(() => _isWritingReview = true),
                  icon: const Icon(Icons.edit_note, color: AppColors.primary, size: 20),
                  label: const Text('Write Review', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
                ),
            ],
          ),
        ),
        AppSizes.gapH16,
        
        // New Review Input Section with Animation
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: _isWritingReview && !hasAlreadyReviewed
              ? Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  padding: const EdgeInsets.all(AppSizes.s16),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.primary.withOpacity(0.3)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Share your thoughts', style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.bold)),
                          IconButton(
                            icon: const Icon(Icons.close, size: 20, color: Colors.grey),
                            onPressed: () => setState(() => _isWritingReview = false),
                          ),
                        ],
                      ),
                      AppSizes.gapH8,
                      Row(
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: () => setState(() => _rating = index + 1),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Icon(
                                index < _rating ? Icons.star : Icons.star_border,
                                color: Colors.orange,
                                size: 32,
                              ),
                            ),
                          );
                        }),
                      ),
                      AppSizes.gapH16,
                      TextField(
                        controller: _titleController,
                        decoration: InputDecoration(
                          hintText: 'Review Title (Optional)',
                          filled: true,
                          fillColor: Colors.grey.shade50,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade200),
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        ),
                      ),
                      AppSizes.gapH12,
                      TextField(
                        controller: _textController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: 'What did you like or dislike about this product?',
                          filled: true,
                          fillColor: Colors.grey.shade50,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.shade200),
                          ),
                          contentPadding: const EdgeInsets.all(16),
                        ),
                      ),
                      AppSizes.gapH16,
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => setState(() => _isWritingReview = false),
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                              child: const Text('Cancel'),
                            ),
                          ),
                          AppSizes.gapW12,
                          Expanded(
                            flex: 2,
                            child: ElevatedButton(
                              onPressed: _submitReview,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: AppColors.white,
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                elevation: 0,
                              ),
                              child: const Text('Submit Review', style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
        ),
        
        AppSizes.gapH16,
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          padding: const EdgeInsets.all(AppSizes.s16),
          decoration: BoxDecoration(
            color: const Color(0xFFF7F8FA),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Overall Rating Summary',
                  style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600, color: Colors.black87)),
              AppSizes.gapH12,
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.orange, size: 20),
                  AppSizes.gapW8,
                  Text(
                    '${avgRating.toStringAsFixed(1)} / 5',
                    style: const TextStyle(fontWeight: FontWeight.w900, color: Colors.black, fontSize: 14),
                  ),
                ],
              ),
              AppSizes.gapH16,
              _buildRatingBar(5, widget.reviews.isEmpty ? 0 : starCounts[5]! / widget.reviews.length),
              _buildRatingBar(4, widget.reviews.isEmpty ? 0 : starCounts[4]! / widget.reviews.length),
              _buildRatingBar(3, widget.reviews.isEmpty ? 0 : starCounts[3]! / widget.reviews.length),
              _buildRatingBar(2, widget.reviews.isEmpty ? 0 : starCounts[2]! / widget.reviews.length),
              _buildRatingBar(1, widget.reviews.isEmpty ? 0 : starCounts[1]! / widget.reviews.length),
            ],
          ),
        ),
        AppSizes.gapH24,
        if (widget.reviews.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('No reviews yet for this product.', style: TextStyle(color: Colors.grey)),
          )
        else
          ...widget.reviews.take(3).map((review) => _buildReviewCard(review)),
        
        if (widget.reviews.length > 3)
          Center(
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'See more',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildRatingBar(int stars, double percentage) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          SizedBox(
            width: 25,
            child: Row(
              children: [
                Text('$stars', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                const SizedBox(width: 2),
                const Icon(Icons.star, color: Colors.orange, size: 12),
              ],
            ),
          ),
          AppSizes.gapW8,
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: percentage,
                backgroundColor: Colors.grey.shade300,
                valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFE985F)),
                minHeight: 6,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewCard(ProductReview review) {
    String dateStr = '';
    try {
      final date = DateTime.parse(review.createdDate);
      dateStr = DateFormat('MMM d, yyyy').format(date);
    } catch (e) {
      dateStr = review.createdDate;
    }

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      padding: const EdgeInsets.all(AppSizes.s16),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                review.customerName ?? 'Anonymous',
                style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 14, color: Colors.black),
              ),
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    Icons.star,
                    color: index < review.rating ? Colors.orange : Colors.grey.shade300,
                    size: 16,
                  );
                }),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Text(
            dateStr,
            style: const TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w500),
          ),
          if (review.reviewTitle != null && review.reviewTitle!.isNotEmpty) ...[
            AppSizes.gapH8,
            Text(
              review.reviewTitle!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ],
          AppSizes.gapH8,
          Text(
            review.reviewText ?? '',
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 12,
              height: 1.5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
