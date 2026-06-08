import 'package:flutter/material.dart';

import 'package:propix8/core/utils/context_extensions.dart';

/// A separate widget for the BottomNavigationBar to reduce the size of LayoutView.
/// This widget focuses solely on the navigation UI and its items.
class MainBottomNavBar extends StatelessWidget {
  const MainBottomNavBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BottomNavigationBar(
      elevation: 5,
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: context.colorScheme.primary,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home_outlined),
          activeIcon: const Icon(Icons.home),
          label: l10n.navHome,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.business_center_outlined),
          activeIcon: const Icon(Icons.business_center),
          label: l10n.navServices,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.favorite_outline),
          activeIcon: const Icon(Icons.favorite),
          label: l10n.navFavorites,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person_outline),
          activeIcon: const Icon(Icons.person),
          label: l10n.navProfile,
        ),
      ],
    );
  }
}
