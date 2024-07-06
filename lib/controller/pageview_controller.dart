import 'package:flutter/material.dart';

class PageViewProvider with ChangeNotifier {
  int _currentPage = 0;
  int get currentPage => _currentPage;

  late PageController _pageController = PageController(initialPage: 0);
  PageController get pageController => _pageController;

  void nextPage() {
    _currentPage++;
    _pageController.animateToPage(
      _currentPage,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
    notifyListeners();
  }

  void previousPage() {
    _currentPage--;
    _pageController.animateToPage(
      _currentPage,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
    notifyListeners();
  }

  void setPage(int index) {
    _currentPage = index;
    _pageController.animateToPage(
      _currentPage,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
    notifyListeners();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
