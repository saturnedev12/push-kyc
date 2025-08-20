import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:push_kyc/app/core/themes/app_theme.dart';
import 'package:push_kyc/app/features/home/presentation/components/get_started_card.dart';
import 'package:push_kyc/app/features/home/presentation/pages/dashboard_page.dart';
import 'package:push_kyc/app/features/kyc_doc/presentation/logic/kyc_doc_cubit.dart';
import 'package:push_kyc/app/features/kyc_doc/presentation/logic/kyc_doc_state.dart';
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
    return BlocBuilder<KycDocCubit, KycDocState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Image.asset('assets/images/logo.png', width: 65),

            leading: const Padding(
              padding: EdgeInsets.only(left: 8),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://i.postimg.cc/zvQfNk8x/profil-pro.jpg',
                ),
              ),
            ),
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
          body:
              (state.alreadyStarted == true)
                  ? const DashboardPage()
                  : CustomScrollView(
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
          bottomNavigationBar: SizedBox(
            height: 80,
            child: Center(
              child: Text(
                '© 2025 Wognin Saturnin Ayoua. Tous droits réservés',
                maxLines: 1,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppTheme.kPrimaryDark,
                  fontSize: 10,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
