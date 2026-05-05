import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_theme.dart';

class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 140,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFFC107), Color(0xFFFFD54F)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.4),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Decorative circles
          Positioned(
            right: -20,
            top: -20,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.1),
              ),
            ),
          ),
          Positioned(
            right: 60,
            bottom: -30,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.08),
              ),
            ),
          ),
          // Food image on right
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: SizedBox(
                width: 150,
                child: CachedNetworkImage(
                  imageUrl:
                      'https://images.unsplash.com/photo-1553621042-f6e147245754?w=300&q=80',
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: Colors.orange.withValues(alpha: 0.3),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.orange.withValues(alpha: 0.3),
                    child: const Icon(Icons.fastfood, color: Colors.white54),
                  ),
                ),
              ),
            ),
          ),
          // Text content
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Gonna Be a\nGood Day!',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: AppColors.onPrimary,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'Free delivery, lower fees,\n& 10% cashback, pickup!',
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: AppColors.onPrimary.withValues(alpha: 0.75),
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.onPrimary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Order Now',
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
