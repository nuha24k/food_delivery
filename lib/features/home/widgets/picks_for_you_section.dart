import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_theme.dart';
import '../../product_details/bloc/product_details_bloc.dart';
import '../../product_details/bloc/product_details_event.dart';
import '../../product_details/pages/product_details_page.dart';
import '../bloc/home_bloc.dart';
import 'food_card.dart';

class PicksForYouSection extends StatelessWidget {
  const PicksForYouSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Picks For You 🔥',
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
            SizedBox(
              height: 260,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 16, right: 2),
                physics: const BouncingScrollPhysics(),
                itemCount: state.picksForYou.length,
                itemBuilder: (context, index) {
                  final food = state.picksForYou[index];
                  return FoodCard(
                    food: food,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) =>
                                ProductDetailsBloc()
                                  ..add(LoadProductDetails(food)),
                            child: const ProductDetailsPage(),
                          ),
                        ),
                      );
                    },
                    onFavoriteToggle: () {
                      context.read<HomeBloc>().add(HomeToggleFavorite(food.id));
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
