import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../core/constants/app_colors.dart';
import 'dashboard_viewmodel.dart';

class DashboardView extends StackedView<DashboardViewmodel> {
  const DashboardView({super.key});

  @override
  DashboardViewmodel viewModelBuilder(BuildContext context) =>
      DashboardViewmodel();

  @override
  void onViewModelReady(DashboardViewmodel viewModel) {
    viewModel.init();
  }

  @override
  Widget builder(
    BuildContext context,
    DashboardViewmodel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, color: AppColors.white),
        ),
        backgroundColor: AppColors.appBarHome,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: AppColors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications, color: AppColors.white),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.all(15),
        child: SingleChildScrollView(
          child: Column(children: [dashboardTitle()]),
        ),
      ),
    );
  }

  Widget dashboardTitle() {
    return Container(
      color: AppColors.appBarHome,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Dashboard",
                //for styling we can use the app style separate class from where font family all of the things can be manage due to time shortage use hardcoded
                style: TextStyle(fontSize: 14, color: AppColors.white),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "ABC",
                style: TextStyle(fontSize: 40, color: AppColors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dataTabs(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4, // Total number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Example'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: "Tab 1"),
              Tab(text: "Tab 2"),
              Tab(text: "Tab 3"),
              Tab(text: "Tab 4"),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(child: firstTabView(context)),
            const Center(child: Text("It's rainy")),
            const Center(child: Text("It's sunny")),
            const Center(child: Text("It's sunny")),
          ],
        ),
      ),
    );
  }

  Widget? firstTabView(BuildContext context) {
    return Column(
      children: [
        analyticsView(),
        // manageCards(),
        // transactionGraphView(),
        // expenseListing(),
        // analyticsView(),
      ],
    );
  }

  Widget analyticsView() {
    return Row(
      children: [
        analyticsViewData(
          analyticsTitle: "Total Spend",
          analyticsValue: "\218",
          earning1: "\$219M",
          earning2: "\$91M",
          percentage: "42%",
        ),
        analyticsViewData(
          analyticsTitle: "Maintenance Spend",
          analyticsValue: "\718",
          earning1: "\$219M",
          earning2: "\$51M",
        ),
      ],
    );
  }

  //here we can use the model class but i'm now passing 5 params
  Widget analyticsViewData({
    String? analyticsTitle,
    String? analyticsValue,
    String? earning1,
    String? earning2,
    String? percentage,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.appBarHome,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                analyticsTitle ?? "",
                style: TextStyle(
                  fontSize: 10,
                  color: AppColors.analyticsBarLabel,
                ),
              ),
              Icon(Icons.analytics),
            ],
          ),
          Text(
            analyticsValue ?? "0",
            style: TextStyle(fontSize: 16, color: AppColors.analyticsBarValue),
          ),
          Divider(color: AppColors.dividerColor),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    "Lorem",
                    style: TextStyle(
                      fontSize: 8,
                      color: AppColors.analyticsBarLabel,
                    ),
                  ),
                  Text(
                    earning1 ?? "0",
                    style: TextStyle(
                      fontSize: 8,
                      color: AppColors.analyticsBarValue,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Lorem",
                    style: TextStyle(
                      fontSize: 8,
                      color: AppColors.analyticsBarLabel,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        earning2 ?? "0",
                        style: TextStyle(
                          fontSize: 8,
                          color: AppColors.analyticsBarValue,
                        ),
                      ),
                      if (percentage != null)
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: EdgeInsets.all(1),
                          child: Text(
                            percentage,
                            style: TextStyle(
                              fontSize: 8,
                              color: AppColors.analyticsBarPercentage,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
