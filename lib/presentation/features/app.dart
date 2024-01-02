// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:veegil_bank_app/core/core_widgets/custom_app_bar.dart';
import 'package:veegil_bank_app/presentation/features/application/analytics_bloc/analytics_bloc.dart';
import 'package:veegil_bank_app/presentation/features/application/authentication_bloc/authentication_bloc.dart';
import 'package:veegil_bank_app/presentation/features/application/dashboard_bloc/dashboard_bloc.dart';
import 'package:veegil_bank_app/presentation/features/application/transactions_bloc/transactions_bloc.dart';
import 'package:veegil_bank_app/presentation/features/infrastructure/authentication/authentication_repository_imp..dart';
import 'package:veegil_bank_app/presentation/features/infrastructure/data_from_database/data_from_database_repository_imp.dart';
import 'package:veegil_bank_app/presentation/features/infrastructure/transactions/transaction_repository_imp.dart';
import 'package:veegil_bank_app/presentation/features/presentation/authentication/sign_up/sign_up_page.dart';
import 'package:veegil_bank_app/presentation/features/presentation/dashboard/dashboard.dart';
import 'package:veegil_bank_app/presentation/features/presentation/perfomance_analytics_view/performance_analytics_view.dart';
import 'package:veegil_bank_app/presentation/features/presentation/transaction_view/transaction_view.dart';

class VeegilApp extends StatelessWidget {
  const VeegilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationRepositoryImp>(
          create: (context) => AuthenticationRepositoryImp(),
        ),
        RepositoryProvider<TransactionRepositoryImp>(
          create: (context) => TransactionRepositoryImp(),
        ),
        RepositoryProvider<DataFromDataBaseModelImp>(
          create: (context) => DataFromDataBaseModelImp(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
            create: (BuildContext context) => AuthenticationBloc(
              authenticationRepositoryImp: AuthenticationRepositoryImp(),
            ),
          ),
          BlocProvider<DashboardBloc>(
            create: (BuildContext context) => DashboardBloc(
              dataFromDataBaseModelImp: DataFromDataBaseModelImp(),
            ),
          ),
          BlocProvider<TransactionsBloc>(
            create: (BuildContext context) => TransactionsBloc(
              transactionRepositoryImp: TransactionRepositoryImp(),
            ),
          ),
          BlocProvider<AnalyticsBloc>(
            create: (BuildContext context) => AnalyticsBloc(),
          ),
        ],
        child: MaterialApp(
          title: 'Veegil bank app',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            // bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Colors.blue)
          ),
          home: const SignupPage(),
        ),
      ),
    );
  }
}

class VeegilAppView extends StatefulWidget {
  const VeegilAppView({
    super.key,

  });


  @override
  State<VeegilAppView> createState() => _VeegilAppViewState();
}

class _VeegilAppViewState extends State<VeegilAppView> {
  final PageController _pageController = PageController();
  late Color themeColor = Color(0xFF8FF6E2);
  int index = 0;
  @override
  Widget build(BuildContext context) {
    // themeColor = Theme.of(context).colorScheme.inversePrimary;
    return Scaffold(
      backgroundColor:
          themeColor, //Theme.of(context).colorScheme.inversePrimary,

      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
              switch (index) {
                case 0:
                  themeColor = Color.fromARGB(255, 143, 246, 226);
                  print(themeColor);

                case 1:
                  themeColor = Theme.of(context).colorScheme.inversePrimary;
                  print(themeColor);
                case 2:
                  themeColor = Colors.green;
                  print(themeColor);
              }
            });
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut);
          },
          selectedItemColor: themeColor,
          unselectedItemColor: Colors.orange,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.arrow_up_right),
              label: "Transactions",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chart_bar),
              label: "Analytics",
            ),
          ]),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            title: CustomAppBar(),
          ),
          SliverFillRemaining(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: const [
                MyHomePage(),
                TransactionsView(),
                PerformanceAnalyticsView(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
