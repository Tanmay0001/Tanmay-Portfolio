import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hiteshsapra/theme/image_assets.dart';
import 'package:hiteshsapra/widget/responsive.dart';

class BlogTab extends StatelessWidget {
  const BlogTab({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final isMobile = Responsive.isMobile(context);

    final blogPhotos = [
     [ 
      "assets/images/Blank 2 Grids Collage (1).png",
      "assets/images/Blank 2 Grids Collage.png",
      "assets/images/Blank 3 Grids Collage.png",
      "assets/images/AA1.png",
      "assets/images/LFR 1.png",
      "assets/images/LFR 2.png",
      "assets/images/TA 1.png",
      "assets/images/TA 2.png",]
    ];

  Widget buildPhotoShowcase(List<String> photos) {
  PageController pageController = PageController();
  int currentIndex = 0;
  late Timer autoSlideTimer;

  void startAutoSlide() {
    autoSlideTimer = Timer.periodic(const Duration(seconds: 2), (_) {
      currentIndex = (currentIndex + 1) % photos.length;
      pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  void stopAutoSlide() {
    autoSlideTimer.cancel();
  }

  void onArrowTapped(int direction) {
    stopAutoSlide();
    currentIndex = (currentIndex + direction) % photos.length;
    if (currentIndex < 0) currentIndex = photos.length - 1;
    pageController.animateToPage(
      currentIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    startAutoSlide();
  }

  startAutoSlide();

  return StatefulBuilder(
    builder: (context, setState) {
      return Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: photos.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  width: double.infinity,
                  height: double.infinity,
                  imageUrl: photos[index],
                  fit: BoxFit.fill,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error, size: 50),
                ),
              );
            },
          ),
          Positioned(
            left: 16,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(30),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () {
                  onArrowTapped(-1);
                  setState(() {});
                },
              ),
            ),
          ),
          Positioned(
            right: 16,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(30),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                onPressed: () {
                  onArrowTapped(1);
                  setState(() {});
                },
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                photos.length,
                (index) => Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentIndex == index
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}


Widget buildBlogGrid(List<List<String>> blogPhotos) {
  bool isMobile = MediaQuery.of(context).size.width < 600;

  // If there's only one item, we set crossAxisCount to 1
  int crossAxisCount = blogPhotos.length == 1 ? 1 : (isMobile ? 1 : 3);

  return SizedBox(
    height: 900,
    width: 600,
    child: Center(  // Center the grid
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
        childAspectRatio: 5/5.5,
        ),
        itemCount: blogPhotos.length,
        itemBuilder: (context, index) {
          return Center(child: buildPhotoShowcase(blogPhotos[index]));
        },
      ),
    ),
  );
}



    Widget buildHeading() {
      return Row(
        children: [
          if (!isMobile) const Expanded(flex: 1, child: SizedBox()),
          SizedBox(height: 50,),
         Text(
                  'Gallery',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleSmall!
                      .copyWith(fontSize: 20 * 2.2, color: theme.primaryColor),
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
                child: Image.asset(ImageAssets.ic1),
              ),
              Positioned(
                bottom: 1,
                right: 1,
                child: Image.asset(ImageAssets.ic25),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    buildHeading(),
                    buildBlogGrid(blogPhotos),
                    const SizedBox(height: 20),
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
                top: 40,
                left: 100,
                child: Image.asset(ImageAssets.ic1),
              ),
              Positioned(
                bottom: 100,
                right: 10,
                child: Image.asset(ImageAssets.ic25),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    ),
                child: Column(
                  children: [
                    buildHeading(),
                    buildBlogGrid(blogPhotos),
                    const SizedBox(height: 70),
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
