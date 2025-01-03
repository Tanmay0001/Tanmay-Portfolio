

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hiteshsapra/theme/image_assets.dart';
import 'package:hiteshsapra/widget/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class AchievementsTab extends StatelessWidget {
  const AchievementsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = Responsive.isMobile(context);

    // final domainList = [
    //   {"image": 'assets/images/Udemy.jpg', "url": "https://patelwala.com"},
    //   {"image": ImageAssets.icBujex, "url": "https://bujex.com"},
    //   {"image": ImageAssets.icNearfact, "url": "https://nearfact.com"},
    //   {"image": ImageAssets.icKeyvacy, "url": "https://keyvacy.com"},
    //   {"image": ImageAssets.icBoxoffice, "url": "https://boxofficemovi.com"},
    //   {"image": ImageAssets.icStudyza, "url": "https://studyza.com"},
    //   {"image": ImageAssets.icOnemindev, "url": "https://onemindev.com"},
    //   {"image": ImageAssets.icBhasha, "url": "https://hibhasha.com"},
    // ];

    final certficateitem = [
     {
        "title": "Mobile App Development",
        "icon":'assets/images/IMG-20230429-WA0053.jpg',
      },
       {
        "title": "Mobile App Development",
        "icon":'assets/images/CertificateOfCompletion_Career Essentials in Generative AI by Microsoft and LinkedIn_page-0001.jpg',
      },
       {
        "title": "Mobile App Development",
        "icon":'assets/images/Deep Learning.jpg',
      },
       {
        "title": "Mobile App Development",
        "icon":'assets/images/Udemy.jpg',
      },
      
      
    ];
       final acchieveItem = [
     {
        "title": "Mobile App Development",
        "icon":'assets/images/DRDO.jpg',
      },
       {
        "title": "Mobile App Development",
        "icon":'assets/images/IMG-20230404-WA0003.jpg',
      },
       {
        "title": "Mobile App Development",
        "icon":'assets/images/IMG_20241215_233723.jpg',
      },
       {
        "title": "Mobile App Development",
        "icon":'assets/images/IMG_20241215_233723.jpg',
      },
       {
        "title": "Mobile App Development",
        "icon":'assets/images/IMG-20210811-WA0044.jpg',
      }, {
        "title": "Mobile App Development",
        "icon":'assets/images/IMG_20241215_233812.jpg',
      },
      
      
    ];

 Widget buildGridItem(Map<String, dynamic> item) {
  final iconPath = item['icon'] as String?; // Safely cast to String
  final name = item['name'] as String?; // Safely cast to String

  return Container(
    width: 400,
    padding: const EdgeInsets.all(16),
    margin: EdgeInsets.only(bottom: isMobile ? 16 : 0),
    decoration: BoxDecoration(
      color: theme.secondaryHeaderColor,
      borderRadius: BorderRadius.circular(16),
      image: iconPath != null
          ? DecorationImage(
              image: AssetImage(iconPath),
              fit: BoxFit.fill, // Ensures the image covers the entire container
            )
          : null, // If iconPath is null, no image is set
    ),
  
  );
}


    Widget buildTextSection(double fontSize, TextAlign textAlign) {
      return Column(
        crossAxisAlignment: textAlign == TextAlign.center
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Text(
            'Achievements',
            textAlign: textAlign,
            style: theme.textTheme.titleSmall!
                .copyWith(fontSize: fontSize * 1.2, color: theme.primaryColor),
          ),
         
        
        ],
      );
    }

Widget buildHorizontalListView() {
  final ScrollController scrollController = ScrollController();

  return ListView.builder(
     physics: BouncingScrollPhysics(),
   
    scrollDirection: Axis.horizontal, // Horizontal scrolling
    itemCount: certficateitem.length,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: buildGridItem(certficateitem[index]),
      );
    },
  );
}

Widget buildListView() {
  return ListView.builder(
    physics: BouncingScrollPhysics(),
    itemCount: certficateitem.length,
    itemBuilder: (context, index) {
      return buildGridItem(certficateitem[index]);
    },
  );
}


    Widget buildTableItem(Map<String, String> item) {
      return GestureDetector(
        onTap: () async {
          final url = Uri.parse(item["url"]!);
          if (await canLaunchUrl(url)) {
            await launchUrl(url);
          } else {
            throw 'Could not launch $url';
          }
        },
        child: Container(
          height: 500,
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor.withOpacity(0.70),
            border: Border.all(color: theme.dividerColor),
          ),
          child: Center(
            child: Image.asset(item["image"]!),
          ),
        ),
      );
    }

    // Widget buildTable(int crossAxisCount) {
    //   return GridView.builder(
    //     shrinkWrap: true,
    //     physics: const NeverScrollableScrollPhysics(),
    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: crossAxisCount,
    //       crossAxisSpacing: 0,
    //       mainAxisSpacing: 0,
    //       childAspectRatio: isMobile ? 2.5 : 3.5,
    //     ),
    //     itemCount: domainList.length,
    //     itemBuilder: (context, index) {
    //       return buildTableItem(domainList[index]);
    //     },
    //   );
    // }

    Widget buildDomainLayout() {
      return Row(
        children: [
          if (!isMobile) const Expanded(flex: 1, child: SizedBox()),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Text(
                  'Domain Services',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleSmall!
                      .copyWith(fontSize: 20 * 1.2, color: theme.primaryColor),
                ),
                Text(
                  'We are ready to offer our premium park domain for sale.',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleSmall!
                      .copyWith(fontSize: 20 * 2, color: theme.highlightColor),
                ),
              ],
            ),
          ),
          if (!isMobile) const Expanded(flex: 1, child: SizedBox()),
        ],
      );
    }

    Widget buildMobileLayout() {
      return Column(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Image.asset(ImageAssets.ic5),
              ),
              Positioned(
                bottom: 1,
                right: 1,
                child: Image.asset(ImageAssets.ic16),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    buildTextSection(20, TextAlign.center),
                    const SizedBox(height: 20),
                    buildHorizontalListView(),
                    const SizedBox(height: 40),
                    buildDomainLayout(),
                    const SizedBox(height: 20),
                    //buildTable(2),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    }

   Widget buildTabletLayout() {
  return Column(
    children: [
      Stack(
        children: [
          Positioned(
            top: 100,
            left: 1,
            child: Image.asset(ImageAssets.ic5),
          ),
          Positioned(
            bottom: 20,
            right: 1,
            child: Image.asset(ImageAssets.ic16),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 150, right: 150, top: 150, bottom: 40),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(flex: 1, child: SizedBox()),
                    Expanded(
                      flex: 2,
                      child: buildTextSection(24, TextAlign.center),
                    ),
                    const Expanded(flex: 1, child: SizedBox()),
                  ],
                ),
                const SizedBox(height: 30),
                 Align(
                  alignment: Alignment.centerLeft,
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text(
                                 'Certifications',
                                
                                 style: theme.textTheme.titleSmall!
                                     .copyWith(fontSize: 24, color: theme.highlightColor),
                               ),
                   ),
                 ),
                // Ensure buildHorizontalListView has space
                SizedBox(
                  height: 300, // Set height for the ListView
                  child: buildHorizontalListView(),
                ),
                
                const SizedBox(height: 40),
                // Add more widgets or space as needed
                // buildDomainLayout(),
                // const SizedBox(height: 20),
                // buildTable(4),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}


    return Container(
      color: theme.scaffoldBackgroundColor,
      child: Responsive(
        mobile: buildMobileLayout(),
        tablet: buildTabletLayout(),
      ),
    );
  }
}
