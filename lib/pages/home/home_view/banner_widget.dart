import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:get/get.dart';

import '../home_logic.dart';

class BannerWidget extends StatelessWidget {
  BannerWidget({Key? key}) : super(key: key);

  final logic = Get.find<HomeLogic>();
  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Obx(() => Swiper(
              loop: true,
              autoplay: true,
              autoplayDelay: 5000,
              pagination: SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.6))),
              itemCount: state.homeBannerData.length,
              index: 0,
              itemBuilder: (ctx, index) {
                return InkWell(
                    onTap: () {
                      // var banner = banners[index];
                      // Navigator.of(context).pushNamed(RouteName.articleDetail,
                      //     arguments: Article()
                      //       ..id = banner.id
                      //       ..title = banner.title
                      //       ..link = banner.url
                      //       ..collect = false);
                    },
                    child: BannerImage(state.homeBannerData[index].url ?? ""));
              },
            )));
  }
}

class BannerImage extends StatelessWidget {
  final String url;
  final BoxFit fit;

  BannerImage(this.url, {this.fit: BoxFit.fill});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: url,
        placeholder: (context, url) => Center(child: CupertinoActivityIndicator()),
        errorWidget: (context, url, error) => Icon(Icons.error),
        fit: fit);
  }
}
