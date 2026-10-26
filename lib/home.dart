import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Palette (estimated from the design)
const _lime = Color(0xFFE3ED79);
const _limeDark = Color(0xFFCFE04E);
const _green = Color(0xFF2E9E5B);
const _pink = Color(0xFFF0668C);
const _ink = Color(0xFF111111);
const _muted = Color(0xFF6E6E6E);
const _statBg = Color(0xFFEEF0DC);
const _barBg = Color(0xFFF2F2F2);

/// Asset slots you fill in yourself.
const _bannerAsset = 'assets/images/peep-6.png';
const _avatarAsset = 'assets/images/avatar.png';
const _creatorAvatarAsset = 'assets/images/Hijab.png';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0x33E0F37D), Color(0xFFF9F9F9)],
        ),
      ),
      child: Stack(
        children: [
          SafeArea(
            bottom: false,
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 130),
              children: const [
                _Header(),
                SizedBox(height: 22),
                _DrawBanner(),
                SizedBox(height: 18),
                _Tabs(),
                SizedBox(height: 18),
                _PoolCard(
                  title: 'Bike Pool',
                  creator: 'Zuha',
                  day: '02',
                  month: 'OCT',
                  stats: [
                    _Stat(
                      Icons.track_changes_rounded,
                      'Draws won',
                      '0/12',
                      Color(0xFFE9779B),
                    ),
                    _Stat(
                      Icons.currency_exchange_rounded,
                      'Amount',
                      r'$ 3,000',
                      _green,
                    ),
                    _Stat(
                      Icons.monetization_on_rounded,
                      'Lot Amount',
                      r'$ 12,000',
                      Color(0xFFE7B21C),
                    ),
                  ],
                  footer: '08 days till the draw',
                ),
                SizedBox(height: 20),
                _PoolCard(
                  title: 'Home Pool',
                  creator: 'Zuha',
                  stats: [
                    _Stat(
                      Icons.track_changes_rounded,
                      'Draws won',
                      '0/12',
                      Color(0xFFE9779B),
                    ),
                    _Stat(
                      Icons.currency_exchange_rounded,
                      'Amount',
                      r'$ 3,000',
                      _green,
                    ),
                    _Stat(
                      Icons.monetization_on_rounded,
                      'Lot Amount',
                      r'$ 12,000',
                      Color(0xFFE7B21C),
                    ),
                  ],
                  footer: 'Awaiting for invitees to join',
                ),
              ],
            ),
          ),
          const Positioned(left: 0, right: 0, bottom: 32, child: _BottomNav()),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 44,
                height: 44,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD9B8),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(
                  _avatarAsset,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.face_rounded, color: Color(0xFFE5475E)),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Glad you’re here,',
                style: GoogleFonts.outfit(fontSize: 16, color: _ink),
              ),
              Text(
                'Vidhun',
                style: GoogleFonts.outfit(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: _ink,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: const Color(0xFFE4F0A8),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: _limeDark, width: 1),
          ),
          child: const Icon(
            Icons.notifications_none_rounded,
            color: Color(0xFF6B7A00),
            size: 22,
          ),
        ),
      ],
    );
  }
}

