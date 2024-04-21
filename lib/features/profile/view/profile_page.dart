import 'package:aksara_ebook_apps/shared/color_values.dart';
import 'package:aksara_ebook_apps/shared/styles.dart';
import 'package:aksara_ebook_apps/utils/extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorValues.backgroundGrey,
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            _buildTopBarWidget(),
            _buildTopProfileWidget(),
            _buildAccountSectionWidget(),
            _buildOthersSectionWidget()
          ],
        ),
      ),
    );
  }

  Widget _buildTopBarWidget() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(Styles.defaultPadding),
        child: Text(
          'Profil',
          textAlign: TextAlign.center,
          style: context.textTheme.titleLarge,
        ),
      ),
    );
  }

  Widget _buildTopProfileWidget() {
    return Container(
      alignment: AlignmentDirectional.center,
      child: Column(
        children: [
          CircleAvatar(
            radius: 48,
            backgroundImage: AssetImage('lib/assets/profile_pict.jpg'),
          ),
          SizedBox(height: Styles.contentPadding),
          Text(
            'Taufiq Hamilton',
            style: context.textTheme.titleMedium,
          ),
          Text(
            '@taufiqhmltn',
            style: context.textTheme.bodySmall,
          )
        ],
      ),
    );
  }

  Widget _buildAccountSectionWidget() {
    return Container(
      padding: EdgeInsets.all(Styles.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Akun & Keamanan',
            style: context.textTheme.titleMedium,
          ),
          SizedBox(height: Styles.contentPadding), // Add some space
          Container(
            padding: EdgeInsets.symmetric(
              vertical: Styles.contentPadding,
              horizontal: Styles.defaultPadding
            ),
            decoration: BoxDecoration(
              color: ColorValues.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align items to start and end
              children: [
                Row(
                  children: [
                    Icon(Iconsax.user, size: 28),
                    SizedBox(width: 16), // Add some space between icon and text
                    Text(
                      'Akun',
                      style: context.textTheme.bodyMediumBold,
                    ),
                  ],
                ),
                IconButton(
                  onPressed: null,
                  icon: Icon(
                    Iconsax.arrow_right_3,
                    color: ColorValues.grey80,
                    size: 32,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: Styles.contentPadding), // Add some space
          Container(
            padding: EdgeInsets.symmetric(
              vertical: Styles.contentPadding,
              horizontal: Styles.defaultPadding
            ),
            decoration: BoxDecoration(
              color: ColorValues.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align items to start and end
              children: [
                Row(
                  children: [
                    Icon(Iconsax.shield_tick, size: 28),
                    SizedBox(width: 16), // Add some space between icon and text
                    Text(
                      'Autentikasi',
                      style: context.textTheme.bodyMediumBold,
                    ),
                  ],
                ),
                IconButton(
                  onPressed: null,
                  icon: Icon(
                    Iconsax.arrow_right_3,
                    color: ColorValues.grey80,
                    size: 32,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOthersSectionWidget() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Styles.defaultPadding,
        vertical: 2
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lainnya',
            style: context.textTheme.titleMedium,
          ),
          SizedBox(height: Styles.contentPadding), // Add some space
          Container(
            padding: EdgeInsets.symmetric(
              vertical: Styles.contentPadding,
              horizontal: Styles.defaultPadding
            ),
            decoration: BoxDecoration(
              color: ColorValues.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align items to start and end
              children: [
                Row(
                  children: [
                    Icon(Iconsax.lock, size: 28),
                    SizedBox(width: 16), // Add some space between icon and text
                    Text(
                      'Kebijakan Pribadi',
                      style: context.textTheme.bodyMediumBold,
                    ),
                  ],
                ),
                IconButton(
                  onPressed: null,
                  icon: Icon(
                    Iconsax.arrow_right_3,
                    color: ColorValues.grey80,
                    size: 32,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: Styles.contentPadding), // Add some space
          Container(
            padding: EdgeInsets.symmetric(
              vertical: Styles.contentPadding,
              horizontal: Styles.defaultPadding
            ),
            decoration: BoxDecoration(
              color: ColorValues.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align items to start and end
              children: [
                Row(
                  children: [
                    Icon(Iconsax.people, size: 28),
                    SizedBox(width: 16), // Add some space between icon and text
                    Text(
                      'Tentang Kami',
                      style: context.textTheme.bodyMediumBold,
                    ),
                  ],
                ),
                IconButton(
                  onPressed: null,
                  icon: Icon(
                    Iconsax.arrow_right_3,
                    color: ColorValues.grey80,
                    size: 32,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: Styles.contentPadding), // Add some space
          Container(
            padding: EdgeInsets.symmetric(
              vertical: Styles.contentPadding,
              horizontal: Styles.defaultPadding
            ),
            decoration: BoxDecoration(
              color: ColorValues.danger50,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align items to start and end
              children: [
                // GestureDetector(
                //   onTap: () {
                //     // Navigate to the onboarding page
                //
                //     AutoRouter.of(context).push(OnboardingRoute());
                //   },
                //   child: Text('Go to Onboarding'),
                // ),
                Row(
                  children: [
                    Icon(Iconsax.logout, size: 28, color: ColorValues.white,),
                    SizedBox(width: 16), // Add some space between icon and text
                    Text(
                      'Keluar',
                      style: context.textTheme.bodyMediumBoldBright,
                    ),
                  ],
                ),
                IconButton(
                  onPressed: null,
                  icon: Icon(
                    Iconsax.arrow_right_3,
                    color: ColorValues.white,
                    size: 32,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: Styles.defaultPadding,)
        ],
      ),
    );
  }
}
