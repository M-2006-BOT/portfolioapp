import 'package:flutter/material.dart';

void main() {
  runApp(const ProfileCardApp());
}

class ProfileCardApp extends StatelessWidget {
  const ProfileCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    const accent = Color(0xFF62E6A7);

    return MaterialApp(
      title: 'Mugunthan M. | Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0F0D),
        colorScheme: ColorScheme.fromSeed(
          seedColor: accent,
          brightness: Brightness.dark,
        ),
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const accent = Color(0xFF62E6A7);
  static const muted = Color(0xFF9BAAA2);

  static const skills = [
    'Java',
    'Python',
    'C',
    'JavaScript',
    'HTML & CSS',
    'Spring Boot',
    'MySQL',
    'DSA · Learning',
  ];

  static const interests = [
    'Flutter',
    'App Development',
    'Software Engineering',
    'Cybersecurity',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF101D17),
              Color(0xFF0A0F0D),
              Color(0xFF0A0F0D),
            ],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final horizontalPadding = constraints.maxWidth < 360 ? 16.0 : 24.0;

              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: 28,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 520),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildProfileHeader(),
                        const SizedBox(height: 26),
                        _buildContactCard(),
                        const SizedBox(height: 18),
                        _buildSkillsCard(),
                        const SizedBox(height: 18),
                        _buildExperienceCard(),
                        const SizedBox(height: 22),
                        const Center(
                          child: Text(
                            'BUILDING • LEARNING • GROWING',
                            style: TextStyle(
                              color: muted,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: accent.withOpacity(0.55), width: 1.5),
            boxShadow: [
              BoxShadow(
                color: accent.withOpacity(0.12),
                blurRadius: 28,
                spreadRadius: 4,
              ),
            ],
          ),
          child: const CircleAvatar(
            radius: 48,
            backgroundColor: Color(0xFF1B3026),
            child: Text(
              'MM',
              style: TextStyle(
                color: accent,
                fontSize: 30,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Mugunthan M.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          '3rd Year Computer and Communication\nEngineering Student',
          textAlign: TextAlign.center,
          style: TextStyle(color: muted, fontSize: 14, height: 1.5),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: accent.withOpacity(0.10),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: accent.withOpacity(0.25)),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.circle, size: 8, color: accent),
              SizedBox(width: 8),
              Text(
                'ASPIRING SOFTWARE DEVELOPER',
                style: TextStyle(
                  color: accent,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContactCard() {
    return _SectionCard(
      title: 'CONTACT & EDUCATION',
      icon: Icons.contact_page_outlined,
      child: const Column(
        children: [
          ContactRow(
            icon: Icons.school_outlined,
            label: 'College',
            value: 'Rajalakshmi Institute of Technology',
          ),
          _RowDivider(),
          ContactRow(
            icon: Icons.location_on_outlined,
            label: 'Location',
            value: 'Chennai, Tamil Nadu, India',
          ),
          _RowDivider(),
          ContactRow(
            icon: Icons.email_outlined,
            label: 'Email',
            value: 'mmugunthan@gmail.com',
          ),
          _RowDivider(),
          ContactRow(
            icon: Icons.phone_outlined,
            label: 'Phone',
            value: '+91 8015088701',
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsCard() {
    return _SectionCard(
      title: 'TECHNICAL SKILLS',
      icon: Icons.terminal_rounded,
      child: Wrap(
        spacing: 9,
        runSpacing: 9,
        children: skills.map((skill) => _SkillChip(label: skill)).toList(),
      ),
    );
  }

  Widget _buildExperienceCard() {
    return _SectionCard(
      title: 'EXPERIENCE & INTERESTS',
      icon: Icons.auto_awesome_outlined,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _InfoItem(
            icon: Icons.work_outline_rounded,
            title: 'Web Development Intern',
            subtitle: 'CodSoft',
          ),
          const SizedBox(height: 14),
          const _InfoItem(
            icon: Icons.emoji_events_outlined,
            title: 'Bug Hunting',
            subtitle: 'Achieved 2 prizes',
          ),
          const SizedBox(height: 20),
          const Text(
            'AREAS OF INTEREST',
            style: TextStyle(
              color: muted,
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.4,
            ),
          ),
          const SizedBox(height: 11),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: interests
                .map((interest) => _InterestChip(label: interest))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class ContactRow extends StatelessWidget {
  const ContactRow({
    required this.icon,
    required this.label,
    required this.value,
    super.key,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: ProfileScreen.accent.withOpacity(0.09),
            borderRadius: BorderRadius.circular(11),
          ),
          child: Icon(icon, size: 18, color: ProfileScreen.accent),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: ProfileScreen.muted,
                  fontSize: 11,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  height: 1.35,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.title,
    required this.icon,
    required this.child,
  });

  final String title;
  final IconData icon;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: const Color(0xFF111A16),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.white.withOpacity(0.07)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 16, color: ProfileScreen.accent),
                const SizedBox(width: 9),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.15,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            child,
          ],
        ),
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  const _SkillChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1A2921),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ProfileScreen.accent.withOpacity(0.15)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFFD8E5DD),
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _InterestChip extends StatelessWidget {
  const _InterestChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(9),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFFC1CEC6),
          fontSize: 11,
        ),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  const _InfoItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 19, color: ProfileScreen.accent),
        const SizedBox(width: 11),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                subtitle,
                style: const TextStyle(
                  color: ProfileScreen.muted,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RowDivider extends StatelessWidget {
  const _RowDivider();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Divider(
        height: 1,
        thickness: 1,
        color: Colors.white.withOpacity(0.07),
      ),
    );
  }
}
