import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:try_on_fashion/login_screen.dart';
import 'package:try_on_fashion/main.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;

  final List<Widget> _onboardingScreens = [
    const OnboardingScreenContent(
      imageUrl: 'assets/images/onboard1.png',
      title: 'Welcome to Try On Fashion',
      subtitle: 'Discover the latest trends in fashion.',
    ),
    const OnboardingScreenContent(
      imageUrl: 'assets/images/onboard2.jpg',
      title: 'Virtual Try-On',
      subtitle: 'Try on clothes virtually before you buy.',
    ),
    const OnboardingScreenContent(
      imageUrl: 'assets/images/onboard3.png',
      title: 'Shop with Confidence',
      subtitle: 'Find the perfect fit for you.',
    ),
  ];

  void _navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CarouselSlider(
              items: _onboardingScreens,
              options: CarouselOptions(
                enableInfiniteScroll: false,
                height: double.infinity,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _onboardingScreens.map((screen) {
              int index = _onboardingScreens.indexOf(screen);
              return Container(
                width: 8.0,
                height: 8.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      _currentIndex == index ? Colors.deepPurple : Colors.grey,
                ),
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
                onPressed: _navigateToLogin,
                child: Text(
                  _currentIndex == _onboardingScreens.length - 1
                      ? 'Login'
                      : 'Skip',
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingScreenContent extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const OnboardingScreenContent({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imageUrl),
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
