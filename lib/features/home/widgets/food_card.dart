import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/models/food_item_model.dart';
import '../../../../core/theme/app_theme.dart';

class FoodCard extends StatelessWidget {
  final FoodItemModel food;
  final VoidCallback onFavoriteToggle;

  const FoodCard({
    super.key,
    required this.food,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      margin: const EdgeInsets.only(right: 14),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image section
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: SizedBox(
                  height: 155,
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: food.imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: AppColors.surfaceVariant,
                      child: const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: AppColors.surfaceVariant,
                      child: const Icon(
                        Icons.fastfood,
                        color: AppColors.textHint,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ),
              // Rating badge
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.65),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: AppColors.star,
                        size: 14,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        '${food.rating} (${_formatReviews(food.reviewCount)})',
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Favorite button
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: onFavoriteToggle,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: food.isFavorite
                          ? AppColors.red.withValues(alpha: 0.9)
                          : Colors.black.withValues(alpha: 0.55),
                    ),
                    child: Icon(
                      food.isFavorite
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Info section
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      food.name,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      food.restaurant,
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    _InfoChip(
                      icon: Icons.access_time_rounded,
                      label: '${food.deliveryTimeMinutes} min',
                    ),
                    const SizedBox(width: 6),
                    _InfoChip(
                      icon: Icons.local_fire_department_rounded,
                      label: food.difficulty,
                      color: _difficultyColor(food.difficulty),
                    ),
                    const Spacer(),
                    Text(
                      '\$${food.price.toStringAsFixed(2)}',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatReviews(int count) {
    if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}k';
    }
    return count.toString();
  }

  Color _difficultyColor(String difficulty) {
    switch (difficulty.toLowerCase()) {
      case 'easy':
        return AppColors.green;
      case 'medium':
        return AppColors.primary;
      case 'hard':
        return AppColors.red;
      default:
        return AppColors.textSecondary;
    }
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _InfoChip({
    required this.icon,
    required this.label,
    this.color = AppColors.textSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 13, color: color),
        const SizedBox(width: 3),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: color,
          ),
        ),
      ],
    );
  }
}
