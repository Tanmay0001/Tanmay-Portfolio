

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:hiteshsapra/theme/image_assets.dart';
import 'package:hiteshsapra/widget/custom_button.dart';
import 'package:hiteshsapra/widget/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeTab extends StatelessWidget {

  const HomeTab({super.key});
    void _launchURL() async {
  const url = 'https://drive.google.com/file/d/1swdcnEdEPqhChJODKWSDVFG2hn_Av0LA/view?usp=sharing'; 
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Widget aboutButton() {
      return CustomButton(
        onPressed: () {
        _launchURL();
        },
        text: 'About Me',
        width: 230,
        height: 60,
        color: Colors.white,
        backgroundColor: theme.primaryColor,
        borderColor: theme.primaryColor,
        borderWidth: 1.0,
        borderRadius: BorderRadius.circular(30),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        textStyle: theme.textTheme.titleSmall!.copyWith(fontSize: 16),
        animationDuration: const Duration(milliseconds: 300),
        child: Row(
          children: [
            Text(
              'Download CV',
              style: theme.textTheme.titleSmall!.copyWith(fontSize: 18),
            ),
            const SizedBox(
              width: 5,
            ),
            Icon(Icons.download, color: theme.highlightColor),
          ],
        ),
      );
    }


   Widget profilePicture(double radius) {
  return Container(
    height: radius *10,
    width: radius*3,
    child: ClipOval(
clipBehavior: Clip.antiAlias,
      child: Image.asset(
        ImageAssets.avatar,
        fit: BoxFit.cover, // Ensures the image covers the circle
      ),
    ),
  );
}


    Widget aboutText(double fontSize, BuildContext context) {
      final theme = Theme.of(context);
      return Column(
        crossAxisAlignment: Responsive.isMobile(context)
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Text('Hello, I\'m',
              style: theme.textTheme.titleSmall!.merge(
                TextStyle(fontSize: fontSize * 1.2, color: theme.primaryColor),
              )),
          Text('Tanmay Mishra',
              style: theme.textTheme.titleSmall!.merge(
                TextStyle(fontSize: fontSize * 2, color: theme.highlightColor),
              )),
          Text('Machine Learning Engineer',
              textAlign: Responsive.isMobile(context)
                  ? TextAlign.center
                  : TextAlign.left,
              style: theme.textTheme.titleSmall!.merge(
                TextStyle(fontSize: fontSize * 1, color: theme.primaryColor,decoration: TextDecoration.underline,  height: 3,   decorationThickness: 0.3,
              )),),
          const SizedBox(height: 20),
          Text(
              "I'm Tanmay Mishra, a B.Tech Computer Science graduate with expertise in Machine Learning, Deep Learning, and Generative AI. Currently an ML Engineer at Kadit Innovations, I focus on applying AI/ML to real-world challenges, with hands-on experience in Handwritten Digit Recognition from my internship at DRDO.",
              textAlign: Responsive.isMobile(context)
                  ? TextAlign.center
                  : TextAlign.left,
              style: theme.textTheme.titleSmall!.merge(
                TextStyle(fontSize: fontSize * 0.8, color: theme.hoverColor),
              )),
        ],
      );
    }

    const List<Map<String, String>> socialMedia = [
      {"image": ImageAssets.git, "url": 'https://github.com/Tanmay0001'},
      {"image": ImageAssets.linkedin, "url": 'https://www.linkedin.com/in/tanmay-mishra-4ba307217/'},
    ];

    void launchURL(String url) async {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        throw 'Could not launch $url';
      }
    }
  Future<void> launchPhoneDialer() async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: '+919958301087',
    );
    
    if (await canLaunch(phoneUri.toString())) {
      await launch(phoneUri.toString());
    } else {
      throw 'Could not launch phone dialer';
    }
  }
    Widget socialIcons() {
      return Row(
        mainAxisAlignment: Responsive.isMobile(context)
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: socialMedia.map((social) {
          return IconButton(
            icon: Image.asset(social["image"]!, height: 30),
            iconSize: 30,
            onPressed: () {
              launchURL(social["url"]!);
            },
          );
        }).toList(),
        
      );
    }


    Widget buildMobileLayout(BuildContext context) {
      return Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageAssets
                    .icHomeBgMobile), // Replace with your image asset path
                fit: BoxFit.fill,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  AspectRatio(aspectRatio:1, child: profilePicture(80)),
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      aboutText(20, context),
                      const SizedBox(height: 20),
                      aboutButton(),
                      const SizedBox(height: 20),
                      Row(children:[ socialIcons(), IconButton(
                icon: const Icon(Icons.phone,color: Colors.black,),
                iconSize: 30,
                onPressed: () {
                 launchPhoneDialer();
                },
              ),]),
                    ],
                  ),
                ],
              ),
            ),
          ),
    
        ],
      );
    }

    Widget buildTabletLayout(BuildContext context) {
      return Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 8,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageAssets
                      .icHomeBg), // Replace with your image asset path
                  fit: BoxFit.fill,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 150),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        aboutText(24, context),
                        const SizedBox(height: 20),
                        aboutButton(),
                        const SizedBox(height: 20),
 Row(children:[ socialIcons(), IconButton(
                icon: const Icon(Icons.phone,color: Colors.black,),
                iconSize: 30,
                onPressed: () {
                 launchPhoneDialer();
                },
              ),]),
                      ],
                    ),
                  ),
                  const SizedBox(width: 40),
                  SizedBox(
                    height:400,
                    width: 300,
                    child: Expanded(child: profilePicture(70))),
                ],
              ),
            ),
          ),
       
        ],
      );
    }

    return Responsive(
      mobile: buildMobileLayout(context),
      tablet: buildTabletLayout(context),
    );
  }
}
