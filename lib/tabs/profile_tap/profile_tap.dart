import 'package:flutter/material.dart';
import '../../core/appImage.dart';
import '../../items/language/language_bottom_sheet.dart';
import '../../l10n/app_localizations.dart';
import 'model_profile.dart';

class ProfileTap extends StatelessWidget {
  const ProfileTap({super.key});

  static const String routName = "ProfileTap";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: height * 0.06),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage(Appimage.profileImage),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: height * 0.02,
                  bottom: height * 0.006,
                ),
                child: Text(
                  "Abdelrahman Ayman",
                  style: Theme.of(context).textTheme.bodyLarge
                ),
              ),
              Text(
                "abdelrahmanayman.route@gmail.com",
                style: Theme.of(context).textTheme.bodySmall
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.05),
                child: Column(
                  spacing: 16,
                  children: [
                    Model_profile(
                      isIcon: false,
                      icon: Icons.arrow_forward_ios_sharp,
                      function: themeshow,
                      label: AppLocalizations.of(context)!.theme,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    Model_profile(
                      isIcon: true,
                      icon: Icons.arrow_forward_ios_sharp,
                      function: showLanguageBottomSheet,
                      label: AppLocalizations.of(context)!.language,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    Model_profile(
                      isIcon: true,
                      icon: Icons.logout,
                      function: showLanguageBottomSheet,
                      label: AppLocalizations.of(context)!.logout,
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void themeshow(BuildContext) {}

  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageBottomSheet(),
    );
  }
}
