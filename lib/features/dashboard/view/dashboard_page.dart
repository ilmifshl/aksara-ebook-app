import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:aksara_ebook_apps/l10n/l10n.dart';
import 'package:aksara_ebook_apps/routes/router.dart';
import 'package:iconsax/iconsax.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        ExploreRoute(),
        CartRoute(),
        ProfileRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return NavigationBar(
          selectedIndex: tabsRouter.activeIndex,
          onDestinationSelected: tabsRouter.setActiveIndex,
          destinations: [
            NavigationDestination(
              icon: const Icon(Iconsax.home_2),
              label: context.l10n.home,
            ),
            NavigationDestination(
              icon: const Icon(Iconsax.discover),
              label: context.l10n.explore,
            ),
            NavigationDestination(
              icon: const Icon(Iconsax.bag),
              label: context.l10n.cart
            ),
            NavigationDestination(
              icon: const Icon(Iconsax.user),
              label: context.l10n.profile
            ),
          ],
        );
      },
    );
  }
}
