

import 'dart:convert';
import 'package:flutter/services.dart';

class DashboardModel {
  List<String> layoutOrder;
  final BannerSection bannerSection;
  final CategorySection categorySection;

  final OffersSection offersSection;
  final DealsSection dealsSection;
  DashboardModel({
    required this.layoutOrder,
    required this.bannerSection,
    required this.categorySection,

    required this.offersSection,
    required this.dealsSection,
  });



  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      layoutOrder: List<String>.from(json['layout_order']),
      bannerSection: BannerSection.fromJson(json['banner_section']),
      categorySection: CategorySection.fromJson(json['category_section']),
      offersSection: OffersSection.fromJson(json['offers_section']),
      dealsSection: DealsSection.fromJson(json['deals_section']),
    );
  }

  static Future<DashboardModel> loadFromAssets() async {
    final data = await rootBundle.loadString('lib/jsonfile/dashboard.json');
    final jsonResult = json.decode(data);
    return DashboardModel.fromJson(jsonResult);
  }
}

class BannerSection {
  final String discountText;
  final String subText;
  final String buttonText;
  final int backgroundColor;
  final int textColor;
  List<String> image;

  BannerSection({
    required this.discountText,
    required this.subText,
    required this.buttonText,
    required this.backgroundColor,
    required this.textColor,
    required this.image,
  });

  factory BannerSection.fromJson(Map<String, dynamic> json) {
    return BannerSection(
      discountText: json['discount_text'],
      subText: json['sub_text'],
      buttonText: json['button_text'],
      backgroundColor: int.parse(json['background_color']),
      textColor: int.parse(json['text_color']),
      image: List<String>.from(json['images']),
    );
  }
}

class CategorySection {
  final String title;
  final int backgroundColor;
  final int textColor;
  final int textSize;
  final int iconSize;
  final int gridCount;
  final List<CategoryItem> categories;

  CategorySection({
    required this.title,
    required this.backgroundColor,
    required this.textColor,
    required this.textSize,
    required this.gridCount,
    required this.iconSize,

    required this.categories,
  });

  factory CategorySection.fromJson(Map<String, dynamic> json) {
    return CategorySection(
      title:  json['title'],
      backgroundColor: int.parse(json['background_color']),
      textColor: int.parse(json['text_color']),
      textSize: json['text_Size'],
      gridCount: json['grid_count'],
      iconSize: json['icons_size'],
      categories: List<CategoryItem>.from(
        json['categories'].map((x) => CategoryItem.fromJson(x)),
      ),
    );
  }
}

class CategoryItem {
  final String name;
  final String icon;
  final bool offerAlert;
  final String offerAlertTsg;
  final int alertColor;

  CategoryItem({
    required this.name,
    required this.icon,
    required this.offerAlert,
    required this.offerAlertTsg,
    required this.alertColor,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      name: json['name'],
      icon: json['icon'],
      offerAlert: json['offer_alert'],
      offerAlertTsg: json['offer_alert_tsg'],
      alertColor: int.parse(json['alert_color']),
    );
  }
}









class OffersSection {
  final String title;
   List<Offer> offer;

  OffersSection({
    required this.title,
    required this.offer,
  });

  factory OffersSection.fromJson(Map<String, dynamic> json) {
    return OffersSection(
      title:  json['title'],
      offer: List<Offer>.from(
        json['offers'].map((x) => Offer.fromJson(x)),
      ),
    );
  }
}

class Offer {
  final String text;
  final String subText;

  Offer({
    required this.text,
    required this.subText,
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      text: json['text'],
      subText: json['sub_text'],
    );
  }
}

class DealsSection {
  final String title;
  final bool isGridList;
  List <Deal> deal;


  DealsSection({
    required  this.isGridList,
    required  this.title,
    required this.deal,

  });

  factory DealsSection.fromJson(Map<String, dynamic> json) {
    return DealsSection(
      isGridList: json['isGridList'],
      title: json['title'],
      deal: List<Deal>.from(
        json['deals'].map((x) => Deal.fromJson(x)),
      ),
    );
  }
}

class Deal {
  final String image;
  final String title;
  final String discount;
  final String price;

  Deal({
    required this.image,
    required this.title,
    required this.discount,
    required this.price,
  });

  factory Deal.fromJson(Map<String, dynamic> json) {
    return Deal(
      image: json['image'],
      title: json['title'],
      discount: json['discount'],
      price: json['price'],
    );
  }
}
