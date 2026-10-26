import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const FinlotApp());
}

class FinlotApp extends StatelessWidget {
  const FinlotApp({super.key});

  @override
  Widget build(BuildContext context) {
    final base = ThemeData(useMaterial3: true);
    return MaterialApp(
      title: 'Finlot',
      debugShowCheckedModeBanner: false,
      theme: base.copyWith(
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.outfitTextTheme(base.textTheme),
      ),
      home: const FinlotFlow(),
    );
  }
}

// ---------------------------------------------------------------------------
// Constants
// ---------------------------------------------------------------------------

const _splashAsset = 'assets/images/Spash.png';

const _splashGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Color(0xC2DFDDEA), Color(0x4DE0F37D), Color(0x00FFFFFF)],
  stops: [0.0, 0.5, 1.0],
);

const _ink = Color(0xFF111111);
const _body = Color(0xFF7A7A7A);

const _gradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Color(0x4DE0F37D), Color(0x00FFFFFF)],
);

class _Slide {
  const _Slide(this.image, this.title, this.subtitle);

  final String image;
  final String title;
  final String subtitle;
}

const _slides = <_Slide>[
  _Slide(
    'assets/images/Group 3.png',
    'Create Your Pool',
    'Bring your friends or teammates together and\n'
        'start a shared pool for any goal.',
  ),
  _Slide(
    'assets/images/Group 4.png',
    'Track Everything',
    'Stay updated with real-time balance,\n'
        'contributions, and expenses.',
  ),
  _Slide(
    'assets/images/Group 5.png',
    'Easy to Use',
    'Manage your pools effortlessly with a clean\n'
        'and simple interface.',
  ),
];

enum _Stage { splash, onboarding, home }

// ---------------------------------------------------------------------------
// Single page: splash -> onboarding (3 slides) -> home placeholder
// ---------------------------------------------------------------------------

class FinlotFlow extends StatefulWidget {
  const FinlotFlow({super.key});

  @override
  State<FinlotFlow> createState() => _FinlotFlowState();
}

class _FinlotFlowState extends State<FinlotFlow> {
  final _pageController = PageController();
  Timer? _splashTimer;
  _Stage _stage = _Stage.splash;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _splashTimer = Timer(const Duration(milliseconds: 2200), () {
      if (mounted) setState(() => _stage = _Stage.onboarding);
    });
  }

  @override
  void dispose() {
    _splashTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _onContinue() {
    if (_index == _slides.length - 1) {
      setState(() => _stage = _Stage.home);
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 450),
        child: switch (_stage) {
          _Stage.splash => _buildSplash(),
          _Stage.onboarding => _buildOnboarding(),
          _Stage.home => HomeScreen(),
        },
      ),
    );
  }

  // --- Splash ---------------------------------------------------------------

  Widget _buildSplash() {
    return Container(
      key: const ValueKey('splash'),
      decoration: const BoxDecoration(gradient: _splashGradient),
      child: Center(
        child: Image.asset(_splashAsset, width: 104, fit: BoxFit.contain),
      ),
    );
  }

  // --- Onboarding -----------------------------------------------------------

  Widget _buildOnboarding() {
    return Container(
      key: const ValueKey('onboarding'),
      decoration: const BoxDecoration(gradient: _gradient),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 14),
            _buildProgress(),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _slides.length,
                onPageChanged: (i) => setState(() => _index = i),
                itemBuilder: (_, i) => _buildSlide(_slides[i]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 28),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _onContinue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: const StadiumBorder(),
                    textStyle: GoogleFonts.outfit(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  child: const Text('Continue'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgress() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Row(
        children: List.generate(_slides.length, (i) {
          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: i == _slides.length - 1 ? 0 : 6),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                height: 4,
                decoration: BoxDecoration(
                  color: i <= _index ? const Color(0xFF2B2B2B) : Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildSlide(_Slide slide) {
    return Column(
      children: [
        SizedBox(
          height: 520,
          child: ClipRect(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 34),
                  child: Transform.scale(
                    scale: 1.15,
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      slide.image,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      width: double.infinity,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  height: 130,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.white.withOpacity(0), Colors.white],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          color: Colors.white,
          child: Text(
            slide.title,
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: _ink,
            ),
          ),
        ),
        const SizedBox(height: 14),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            slide.subtitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(fontSize: 14, height: 1.55, color: _body),
          ),
        ),
        const SizedBox(height: 28),
      ],
    );
  }

  // --- Home placeholder -----------------------------------------------------
}
