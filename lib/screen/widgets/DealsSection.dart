import 'package:flutter/material.dart';
import 'package:walkin/Model/dashboardModel.dart';

class DealsSectionWidget extends StatelessWidget {
  final DealsSection dealsSection;
  const DealsSectionWidget({super.key, required this.dealsSection});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                dealsSection.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Icon(Icons.arrow_forward),
          ],
        ),

        SizedBox(height: 15),
        dealsSection.isGridList
            ? GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: dealsSection.deal.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            crossAxisCount: 2,
          ),
          itemBuilder: (context, i) {
            Deal deal = dealsSection.deal[i];
            return itemCard(
              ctx: context,
              image: deal.image,
              title: deal.title,
              discount: deal.discount,
              price: deal.price,
            );
          },
        )
            : SizedBox(
          height: MediaQuery.sizeOf(context).height / 4.5,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: dealsSection.deal.length,
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, i) {
              Deal deal = dealsSection.deal[i];
              return itemCard(
                ctx: context,
                image: deal.image,
                title: deal.title,
                discount: deal.discount,
                price: deal.price,
              );
            },
          ),
        ),
        SizedBox(height: 15,),
      ],
    );
  }

  Widget itemCard({
    required BuildContext ctx,
    required String image,
    required String title,
    required String discount,
    required String price,
  }) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: MediaQuery.sizeOf(ctx).width / 1.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Color(0xFFF1EEEA),
        // color: Color(0xD3D1F0FF),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(ctx).height / 7,
            child: Image.asset(image),
          ),
          Text(
            title,

            style: const TextStyle(
              color: Colors.black,
              //fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.3,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Container(
            // height: 40,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.yellow),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                Text(
                  discount,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),

                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    fontWeight: FontWeight.normal,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
