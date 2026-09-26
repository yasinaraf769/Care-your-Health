import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../utils/responsive.dart';

class ResponsiveScaffold extends StatelessWidget {
  const ResponsiveScaffold({
    required this.title,
    this.body,
    super.key,
  });

  final String title;

// The page content is optional for now.
// Some screens are still under development.
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    // Check the current screen size.
    final bool isDesktop = Responsive.isDesktop(context);
    final bool isTablet = Responsive.isTablet(context);

    // Desktop and tablet use the permanent sidebar.
    if (isDesktop || isTablet) {
      return _buildDesktopLayout(context);
    }

    // Mobile uses a Drawer instead of a permanent sidebar.
    return _buildMobileLayout(context);
  }

  // ----------------------------------------------------------
  // DESKTOP + TABLET LAYOUT
  // ----------------------------------------------------------
  Widget _buildDesktopLayout(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: Row(
        children: [
          // Left side of the application.
          // This is our permanent sidebar.
          _buildSidebar(context),

          // The Expanded widget takes all remaining space.
          Expanded(
            child: Column(
              children: [
                // Top header of the dashboard.
                _buildHeader(context),

                // The page content goes here.
                Expanded(
                  child:body ??
                      const Center(
                        child: Text(
                          'Page Content',
                        ),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ----------------------------------------------------------
  // MOBILE LAYOUT
  // ----------------------------------------------------------
  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      // On mobile, the sidebar is hidden inside a Drawer.
      drawer: Drawer(
        backgroundColor: AppColors.white,

        child: SafeArea(
          child: _buildSidebar(context),
        ),
      ),

      // Mobile gets a normal AppBar.
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,

        // The hamburger menu opens the Drawer.
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              color: AppColors.darkNavy,
              onPressed: () {
                // Open the mobile sidebar.
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),

        // Current page title.
        title: Text(
          title,
          style: AppTextStyles.title2,
        ),

        // Notification icon.
        actions: [
          IconButton(
            onPressed: () {
              // We will connect notifications later.
            },
            icon: const Icon(Icons.notifications_none),
            color: AppColors.darkNavy,
          ),

          const SizedBox(width: 8),
        ],
      ),

      // Dashboard content.
      body: body ??
          const Center(
            child: Text(
              'Page Content',
            ),
          ),
    );
  }

  // ----------------------------------------------------------
  // SIDEBAR
  // ----------------------------------------------------------
  Widget _buildSidebar(BuildContext context) {
    return Container(
      width: 240,

      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(
          right: BorderSide(
            color: AppColors.border,
          ),
        ),
      ),

      child: Column(
        children: [
          // --------------------------------------------------
          // LOGO AREA
          // --------------------------------------------------
          Container(
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 20),

            child: Row(
              children: [
                // Temporary logo container.
                // Later we can replace this with your actual
                // hospital logo/icon package.
                Container(
                  width: 38,
                  height: 38,

                  decoration: BoxDecoration(
                    color: AppColors.lightPrimary,
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: const Icon(
                    Icons.local_hospital_outlined,
                    color: AppColors.primary,
                  ),
                ),

                const SizedBox(width: 12),

                // Application name.
                Expanded(
                  child: Text(
                    'Hospital',
                    style: AppTextStyles.title2,
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1),

          // --------------------------------------------------
          // MENU ITEMS
          // --------------------------------------------------
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 16,
              ),

              child: Column(
                children: [
                  _buildMenuItem(
                    icon: Icons.dashboard_outlined,
                    title: 'Dashboard',
                    isSelected: true,
                  ),

                  _buildMenuItem(
                    icon: Icons.medical_services_outlined,
                    title: 'Doctor',
                  ),

                  _buildMenuItem(
                    icon: Icons.people_outline,
                    title: 'Nurse',
                  ),

                  _buildMenuItem(
                    icon: Icons.person_outline,
                    title: 'Patient',
                  ),

                  _buildMenuItem(
                    icon: Icons.local_pharmacy_outlined,
                    title: 'Pharmacist',
                  ),

                  _buildMenuItem(
                    icon: Icons.business_outlined,
                    title: 'FM',
                  ),

                  _buildMenuItem(
                    icon: Icons.assessment_outlined,
                    title: 'Report',
                  ),

                  const SizedBox(height: 20),

                  // Appearance section.
                  _buildMenuItem(
                    icon: Icons.dark_mode_outlined,
                    title: 'Dark Mode',
                  ),
                ],
              ),
            ),
          ),

          // --------------------------------------------------
          // SIDEBAR BOTTOM
          // --------------------------------------------------
          Container(
            padding: const EdgeInsets.all(16),

            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: AppColors.border,
                ),
              ),
            ),

            child: Row(
              children: [
                // Admin avatar.
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.lightBlue,
                  child: const Icon(
                    Icons.person_outline,
                    color: AppColors.secondary,
                  ),
                ),

                const SizedBox(width: 10),

                // Admin information.
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Admin',
                        style: AppTextStyles.bodyMedium,
                      ),

                      const SizedBox(height: 2),

                      Text(
                        'Administrator',
                        style: AppTextStyles.caption,
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

  // ----------------------------------------------------------
  // SIDEBAR MENU ITEM
  // ----------------------------------------------------------
  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    bool isSelected = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),

      decoration: BoxDecoration(
        // Selected menu gets a light primary background.
        color: isSelected
            ? AppColors.lightPrimary
            : Colors.transparent,

        borderRadius: BorderRadius.circular(8),
      ),

      child: ListTile(
        dense: true,

        // Removes default ListTile spacing.
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),

        // Menu icon.
        leading: Icon(
          icon,
          size: 21,
          color: isSelected
              ? AppColors.primary
              : AppColors.grayBlue,
        ),

        // Menu title.
        title: Text(
          title,
          style: AppTextStyles.bodyMedium.copyWith(
            color: isSelected
                ? AppColors.primary
                : AppColors.gray,
          ),
        ),

        onTap: () {
          // Navigation will be connected with GoRouter later.
        },
      ),
    );
  }

  // ----------------------------------------------------------
  // TOP HEADER
  // ----------------------------------------------------------
  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 72,

      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),

      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(
          bottom: BorderSide(
            color: AppColors.border,
          ),
        ),
      ),

      child: Row(
        children: [
          // Current page title.
          Text(
            title,
            style: AppTextStyles.title1,
          ),

          const Spacer(),

          // Search box.
          SizedBox(
            width: 260,
            height: 40,

            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',

                hintStyle: AppTextStyles.body14.copyWith(
                  color: AppColors.grayBlue,
                ),

                prefixIcon: const Icon(
                  Icons.search,
                  size: 20,
                  color: AppColors.grayBlue,
                ),

                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                ),
              ),
            ),
          ),

          const SizedBox(width: 16),

          // Notification button.
          IconButton(
            onPressed: () {
              // Notification functionality will be added later.
            },
            icon: const Icon(
              Icons.notifications_none,
            ),
            color: AppColors.darkNavy,
          ),

          // Settings button.
          IconButton(
            onPressed: () {
              // Settings navigation will be added later.
            },
            icon: const Icon(
              Icons.settings_outlined,
            ),
            color: AppColors.darkNavy,
          ),

          const SizedBox(width: 8),

          // Admin profile.
          CircleAvatar(
            radius: 19,
            backgroundColor: AppColors.lightBlue,
            child: const Icon(
              Icons.person_outline,
              color: AppColors.secondary,
            ),
          ),
        ],
      ),
    );
  }
}