class _DrawBanner extends StatelessWidget {
  const _DrawBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 138,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Banner image slot, bottom-right (add assets/banner.png).
          Positioned(
            right: 0,
            bottom: 0,
            width: 120,
            height: 134,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(24),
              ),
              child: Image.asset(
                _bannerAsset,
                fit: BoxFit.contain,
                alignment: Alignment.bottomRight,
                errorBuilder: (_, __, ___) => const SizedBox.shrink(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 0, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _lime,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Upcoming Draw',
                    style: GoogleFonts.outfit(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: 210,
                  child: Text.rich(
                    TextSpan(
                      style: GoogleFonts.outfit(
                        fontSize: 12.5,
                        height: 1.35,
                        color: _ink,
                      ),
                      children: const [
                        TextSpan(text: '⌛ The pool draw for '),
                        TextSpan(
                          text: 'Bike Pool',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        TextSpan(text: ' is happening tomorrow. Stay tuned!"'),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  height: 36,
                  padding: const EdgeInsets.only(left: 12, right: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F1F1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'View Pool',
                        style: GoogleFonts.outfit(fontSize: 11.5),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        width: 44,
                        height: 28,
                        decoration: BoxDecoration(
                          color: _ink,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(
                          Icons.north_east_rounded,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ],
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

class _Tabs extends StatelessWidget {
  const _Tabs();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: _pink,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.hexagon_outlined,
                      color: Colors.white,
                      size: 16,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Manage Pool',
                      style: GoogleFonts.outfit(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Joined Pool',
                  style: GoogleFonts.outfit(fontSize: 13, color: _ink),
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Text(
          'View all',
          style: GoogleFonts.outfit(fontSize: 12.5, color: _ink),
        ),
      ],
    );
  }
}

class _Stat {
  const _Stat(this.icon, this.label, this.value, this.color);

  final IconData icon;
  final String label;
  final String value;
  final Color color;
}

class _PoolCard extends StatelessWidget {
  const _PoolCard({
    required this.title,
    required this.creator,
    required this.stats,
    required this.footer,
    this.day,
    this.month,
  });

  final String title;
  final String creator;
  final List<_Stat> stats;
  final String footer;
  final String? day;
  final String? month;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Lime header
        Container(
          height: 124,
          decoration: BoxDecoration(
            color: _lime,
            borderRadius: BorderRadius.circular(28),
          ),
          padding: const EdgeInsets.fromLTRB(20, 14, 16, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CalendarBadge(day: day, month: month),
              const SizedBox(width: 14),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.outfit(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.fromLTRB(4, 3, 10, 3),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.55),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              radius: 7,
                              backgroundColor: Color(0xFFE699F1),
                              child: Image.asset(
                                _creatorAvatarAsset,
                                width: 10,
                                height: 10,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => const Icon(
                                  Icons.person,
                                  size: 12,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              '$creator • Creator',
                              style: GoogleFonts.outfit(
                                fontSize: 11.5,
                                color: _ink,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // White panel overlapping the header
        Padding(
          padding: const EdgeInsets.only(top: 92),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 18,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: _statBg,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      for (final s in stats)
                        Expanded(child: _StatTile(stat: s)),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 52,
                  padding: const EdgeInsets.only(left: 0, right: 6),
                  decoration: BoxDecoration(
                    color: _barBg,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            footer,
                            style: GoogleFonts.outfit(
                              fontSize: 11,
                              color: _ink,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: _green,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.north_east_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _CalendarBadge extends StatelessWidget {
  const _CalendarBadge({this.day, this.month});

  final String? day;
  final String? month;

  @override
  Widget build(BuildContext context) {
    final hasDate = day != null;
    return SizedBox(
      width: 56,
      height: 64,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            top: 6,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              alignment: Alignment.center,
              child: hasDate
                  ? Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            day!,
                            style: GoogleFonts.outfit(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic,
                              color: const Color(0xFF7A8B00),
                            ),
                          ),
                          Text(
                            month!,
                            style: GoogleFonts.outfit(
                              fontSize: 10,
                              color: _pink,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: GridView.count(
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        physics: const NeverScrollableScrollPhysics(),
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        children: List.generate(
                          6,
                          (_) => Container(
                            decoration: const BoxDecoration(
                              color: Color(0xFFE2E2E2),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ),
            ),
          ),
          // Calendar rings
          Positioned(
            top: 0,
            left: 12,
            child: Container(
              width: 6,
              height: 12,
              decoration: BoxDecoration(
                color: hasDate ? const Color(0xFF7A8B00) : _ink,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 12,
            child: Container(
              width: 6,
              height: 12,
              decoration: BoxDecoration(
                color: hasDate ? const Color(0xFF7A8B00) : _ink,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({required this.stat});

  final _Stat stat;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 26,
          height: 26,
          decoration: BoxDecoration(
            color: stat.color.withValues(alpha: 0.18),
            shape: BoxShape.circle,
          ),
          child: Icon(stat.icon, size: 15, color: stat.color),
        ),
        const SizedBox(width: 6),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                stat.label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.outfit(fontSize: 10.5, color: _muted),
              ),
              Text(
                stat.value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.outfit(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BottomNav extends StatelessWidget {
  const _BottomNav();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        _NavCircle(
          icon: Icons.swap_horiz_rounded,
          size: 70,
          rotation: -0.785398,
        ),
        SizedBox(width: 6),
        _NavCircle(icon: Icons.home_outlined, size: 76, selected: true),
        SizedBox(width: 6),
        _NavCircle(icon: Icons.person_outline_rounded, size: 70),
      ],
    );
  }
}

class _NavCircle extends StatelessWidget {
  const _NavCircle({
    required this.icon,
    required this.size,
    this.selected = false,
    this.rotation = 0,
  });

  final IconData icon;
  final double size;
  final bool selected;
  final double rotation;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.95),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: selected
          ? Container(
              width: 56,
              height: 56,
              decoration: const BoxDecoration(
                color: _lime,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Transform.rotate(
                angle: rotation,
                child: Icon(icon, size: 26, color: _ink),
              ),
            )
          : Transform.rotate(
              angle: rotation,
              child: Icon(icon, size: 26, color: _ink),
            ),
    );
  }
}
