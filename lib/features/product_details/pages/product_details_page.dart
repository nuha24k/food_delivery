import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/models/food_item_model.dart';
import '../bloc/product_details_bloc.dart';
import '../bloc/product_details_event.dart';
import '../bloc/product_details_state.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  final Color _darkBg = const Color(0xFF121212);
  final Color _cardColor = const Color(0xFF222222);
  final Color _yellowColor = const Color(0xFFFFCE31);
  final Color _textColor = Colors.white;
  final Color _subTextColor = const Color(0xFFAAAAAA);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
      builder: (context, state) {
        if (state is ProductDetailsLoading) {
          return Scaffold(
            backgroundColor: _darkBg,
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        if (state is ProductDetailsLoaded) {
          final food = state.food;
          return Scaffold(
            backgroundColor: _darkBg,
            body: Stack(
              children: [
                // Background Image
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Image.network(food.imageUrl, fit: BoxFit.cover),
                ),

                // Scrollable Content
                Positioned.fill(
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.4,
                        ),
                      ),
                      SliverToBoxAdapter(child: _buildMainContent(food)),
                    ],
                  ),
                ),

                // Top Header (Back, Heart, Share)
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: _buildIconBtn(
                            Icons.arrow_back_ios_new,
                            size: 20,
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                context.read<ProductDetailsBloc>().add(
                                  ToggleFavoriteStatus(),
                                );
                              },
                              child: _buildIconBtn(
                                food.isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: food.isFavorite
                                    ? Colors.red
                                    : _yellowColor,
                              ),
                            ),
                            const SizedBox(width: 12),
                            _buildIconBtn(Icons.ios_share, color: _yellowColor),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Bottom Bar
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _buildBottomBar(food),
                ),
              ],
            ),
          );
        }

        return Scaffold(
          backgroundColor: _darkBg,
          body: const Center(
            child: Text(
              'Error loading details',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  Widget _buildIconBtn(IconData icon, {Color? color, double size = 24}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.5),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: color ?? Colors.white, size: size),
    );
  }

  Widget _buildMainContent(FoodItemModel food) {
    return Container(
      decoration: BoxDecoration(
        color: _darkBg,
        boxShadow: [
          BoxShadow(
            color: _darkBg,
            blurRadius: 10,
            spreadRadius: 10,
            offset: const Offset(0, -10),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Floating Restaurant Info Card
            Transform.translate(
              offset: const Offset(0, -30),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: _cardColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          food.name,
                          style: TextStyle(
                            color: _yellowColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: _yellowColor, size: 20),
                            const SizedBox(width: 4),
                            Text(
                              food.rating.toString(),
                              style: TextStyle(
                                color: _textColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Divider(color: Colors.grey.withValues(alpha: 0.2)),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 24,
                          backgroundImage: NetworkImage(
                            'https://randomuser.me/api/portraits/men/32.jpg',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mitchel Santnar',
                                style: TextStyle(
                                  color: _textColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'ID: 13256626',
                                style: TextStyle(
                                  color: _subTextColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: _yellowColor,
                          child: const Icon(
                            Icons.chat_bubble_outline,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 10),
                        CircleAvatar(
                          backgroundColor: _yellowColor,
                          child: const Icon(
                            Icons.phone_outlined,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Description Section
            Text(
              'Description',
              style: TextStyle(
                color: _yellowColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  color: _subTextColor,
                  fontSize: 14,
                  height: 1.5,
                ),
                children: [
                  TextSpan(
                    text:
                        "From fresh bread to dairy, we've got all your groceries. Shop now, and we'll deliver them fast! Shop now, and we'll deliver t ",
                  ),
                  TextSpan(
                    text: '...Read more',
                    style: TextStyle(
                      color: _yellowColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Info Chips Side by Side
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: _cardColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.access_time, color: _yellowColor, size: 20),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Delivery Time',
                              style: TextStyle(
                                color: _subTextColor,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              '${food.deliveryTimeMinutes} min',
                              style: TextStyle(
                                color: _textColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: _cardColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.local_shipping_outlined,
                          color: _yellowColor,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Delivery Type',
                              style: TextStyle(
                                color: _subTextColor,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              food.restaurant,
                              style: TextStyle(
                                color: _textColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
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
            const SizedBox(height: 100), // Space for bottom bar
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar(FoodItemModel food) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$${food.price.toStringAsFixed(2)}',
              style: TextStyle(
                color: _yellowColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: _yellowColor,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Add to Cart',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
