import 'dart:ui';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  final String username;

  const HomeScreen({super.key, required this.username});

  void _logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 800;

    return Scaffold(
      body: Container(
        // WHITE + PURPLE GRADIENT
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF4A148C), // Deep Purple
              Color(0xFF7B1FA2), // Purple
              Color(0xFFAB47BC), // Light Purple
            ],
          ),
        ),
        child: Stack(
          children: [
            // DECORATIVE CIRCLES
            Positioned(
              top: -80,
              left: -80,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
            Positioned(
              bottom: -100,
              right: -100,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.08),
                ),
              ),
            ),
            Positioned(
              top: 250,
              right: -60,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFCE93D8).withOpacity(0.25), // Soft Lavender
                ),
              ),
            ),

            // MAIN LAYOUT
            Row(
              children: [
                // SIDEBAR (LEFT)
                if (isDesktop)
                  ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: Container(
                        width: 250,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          border: Border(
                            right: BorderSide(
                              color: Colors.white.withOpacity(0.2),
                              width: 1,
                            ),
                          ),
                        ),
                        // ✅ SINGLECHILDSCROLLVIEW ARON DILI MO-OVERFLOW
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(height: 40),
                              // Logo (Pregnant Woman Icon)
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.3),
                                    width: 1.5,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.pregnant_woman,
                                  size: 32,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                username,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Take care, mom!',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(height: 40),
                              _SidebarItem(
                                icon: Icons.home,
                                label: 'Home',
                                selected: true,
                                onTap: () {},
                              ),
                              _SidebarItem(
                                icon: Icons.calendar_today,
                                label: 'Appointments',
                                onTap: () {},
                              ),
                              _SidebarItem(
                                icon: Icons.medical_services,
                                label: 'Health Records',
                                onTap: () {},
                              ),
                              _SidebarItem(
                                icon: Icons.child_care,
                                label: 'Baby Tracker',
                                onTap: () {},
                              ),
                              _SidebarItem(
                                icon: Icons.restaurant,
                                label: 'Nutrition',
                                onTap: () {},
                              ),
                              _SidebarItem(
                                icon: Icons.notifications,
                                label: 'Reminders',
                                onTap: () {},
                              ),
                              // ✅ GITANGGAL ANG SPACER() UG GIILISAN OG SIZEDBOX
                              const SizedBox(height: 40),
                              _SidebarItem(
                                icon: Icons.logout,
                                label: 'Logout',
                                onTap: () => _logout(context),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                // MAIN CONTENT
                Expanded(
                  child: Column(
                    children: [
                      // GLASS TOP BAR
                      ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 16,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.white.withOpacity(0.2),
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                  size: 22,
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  'MaternalCare Dashboard',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                // USER INFO (Naa sa TUO)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.2),
                                      width: 1,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.white
                                                .withOpacity(0.5),
                                            width: 2,
                                          ),
                                        ),
                                        child: CircleAvatar(
                                          radius: 14,
                                          backgroundColor:
                                              Colors.white.withOpacity(0.3),
                                          child: Text(
                                            username.isNotEmpty
                                                ? username[0].toUpperCase()
                                                : 'M',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        username,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // DASHBOARD BODY
                      Expanded(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.all(isDesktop ? 40 : 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // WELCOME BANNER
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 15,
                                    sigmaY: 15,
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(30),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.15),
                                      borderRadius:
                                          BorderRadius.circular(20),
                                      border: Border.all(
                                        color:
                                            Colors.white.withOpacity(0.3),
                                        width: 1.5,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              Colors.black.withOpacity(0.1),
                                          blurRadius: 30,
                                          offset: const Offset(0, 15),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Hello, $username! 👋',
                                                style: const TextStyle(
                                                  fontSize: 26,
                                                  fontWeight:
                                                      FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                "Stay healthy and strong for you and your baby.",
                                                style: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.85),
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (isDesktop)
                                          Icon(
                                            Icons.favorite,
                                            size: 80,
                                            color: Colors.white
                                                .withOpacity(0.3),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),

                              // OVERVIEW TITLE
                              const Text(
                                'Your Health Overview',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 16),

                              // STAT CARDS (Maternal Health)
                              GridView.count(
                                shrinkWrap: true,
                                physics:
                                    const NeverScrollableScrollPhysics(),
                                crossAxisCount: isDesktop ? 4 : 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                childAspectRatio: 1.3,
                                children: const [
                                  _StatCard(
                                    icon: Icons.calendar_today,
                                    label: 'Check-ups',
                                    value: '0',
                                  ),
                                  _StatCard(
                                    icon: Icons.event,
                                    label: 'Appointments',
                                    value: '0',
                                  ),
                                  _StatCard(
                                    icon: Icons.pregnant_woman,
                                    label: 'Weeks Pregnant',
                                    value: '0',
                                  ),
                                  _StatCard(
                                    icon: Icons.folder,
                                    label: 'Records',
                                    value: '0',
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),

                              // QUICK ACTIONS TITLE
                              const Text(
                                'Quick Actions',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 16),

                              // MENU CARDS (Maternal Health)
                              GridView.count(
                                shrinkWrap: true,
                                physics:
                                    const NeverScrollableScrollPhysics(),
                                crossAxisCount: isDesktop ? 4 : 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                childAspectRatio: 1.3,
                                children: [
                                  _MenuCard(
                                    icon: Icons.calendar_today,
                                    label: 'Book Appointment',
                                    onTap: () {},
                                  ),
                                  _MenuCard(
                                    icon: Icons.medical_services,
                                    label: 'Health Records',
                                    onTap: () {},
                                  ),
                                  _MenuCard(
                                    icon: Icons.child_care,
                                    label: 'Baby Tracker',
                                    onTap: () {},
                                  ),
                                  _MenuCard(
                                    icon: Icons.restaurant,
                                    label: 'Nutrition Guide',
                                    onTap: () {},
                                  ),
                                  _MenuCard(
                                    icon: Icons.notifications,
                                    label: 'Reminders',
                                    onTap: () {},
                                  ),
                                  _MenuCard(
                                    icon: Icons.chat,
                                    label: 'Ask a Doctor',
                                    onTap: () {},
                                  ),
                                  _MenuCard(
                                    icon: Icons.health_and_safety,
                                    label: 'Health Tips',
                                    onTap: () {},
                                  ),
                                  _MenuCard(
                                    icon: Icons.emergency,
                                    label: 'Emergency',
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// SIDEBAR ITEM (GLASS)
class _SidebarItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _SidebarItem({
    required this.icon,
    required this.label,
    this.selected = false,
    required this.onTap,
  });

  @override
  State<_SidebarItem> createState() => _SidebarItemState();
}

class _SidebarItemState extends State<_SidebarItem> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: widget.selected
                ? Colors.white.withOpacity(0.25)
                : _isHovering
                    ? Colors.white.withOpacity(0.15)
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: widget.selected
                ? Border.all(
                    color: Colors.white.withOpacity(0.3),
                    width: 1,
                  )
                : null,
          ),
          child: Row(
            children: [
              Icon(widget.icon, color: Colors.white, size: 22),
              const SizedBox(width: 14),
              Text(
                widget.label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// STAT CARD (GLASS)
class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 1.5,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: Colors.white, size: 20),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      value,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 2),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      label,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// MENU CARD (GLASS)
class _MenuCard extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _MenuCard({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  State<_MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<_MenuCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      cursor: SystemMouseCursors.click,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: _isHovering
                  ? Colors.white.withOpacity(0.25)
                  : Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(_isHovering ? 0.2 : 0.05),
                  blurRadius: _isHovering ? 20 : 10,
                  offset: Offset(0, _isHovering ? 8 : 4),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: widget.onTap,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        widget.icon,
                        size: 26,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 8.0),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          widget.label,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}