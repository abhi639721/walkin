import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walkin/logic/provider/dashboardProvider.dart';
import 'package:walkin/screen/widgets/CategorySection.dart';
import 'package:walkin/screen/widgets/DealsSection.dart';
import 'package:walkin/screen/widgets/crouselSlider.dart';
import 'package:walkin/screen/widgets/offerSection.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<DashboardProvider>(context, listen: false).loadDashboardData();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DashboardProvider>(context);
    final data = provider.dashboardModel;

    if (data == null) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
   // final categories = data.categorySection.categories;

    List<Widget> widgetList = [];

    for (String section in data.layoutOrder) {
      switch (section) {
        case 'banner_section':
          widgetList.add(
            CarouselSliderWidget(bannerSection: data.bannerSection),
          );
          break;
        case 'offers_section':
          widgetList.add(OfferSectionWidget(offerList: data.offersSection));
          break;
        case 'category_section':
          widgetList.add(
            CategorySectionWidget(categoryData: data.categorySection),
          );
          break;
        case 'deals_section':
          widgetList.add(DealsSectionWidget(dealsSection: data.dealsSection));
          break;
      }
    }

    return ListView(
      padding: EdgeInsets.all(15),
      physics: ClampingScrollPhysics(),
      children: widgetList,
    );
  }
}
