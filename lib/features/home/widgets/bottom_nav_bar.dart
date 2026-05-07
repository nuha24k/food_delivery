import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_theme.dart';
import '../bloc/home_bloc.dart';

/// Bottom navigation bar dengan animated pill indicator.
/// Memiliki 4 tab: Home, Wishlist, Cart, Profile.
class HomeBottomNav extends StatelessWidget {
  final int selectedIndex;

  const HomeBottomNav({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    final items = [
      (Icons.home_rounded, Icons.home_outlined, 'Home'),
      (Icons.favorite_rounded, Icons.favorite_border_rounded, 'Orders'),
      (Icons.shopping_cart_rounded, Icons.shopping_cart_outlined, 'Payment'),
      (Icons.person_rounded, Icons.person_outline_rounded, 'Profile'),
    ];

    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 4),
      height: 68,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(36),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (i) {
          final isSelected = i == selectedIndex;
          final (activeIcon, inactiveIcon, label) = items[i];

          return GestureDetector(
            onTap: () => context.read<HomeBloc>().add(HomeNavTabChanged(i)),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutCubic,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isSelected ? activeIcon : inactiveIcon,
                    color: isSelected
                        ? AppColors.onPrimary
                        : AppColors.textSecondary,
                    size: 22,
                  ),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOutCubic,
                    child: isSelected
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(width: 6),
                              Text(
                                label,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.onPrimary,
                                ),
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
