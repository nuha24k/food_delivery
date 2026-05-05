import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/models/category_model.dart';
import '../../../../core/theme/app_theme.dart';

class CategorySection extends StatelessWidget {
  final List<CategoryModel> categories;

  const CategorySection({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'See All',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: categories
              .map((cat) => _CategoryItem(category: cat))
              .toList(),
        ),
      ],
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final CategoryModel category;

  const _CategoryItem({required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            width: 88,
            height: 88,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.surface,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: category.imageUrl,
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
                    Icons.image_not_supported,
                    color: AppColors.textHint,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            category.name,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
