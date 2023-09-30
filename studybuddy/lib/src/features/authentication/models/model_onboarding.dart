import 'dart:ui';

class OnBoardingModel {
  final String title;
  final String subtitle;
  final String counterText;
  final String image;
  final Color bgcolor;

  OnBoardingModel({
    required this.title,
    required this.image,
    required this.bgcolor,
    required this.subtitle,
    required this.counterText,
  });
}