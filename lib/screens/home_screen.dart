import 'package:flutter/material.dart';
import 'package:news/SourceResponse.dart';
import 'package:news/apis/api_manager.dart';
import 'package:news/app_colors.dart';
import 'package:news/screens/tab_bar.dart';
import 'package:news/screens/tab_item.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColor.whiteColor,
          child: Image.asset(
            "assets/images/pattern.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        DefaultTabController(
          length: 60,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            drawer: Drawer(),
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
              ],
              iconTheme: IconThemeData(
                color: Colors.white,
                size: 25,
              ),
              title: Text(
                "News App",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            body: Column(
              children: [
                TabBarWidget(),
                FutureBuilder(
                  future: ApiManager.getNewsData("abc-news"),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Text("Somthig went wrong");
                    }

                    var articles = snapshot.data?.articles ?? [];

                    return Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Text(articles[index].title ?? "");
                        },
                        itemCount: articles.length,
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
