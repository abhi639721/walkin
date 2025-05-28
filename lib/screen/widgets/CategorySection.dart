
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:walkin/Model/dashboardModel.dart';


class CategorySectionWidget extends StatelessWidget {
  final CategorySection categoryData;
   CategorySectionWidget({super.key, required this.categoryData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(categoryData.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: categoryData.categories.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            crossAxisCount: categoryData.gridCount,
          ),
          itemBuilder:
              (context, i) => categoryCard(
                ctx: context,
              imgIcon: categoryData.categories[i].icon,
              name: categoryData.categories[i].name,
              alertName: categoryData.categories[i].offerAlertTsg,
              alert: categoryData.categories[i].offerAlert,
              alertColor:  categoryData.categories[i].alertColor,
                  gridCount: categoryData.gridCount
          ),
        ),
      ],
    );
  }

  Widget categoryCard({
    required BuildContext ctx,

    required String imgIcon,
    required String name,
    required String alertName,
    required bool alert,
    required int alertColor,
    required int gridCount,

  }) {
    return Card(
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(22)),
      shadowColor: Color(0xFFAEE5FF),
      color: Colors.white,
      child: Stack(
        alignment: Alignment.center,

        children: [

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                imgIcon,

                height: MediaQuery.sizeOf(ctx).height/(gridCount*5),
                width: MediaQuery.sizeOf(ctx).height/(gridCount*5),
              ),
              SizedBox(height: 8.0 + (4 - gridCount) * 2),
                       Text(name,
                       overflow: TextOverflow.ellipsis,
                       maxLines: 1,
                       textAlign: TextAlign.center,style: TextStyle(
                 letterSpacing: 0.4,fontWeight: FontWeight.bold),),
            ],
          ),
          if (alert)
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                color: Color(alertColor),
                padding: EdgeInsets.symmetric(horizontal: 3),
                child: Text(alertName, style: TextStyle(letterSpacing: 0.3),),
              ),
            ),
        ],
      ),
    );
  }
}
