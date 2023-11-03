import 'dart:ui';

import 'package:app_ui/app_ui.dart';
import 'package:dash_run/constants/constants.dart';
import 'package:dash_run/gen/assets.gen.dart';
import 'package:dash_run/l10n/l10n.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class GameInfoDialog extends StatelessWidget {
  const GameInfoDialog({super.key});

  static PageRoute<void> route() {
    return HeroDialogRoute(
      builder: (_) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: const GameInfoDialog(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bodyStyle = AppTextStyles.bodyLarge;
    final linkStyle = AppTextStyles.bodyLarge.copyWith(
      color: const Color(0xFF9CECCD),
      decoration: TextDecoration.underline,
    );
    return AppDialog(
      border: Border.all(color: Colors.white24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 24),
          Assets.images.gameLogo.image(width: 230),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                Text(
                  l10n.aboutSuperDash,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 24),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: bodyStyle,
                    children: [
                      TextSpan(text: l10n.learn),
                      TextSpan(
                        text: l10n.howWeBuiltSuperDash,
                        style: linkStyle,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => launchUrlString(Urls.howWeBuilt),
                      ),
                      TextSpan(
                        text: l10n.inFlutterAndGrabThe,
                      ),
                      TextSpan(
                        text: l10n.openSourceCode,
                        style: linkStyle,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => launchUrlString(Urls.githubRepo),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  l10n.otherLinks,
                  style: bodyStyle,
                ),
                const SizedBox(height: 16),
                RichText(
                  text: TextSpan(
                    text: l10n.flutterGames,
                    style: linkStyle,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => launchUrlString(Urls.flutterGames),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: l10n.privacyPolicy,
                    style: linkStyle,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => launchUrlString(Urls.privacyPolicy),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: l10n.termsOfService,
                    style: linkStyle,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => launchUrlString(Urls.termsOfService),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}