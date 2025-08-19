import 'package:flutter/material.dart';

class PersonnalInformationPage extends StatefulWidget {
  const PersonnalInformationPage({super.key});
  static String name = 'PERSONNAL_INFORMATIONS_PAGE';
  @override
  State<PersonnalInformationPage> createState() =>
      _PersonnalInformationPageState();
}

class _PersonnalInformationPageState extends State<PersonnalInformationPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [SliverAppBar(title: Text('Informations personnels'))],
      ),
    );
  }
}
