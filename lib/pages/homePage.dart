import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medecin_app/constants.dart';
import 'package:medecin_app/generated/l10n.dart';
import 'package:medecin_app/helper/MyDrawer.dart';
import 'package:medecin_app/pages/cartPage.dart';
import 'package:medecin_app/pages/favouritPage.dart';
import 'package:medecin_app/pages/OrdersPage.dart';
import 'package:medecin_app/pages/notfPage.dart';
import 'package:medecin_app/pages/searchPage.dart';
import 'package:medecin_app/services/all_categories_service.dart';
import 'package:medecin_app/shared/shared.dart';
import 'package:medecin_app/widgets/customCategoryCard.dart';

class HomePage extends StatefulWidget {
  static String id = "HomePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  var pages = [HomePage(), OrdersPage(), FavouritesPage(), NotficationsPage()];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
  }

  String getTitle() {
    if (currentPageIndex == 0)
      return S.of(context).Home;
    else if (currentPageIndex == 1)
      return S.of(context).Orders;
    else if (currentPageIndex == 2)
      return S.of(context).Favourite;
    else
      return S.of(context).Notifications;
  }

  Future<void> getToken() async {
    await CacheNetwork.cacheInitialization();
    token = await CacheNetwork.getCacheData(key: 'token');
    username = await CacheNetwork.getCacheData(key: 'username');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(
              icon: Icon(Icons.home), label: S.of(context).Home),
          NavigationDestination(
              icon: Icon(FontAwesomeIcons.list), label: S.of(context).Orders),
          NavigationDestination(
              icon: Icon(Icons.favorite), label: S.of(context).Favourite),
          NavigationDestination(
              icon: Icon(Icons.notifications),
              label: S.of(context).Notifications)
        ],
        selectedIndex: currentPageIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(getTitle()),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color(0xFF0F919E),
              Color(0xFF3AAFB8),
              Color(0xFF63CAD1),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          )),
        ),
        actions: [
          IconButton(
              padding: EdgeInsets.symmetric(horizontal: 16),
              onPressed: () {
                Navigator.pushNamed(context, SearchPage.id);
              },
              icon: Icon(
                Icons.search,
              )),
          IconButton(
              padding: EdgeInsets.symmetric(horizontal: 16),
              onPressed: () {
                Navigator.pushNamed(context, CartPage.id);
              },
              icon: Icon(
                FontAwesomeIcons.cartPlus,
              ))
        ],
      ),
      body: currentPageIndex != 0
          ? pages[currentPageIndex]
          : Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
              child: FutureBuilder<List<dynamic>>(
                  future: AllCategoriesService().getAllCateogires(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<dynamic> categories = snapshot.data!;
                      return Expanded(
                        child: GridView.builder(
                            itemCount: categories.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 1.2,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 20),
                            itemBuilder: (context, index) {
                              return CustomCategoryCard(
                                category: categories[index],
                              );
                            }),
                      );
                    } else
                      return Center(child: CircularProgressIndicator());
                  }),
            ),
    );
  }
}
