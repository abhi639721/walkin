import 'package:flutter/material.dart';
import 'package:walkin/Model/dashboardModel.dart';
import 'package:walkin/generated/assets.dart';

class OfferSectionWidget extends StatelessWidget {
  final OffersSection  offerList;
  const OfferSectionWidget({super.key, required this.offerList});

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(offerList.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Icon(Icons.arrow_forward)
          ],
        ),
        SizedBox(height: 15,),
        SizedBox(
          height:  MediaQuery.sizeOf(context).height / 9,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: offerList.offer.length,
              physics: ClampingScrollPhysics(),
            itemBuilder: (context,i) {
              return Container(
                margin: EdgeInsets.only(right: 10),
                width: MediaQuery.sizeOf(context).width / 1.5,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Color(0xD3D1F0FF),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        spacing: 10,
                        children: [
                          Image.asset(
                            Assets.iconsIcRetail,
                            height: 40,
                          ),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  offerList.offer[i].text ,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                Text(
                                  offerList.offer[i].subText ,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 11,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
          ),
        ),
        SizedBox(height: 15,),
      ],
    );
  }
}
