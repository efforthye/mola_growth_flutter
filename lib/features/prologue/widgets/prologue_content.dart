import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PrologueContent extends StatefulWidget {
  const PrologueContent({super.key});

  @override
  State<PrologueContent> createState() => _PrologueContentState();
}

class _PrologueContentState extends State<PrologueContent> with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int _currentPage = 0;

  final List<PrologueScene> _scenes = [
    PrologueScene(
      image: 'assets/images/prologue/scene1.png',
      text: '어느 날, 작은 몰라가 태어났어요...',
      backgroundColor: Colors.lightBlue[100]!,
    ),
    PrologueScene(
      image: 'assets/images/prologue/scene2.png',
      text: '아무도 몰라가 무엇인지 몰랐죠...',
      backgroundColor: Colors.lightBlue[200]!,
    ),
    PrologueScene(
      image: 'assets/images/prologue/scene3.png',
      text: '하지만 당신이 몰라를 키워주기로 했어요!',
      backgroundColor: Colors.lightBlue[300]!,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _scenes.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      context.go('/game');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          onPageChanged: (int page) {
            setState(() {
              _currentPage = page;
            });
          },
          itemCount: _scenes.length,
          itemBuilder: (context, index) {
            return _buildScene(_scenes[index]);
          },
        ),
        Positioned(
          bottom: 40,
          right: 20,
          child: Row(
            children: [
              // 페이지 인디케이터
              Row(
                children: List.generate(
                  _scenes.length,
                      (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == index
                          ? Colors.white
                          : Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              // 다음 버튼
              ElevatedButton(
                onPressed: _nextPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                child: Text(
                  _currentPage == _scenes.length - 1 ? '시작하기' : '다음',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildScene(PrologueScene scene) {
    return Container(
      color: scene.backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Center(
        child: Text(
          scene.text,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class PrologueScene {
  final String image;
  final String text;
  final Color backgroundColor;

  PrologueScene({
    required this.image,
    required this.text,
    required this.backgroundColor,
  });
}