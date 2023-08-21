import 'package:flutter/material.dart';




class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text('뭐멍냥?'),
        actions: [
          IconButton(
            onPressed: () {

            },
            icon: const Icon(Icons.notifications),
          )
        ],
      ),
      drawer: Drawer(

        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(

              decoration: BoxDecoration(
                color: Colors.blue,
              ),

              child: Text('뭐멍냥?'),
            ),
            ListTile(
              title: const Text('마이페이지'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('캘린더'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('카메라'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('한줄평'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('보고서'),
              onTap: () {},
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          Flexible(flex: 3, child: Container(
            width: 350,
            height: 200,
            padding: const EdgeInsets.all(30),
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(20),)
            ),
            child: const Text("반려동물 정보", style: TextStyle(fontSize: 50),textAlign: TextAlign.center),

          )
          ),
          Flexible(flex: 2, child: Container(
            width: 350,
            height: 100,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(20),)
            ),
            child: const Text("한줄평", style: TextStyle(fontSize: 50),textAlign: TextAlign.center),

          )
          ),
          Flexible(
            flex: 5,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(Radius.circular(20),)
                          ),
                          margin: const EdgeInsets.all(10),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.insights, size: 48.0), // 아이콘
                              Text("통계"), // 텍스트
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.all(Radius.circular(20),)
                          ),
                          margin: const EdgeInsets.all(10),

                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.history, size: 48.0), // 아이콘
                              Text("기록"), // 텍스트
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.all(Radius.circular(20),)
                          ),
                          margin: const EdgeInsets.all(10),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.settings, size: 48.0), // 아이콘
                              Text("설정"), // 텍스트
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.all(Radius.circular(20),)
                          ),
                          margin: const EdgeInsets.all(10),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.assignment, size: 48.0), // 아이콘
                              Text("보고서"), // 텍스트
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )

        ],
      )


      ,bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: '음식 구분',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: '캘린더',
          ),
        ],
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}
