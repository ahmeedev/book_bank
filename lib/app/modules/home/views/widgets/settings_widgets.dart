import 'package:book_bank/app/theme/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FittedBox(
            fit: BoxFit.fill, child: Image.asset('assets/images/profile.jpeg')),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(kPadding).copyWith(top: 0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Javeria Afzal",
                style:
                    theme.textTheme.titleLarge!.copyWith(color: Colors.white),
              ),
              Text(
                "javiriaafzaldeme@gmail.com",
                style:
                    theme.textTheme.labelMedium!.copyWith(color: Colors.white),
              ),
              const Spacer(),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(children: [
                  Container(
                      color: theme.colorScheme.surface,
                      padding: const EdgeInsets.all(kPadding),
                      child: Icon(
                        Icons.facebook,
                        color: theme.colorScheme.onSurface,
                      )).cornerRadius(kRadius),
                  kWidth,
                  Container(
                      color: theme.colorScheme.surface,
                      padding: const EdgeInsets.all(kPadding),
                      child: Icon(
                        Icons.facebook,
                        color: theme.colorScheme.onSurface,
                      )).cornerRadius(kRadius),
                  kWidth,
                  Container(
                      color: theme.colorScheme.surface,
                      padding: const EdgeInsets.all(kPadding),
                      child: Icon(
                        Icons.facebook,
                        color: theme.colorScheme.onSurface,
                      )).cornerRadius(kRadius),
                ]),
              )
            ]),
          ),
        )
      ],
    ).cornerRadius(kRadius);
  }
}

class SettingsTiles extends StatelessWidget {
  const SettingsTiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Container(
        // padding: const EdgeInsets.symmetric(vertical: kPadding),
        color: theme.colorScheme.background,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            _buildTile(theme,
                name: "Your Books", icon: Icons.book, onTap: () {}),
            _buildTile(theme,
                name: "Your History", icon: Icons.history, onTap: () {}),
            _buildTile(theme,
                name: "Sign Out", icon: Icons.person, onTap: () {}),
          ],
        ),
      ),
    );
  }

  InkWell _buildTile(ThemeData theme,
      {required String name, required IconData icon, required onTap}) {
    return InkWell(
      onTap: onTap,
      child: Card(
        // color: theme.colorScheme.onSurface,
        child: ListTile(
          leading: Icon(
            icon,
            color: theme.colorScheme.primary,
          ),
          title: Text(
            name,
            style: theme.textTheme.titleMedium!.copyWith(
                color: theme.colorScheme.primary, fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}
