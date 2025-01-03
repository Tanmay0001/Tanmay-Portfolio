
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DashboardController extends GetxController {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ScrollOffsetController scrollOffsetController =
      ScrollOffsetController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  final ScrollOffsetListener scrollOffsetListener =
      ScrollOffsetListener.create();

  RxInt currentIndex = 0.obs;

  List<String> tabs = [
    'Home',
    'About',
    'Projects',
    'Achievements',
    'Gallery',
  ];

  RxBool isScrolledMoreThan150 = false.obs;
  void init() {
    itemPositionsListener.itemPositions.addListener(() {
      final positions = itemPositionsListener.itemPositions.value;
      if (positions.isNotEmpty) {
        final min = positions
            .where((position) => position.itemLeadingEdge < 0.5)
            .reduce((min, position) =>
                position.itemLeadingEdge < min.itemLeadingEdge
                    ? position
                    : min);
        if (min.itemLeadingEdge < 0.0 && min.itemTrailingEdge > 0.0) {
          currentIndex.value = min.index;
        }
        //isScrolledMoreThan150.value = positions.first.index > 0;
      }
    });
  }

  void updateScrollOffset(ScrollNotification notification) {
    if (notification.metrics.axis == Axis.vertical) {
      if (notification.metrics.pixels > 150) {
        isScrolledMoreThan150.value = true;
      } else {
        isScrolledMoreThan150.value = false;
      }
    }
  }

  void scrollToIndex(int index) {
    itemScrollController
        .scrollTo(
      index: index,
      duration: const Duration(milliseconds: 500),
    )
        .then((_) {
      Future.delayed(const Duration(milliseconds: 200), () {
        currentIndex.value = index;
      });
    });
  }

  final List<String> categories = [
    'All',
    'Machine Learning',
    'Deep Learning',
    'GenAI and LLMs',
    'NLP',
    'Frontend'
  ];

  ///Service
  var selectedCategory = 'Machine Learning'.obs;
  var portfolioItems = <PortfolioItem>[
    // Mobile App
    PortfolioItem(
        name: 'Movie Recommendation System',
        date: 'May 2023',
        imageUrl: 'assets/images/Movie (3).png',
        category: 'Machine Learning',
        url: "https://github.com/Tanmay0001/Movie-recommendation-system"),
    PortfolioItem(
        name: 'Predict Stock Price mov based on News Headline',
        date: 'Feb 2023',
        imageUrl: 'assets/images/stockprice.png',
        category: 'Machine Learning',
        url:
            "https://github.com/Tanmay0001/Predict-Stock-Price-Movement-Based-On-News-Headline-using-NLP"),

    // Website
    PortfolioItem(
        name: 'Laptop Price Prediction',
        date: 'Aug 2023',
        imageUrl: 'assets/images/laptop_price.png',
        category: 'Machine Learning',
        url: "https://github.com/Tanmay0001/Laptop-Price-Predictor"),
    PortfolioItem(
        name: 'Flight Price Predictor and Feature Engineering',
        date: 'Oct 2023',
        imageUrl: 'assets/images/flight price.jpg',
        category: 'Machine Learning',
        url:
            "https://github.com/Tanmay0001/Flight-Price-Prediction-EDA-Feature-Engineering-03"),

    // TypeScript
    PortfolioItem(
        name: 'Handwritten Digit Recognition using CNN',
        date: 'Jun 2023',
        imageUrl: 'assets/images/HDR.png',
        category: 'Deep Learning',
        url:
            "https://github.com/Tanmay0001/Handwritten-Digit-Recognition-using-CNN"),
    PortfolioItem(
        name: 'Calories Advisor App',
        date: 'Aug 2024',
        imageUrl: 'assets/images/calorie advisor.png',
        category: 'Deep Learning',
        url:
            "https://github.com/Tanmay0001/Gemini-GenAI-Projects/tree/main/Calories%20Advisor%20App"),
    PortfolioItem(
        name: 'Email/SMS Spam Classifier',
        date: 'Mch 2023',
        imageUrl: 'assets/images/spam ham.png',
        category: 'NLP',
        url:
            "https://github.com/Tanmay0001/Email-Spam-Classifier-SMS-Spam-Classifier"),

    // Python (Django)
    PortfolioItem(
        name: 'Sentimental Analysis of Indian Election',
        date: 'May 2020',
        imageUrl: 'assets/images/indian elcetion.jpg',
        category: 'NLP',
        url:
            "https://github.com/Tanmay0001/Sentiment-Analysis-of-Indian-Elections"),
    PortfolioItem(
      name: 'Gemma Model Document QA',
      date: 'Feb 2020',
      imageUrl: 'assets/images/gemma model QA.png',
      url: "https://github.com/Tanmay0001/Gemma-Model-Document-Q-A",
      category: 'NLP',
    ),

    // JavaScript
    PortfolioItem(
        name: 'Text Summarizer Project',
        date: 'Apr 2019',
        imageUrl: 'assets/images/textsummarizer.png',
        category: 'NLP',
        url: "https://github.com/Tanmay0001/Text_Summarizer_project"),

    // JavaScript
    PortfolioItem(
      name: 'Mobile UIDesign Generator',
      date: 'Jul 2024',
      imageUrl: 'assets/images/mobileui.png',
      url: "https://github.com/Tanmay0001/Mobile-UI Design-Generator",
      category: 'GenAI and LLMs',
    ),
    // JavaScript
    PortfolioItem(
      name: "Chat with multiple PDF'S with Langchain",
      date: 'Aug 2024',
      imageUrl: 'assets/images/langcain.png',
      category: 'GenAI and LLMs',
      url:
          "https://github.com/Tanmay0001/Gemini-GenAI-Projects/tree/main/Chat%20with%20Multiple%20PDF'S%20with%20Langchain",
    ),
    // JavaScript
    PortfolioItem(
        name: 'Conversational QA Chatbot',
        date: 'Apr 2024',
        imageUrl: "assets/images/QA-bot.png",
        category: 'GenAI and LLMs',
        url:
            "https://github.com/Tanmay0001/Gemini-GenAI-Projects/tree/main/Coversational%20Q%26A%20Chatbot"),
    PortfolioItem(
        name: 'Resume Analyzer using Google Gemini',
        date: 'Oct 2024',
        imageUrl: 'assets/images/Ai resume.png',
        category: 'GenAI and LLMs',
        url:
            "https://github.com/Tanmay0001/Gemini-GenAI-Projects/tree/main/Resume%20Analyzer%20using%20Google%20Gemini%20AI"),
    PortfolioItem(
        name: 'Gemini AI CLone',
        date: 'Nov 2024',
        imageUrl: 'assets/images/gemini.jpg',
        category: 'Frontend',
        url: 'https://github.com/Tanmay0001/gemini-clone'),
    PortfolioItem(
        name: 'E-commerce Website',
        date: 'Oct 2024',
        imageUrl: 'assets/images/ecommerce.png',
        category: 'Frontend',
        url: 'https://github.com/Tanmay0001/E-commerce-Website'),
    PortfolioItem(
      name: 'Amazon Clone',
      date: 'Aug 2024',
      imageUrl: 'assets/images/amazon clone.jfif',
      category: 'Frontend',
      url: 'https://github.com/Tanmay0001/Amazon-Clone',
    ),
    PortfolioItem(
      name: 'Rock Paper Scissor game',
      date: 'Aug 2024',
      imageUrl: 'assets/images/roc paper scisoor.png',
      category: 'Frontend',
      url: 'https://github.com/Tanmay0001/Rock-Paper-Scissors-Game',
    ),
  ].obs;

  List<PortfolioItem> get filteredItems {
    if (selectedCategory.value == 'All') {
      return portfolioItems;
    } else {
      return portfolioItems
          .where((item) => item.category == selectedCategory.value)
          .toList();
    }
  }

  void changeCategory(String category) {
    selectedCategory.value = category;
  }
}

class PortfolioItem {
  final String imageUrl;
  final String category;
  final String name;
  final String date;
  final String url;

  PortfolioItem(
      {required this.name,
      required this.date,
      required this.imageUrl,
      required this.category,
      required this.url});
}
