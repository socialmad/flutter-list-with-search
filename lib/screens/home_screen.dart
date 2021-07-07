import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/constants/color_constant.dart';
import 'package:flutter_challenge/constants/string_constant.dart';
import 'package:flutter_challenge/screens/details_screen.dart';
import 'package:flutter_challenge/widgets/widget.dart';
import 'signup_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final searchedContacts = <String>[];
  final contacts = <String>[
    'Marco Franco',
    'Raul Alday',
    'Jessica Alba',
    'Roger Waters',
    'Darth Vader',
    'Homer Simpson',
    'Bill Gates',
    'Elon Musk',
    'Enrique Peña',
    'Angeles Rodriguez',
    'Monica Alvarado',
    'Estrella Fugaz',
    'Juana Lopez',
  ];
  TextEditingController searchController = new TextEditingController();
  String query = "";
  bool _isSearching = false;

  //Search Filter
  getSearchResult({String searchName}) {
    setState(() {
      _isSearching = true;
      searchedContacts.clear();
    });
    for (int i = 0; i < contacts.length; i++) {
      String data = contacts[i];
      if (data.toLowerCase().contains(searchName.toLowerCase())) {
        setState(() {
          searchedContacts.add(data);
        });
      }
    }
    setState(() {
      _isSearching = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 2,
            expandedHeight: 200,
            floating: true,
            pinned: true,
            titleSpacing: 0,
            actionsIconTheme: IconThemeData(opacity: 0.0),
            title: Container(
              height: 35,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: Text(
                  appNameText,
                  style: TextStyle(
                      color: whiteColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight + 60),
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: TextField(
                  controller: searchController,
                  onChanged: (value) {
                    getSearchResult(searchName: searchController.text);
                  },
                  cursorColor: whiteColor,
                  autofocus: false,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 35,
                  ),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(Icons.close, color: Colors.white),
                      onPressed: () {
                        setState(() {
                          _isSearching = false;
                          searchController.clear();
                          FocusScope.of(context).unfocus();
                        });
                        WidgetsBinding.instance.addPostFrameCallback(
                            (_) => searchController.clear());
                      },
                    ),
                    border: InputBorder.none,
                    hintText: searchText,
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: textSearchColor,
                    ),
                  ),
                ),
              ),
            ),
            actions: [],
          ),
          SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: (_isSearching == false)
                              ? contacts.length
                              : searchedContacts.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              leading: CircleAvatar(
                                backgroundColor: primaryColor,
                                radius: 25,
                                child: Text(
                                  (_isSearching == false)
                                      ? contacts[index][0]
                                      : searchedContacts[index][0],
                                  style: TextStyle(color: whiteColor),
                                ),
                              ),
                              title: Text(
                                (_isSearching == false)
                                    ? contacts[index]
                                    : searchedContacts[index],
                                style: boldTextStyle(size: 14),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsScreen(
                                        fullName: (_isSearching == false)
                                            ? contacts[index]
                                            : searchedContacts[index]),
                                  ),
                                );
                              },
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
      persistentFooterButtons: [
        Container(
          height: 40,
          padding: EdgeInsets.only(left: 15, right: 15),
          width: size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                doNotHaveAnAccount,
                style: secondaryTextStyle(),
              ),
              // ignore: deprecated_member_use
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ),
                  );
                },
                child: Text(
                  registerText,
                  style: boldTextStyle(size: 14, textColor: primaryColor),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
