import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:push_kyc/app/core/themes/app_theme.dart';
import 'package:push_kyc/app/features/home/presentation/pages/dashboard_page.dart';
import 'package:push_kyc/app/features/home/presentation/components/get_started_card.dart';
import 'package:push_kyc/app/features/personnal_information/presentation/pages/personnal_information_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String name = 'HOME_PAGE';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logo.png', width: 65),
        backgroundColor: CupertinoColors.extraLightBackgroundGray,
        actions: [
          Builder(
            builder:
                (context) => IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.bars,
                    color: AppTheme.kPrimaryDark,
                    size: 28,
                  ), // custom icon
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                ),
          ),
        ],
      ),
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      endDrawer: const Drawer(),
      body: CustomScrollView(
        slivers: [
          const SliverGap(100),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            sliver: SliverToBoxAdapter(
              child: GetStartedCard(
                onTap: () {
                  context.pushNamed(PersonnalInformationPage.name);
                },
              ),
            ),
          ),
        ],
      ),
      //body: const DashboardPage(),
    );
  }
}
