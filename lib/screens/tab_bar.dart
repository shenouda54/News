import 'package:flutter/material.dart';
import 'package:news/apis/api_manager.dart';
import 'package:news/screens/tab_item.dart';


class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  int selectedTabIndex=0;
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      // ApiManager.getSources()
      future:ApiManager.getSources(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text("Somthig went wrong");
        }
        var sources = snapshot.data?.sources ?? [];
        return DefaultTabController(
          // دا الاخبار الي ظاهره من فوق وبتعمل scroll من الشمال لليمين او العكس
            length: sources.length,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBar(
                  isScrollable: true,
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.transparent,
                  onTap: (value) {
                    selectedTabIndex = value;
                    setState(() {});
                  },
                  tabs: sources
                      .map((e) => TabItem(
                    source: e,
                    isSelected:
                    sources.elementAt(selectedTabIndex) ==
                        e,
                  ))
                      .toList()),
            ));
      },
    );
  }
}
