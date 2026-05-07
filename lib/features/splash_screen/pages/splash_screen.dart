import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/splash_bloc.dart';
import '../bloc/spash_event.dart';
import '../bloc/splash_state.dart';
import '../../home/pages/home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashBloc()..add(SplashStarted()),
      child: const SplashView(),
    );
  }
}

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A), // Deep dark charcoal
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const HomePage()),
            );
          }
        },
        child: Stack(
          children: [
            // Background Image Collage with dark wood/stone texture vibe
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: size.height * 0.65,
              child: _buildImageCollage(),
            ),

            // Gradient Overlay
            Positioned(
              top: size.height * 0.35,
              left: 0,
              right: 0,
              height: size.height * 0.3,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Color(0xFF1A1A1A),
                    ],
                  ),
                ),
              ),
            ),

            // Main Content Area
            SafeArea(
              child: Column(
                children: [
                  // Plain text 'phone' at the very top
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      'phone',
                      style: TextStyle(
                        color: Colors.white54, // light gray
                        fontSize: 14,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),

                  const Spacer(),

                  // Bottom Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Let's Get Started",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto', // sans-serif
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 32),

                        // Main Button
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (_) => const HomePage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 4,
                            ),
                            child: const Text(
                              "Let's Get Started",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Divider with Login
                        Row(
                          children: [
                            Expanded(child: Divider(color: Colors.white.withValues(alpha: 0.2), thickness: 1)),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Expanded(child: Divider(color: Colors.white.withValues(alpha: 0.2), thickness: 1)),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // Social Buttons
                        Row(
                          children: [
                            Expanded(
                              child: _buildSocialButton(
                                context,
                                'Google',
                                Icons.g_mobiledata_rounded, // fallback icon
                                onPressed: () {
                                  context.read<SplashBloc>().add(SplashLoginWithGooglePressed());
                                },
                                isGoogle: true,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _buildSocialButton(
                                context,
                                'Apple',
                                Icons.apple,
                                onPressed: () {
                                  context.read<SplashBloc>().add(SplashLoginWithApplePressed());
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageCollage() {
    // Dynamic, artful stacked collage with dark dividers.
    // Using a Container with a dark background to act as dividers when padding is applied.
    return Container(
      color: const Color(0xFF121212), // dark divider color
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 2.0, bottom: 2.0),
                    child: _buildNetworkImage(
                        'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?q=80&w=1000&auto=format&fit=crop'),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 2.0),
                          child: _buildNetworkImage(
                              'https://images.unsplash.com/photo-1564834724105-918b73d1b9e0?q=80&w=1000&auto=format&fit=crop'),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 2.0),
                          child: _buildNetworkImage(
                              'https://images.unsplash.com/photo-1512058564366-18510be2db19?q=80&w=1000&auto=format&fit=crop'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 2.0),
                    child: _buildNetworkImage(
                        'https://images.unsplash.com/photo-1555126634-323283e090fa?q=80&w=1000&auto=format&fit=crop'),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: _buildNetworkImage(
                      'https://images.unsplash.com/photo-1588166524941-3bf61a9c41db?q=80&w=1000&auto=format&fit=crop'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNetworkImage(String url) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildSocialButton(BuildContext context, String title, IconData iconData, {required VoidCallback onPressed, bool isGoogle = false}) {
    return SizedBox(
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 2,
          padding: EdgeInsets.zero,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isGoogle)
              Image.network(
                'https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png',
                width: 24,
                height: 24,
                errorBuilder: (context, error, stackTrace) => Icon(iconData, size: 28),
              )
            else
              Icon(iconData, size: 28),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}