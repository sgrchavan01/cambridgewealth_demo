import 'package:cambridgewealth_demo/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  int _click = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            bottomNavigationBar: Responsive.isMobile(context)
                ? BottomNavigationBar(
                    currentIndex: _selectedIndex,
                    backgroundColor: Colors.black,
                    selectedItemColor: Colors.orangeAccent,
                    unselectedItemColor: Colors.white,
                    onTap: _onItemTapped,
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home_filled),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.settings),
                        label: 'Setting',
                      ),
                    ],
                  )
                : null,
            body: Container(
              color: Colors.black,
              child: Responsive.isMobile(context) ? mobileView() : deskview(),
            )));
  }

  Widget deskview() {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
            margin: EdgeInsets.only(left: 20, top: 20, bottom: 20),
            width: size.height * 0.080,
            child: Column(
              children: [
                Container(
                  height: size.height * 0.080,
                  width: size.height * 0.080,
                  padding: EdgeInsets.all(
                    size.height * 0.010,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Image.asset('assets/images/app_icon.png'),
                ),
                SizedBox(
                  height: size.height * 0.080,
                ),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        _click=1;
                      });
                    },
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.home_filled,
                              color: Colors.white,
                            ),
                            Text(
                              "Home",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: size.height * 0.018),
                            )
                          ],
                        ),
                        SizedBox(
                          width: size.height * 0.025,
                        ),
                        if(_click==1)
                        Container(
                          width: 2,
                          color: Colors.orange,
                          height: 40,
                        ),
                      ],
                    )),
                SizedBox(
                  height: size.height * 0.080,
                ),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        _click=2;
                      });
                    },
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.settings,
                              color: Colors.white,
                            ),
                            Text(
                              "Setting",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: size.height * 0.018),
                            )
                          ],
                        ),
                        SizedBox(
                          width: size.height * 0.020,
                        ),
                        if(_click==2)
                        Container(
                          width: 2,
                          color: Colors.orange,
                          height: 40,
                        ),
                      ],
                    )),
                Spacer(),
                Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.080,
                    ),
                    Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    Text(
                      "Logout",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: size.height * 0.018),
                    )
                  ],
                )
              ],
            )),
        SizedBox(
          width: size.height * 0.040,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                left: size.height * 0.020,
                right: size.height * 0.020,
                top: size.height * 0.025,
                bottom: size.height * 0.025,
              ),
              child: Text(
                "Home  >  Details",
                style: TextStyle(
                    color: Colors.white54,
                    fontWeight: FontWeight.normal,
                    fontSize: size.height * 0.020),
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            border: Border.all(color: Colors.white54)),
                        margin: EdgeInsets.symmetric(
                            horizontal: size.height * 0.015,
                            vertical: size.height * 0.015),
                        padding: EdgeInsets.all(size.height * 0.015),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "TITLE",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: size.height * 0.030),
                            ),
                            allinOne()
                          ],
                        ))))
          ],
        )),
        Expanded(
            child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(
                  left: size.height * 0.020,
                  right: size.height * 0.020,
                  top: size.height * 0.025,
                  bottom: size.height * 0.025,
                ),
                child: Row(
                  children: [
                    Text(
                      "NOTIFICATIONS",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: size.height * 0.030),
                    ),
                    Spacer(),
                    Image.asset(
                      'assets/images/filter_icon.png',
                      height: size.height * 0.030,
                      width: size.height * 0.030,
                    ),
                  ],
                )),
            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 20,
                    itemBuilder: (BuildContext context, int index) {
                      return notifyitemView();
                    }))
          ],
        ))
      ],
    );
  }

  Widget allinOne() {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.020,
        ),
        IntrinsicHeight(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(width: 5, color: Colors.orange),
            SizedBox(
              width: size.height * 0.020,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "14,522",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.height * 0.022),
                            ),
                            Text(
                              "Score",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: size.height * 0.018),
                            ),
                          ],
                        )),
                    Container(
                      width: 2,
                      height: size.height * 0.050,
                      color: Colors.white54,
                      margin: EdgeInsets.only(right: size.height * 0.020),
                    ),
                    Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "14,522",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.height * 0.022),
                            ),
                            Text(
                              "Score",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: size.height * 0.018),
                            ),
                          ],
                        )),
                    Container(
                      width: 2,
                      height: size.height * 0.050,
                      color: Colors.white54,
                      margin: EdgeInsets.only(right: size.height * 0.020),
                    ),
                    Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "14,522",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.height * 0.022),
                            ),
                            Text(
                              "Score",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: size.height * 0.018),
                            ),
                          ],
                        )),
                    if (Responsive.isDesktop(context))
                      Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Container(
                                width: 2,
                                height: size.height * 0.050,
                                color: Colors.white54,
                                margin:
                                    EdgeInsets.only(right: size.height * 0.020),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "14,522",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: size.height * 0.022),
                                  ),
                                  Text(
                                    "Score",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: size.height * 0.018),
                                  ),
                                ],
                              ),
                            ],
                          ))
                  ],
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam facilisis at nisl eget accumsan. Phasellus sollicitudin dolor quis semper posuere. Nam lobortis ante sit amet vulputate consequat. Etiam id iaculis nisi.Phasellus sollicitudin dolor quis.",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: size.height * 0.018),
                ),
              ],
            ))
          ],
        )),
        SizedBox(
          height: size.height * 0.020,
        ),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return itemView();
            })
      ],
    );
  }

  Widget mobileView() {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(
              left: size.height * 0.020,
              right: size.height * 0.020,
              top: size.height * 0.025,
              bottom: size.height * 0.025,
            ),
            child: Row(
              children: [
                Container(
                  height: size.height * 0.050,
                  width: size.height * 0.050,
                  padding: EdgeInsets.all(
                    size.height * 0.005,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Image.asset('assets/images/app_icon.png'),
                ),
                Spacer(),
                Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              ],
            )),
        Expanded(
            child: SingleChildScrollView(
                child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: size.height * 0.015,
                        vertical: size.height * 0.005),
                    padding: EdgeInsets.all(size.height * 0.015),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [allinOne()],
                    ))))
      ],
    );
  }

  Widget itemView() {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.150,
      decoration: BoxDecoration(
        color: Color(0xff202020),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      margin: EdgeInsets.symmetric(
          horizontal: size.height * 0.015, vertical: size.height * 0.015),
      padding: EdgeInsets.all(size.height * 0.015),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.025,
                width: size.height * 0.025,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/coin_icon.png'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: size.height * 0.015,
              ),
              Text(
                "Lorem ipsum dolor",
                style: TextStyle(
                    color: Colors.white, fontSize: size.height * 0.020),
              ),
              Spacer(),
              Text(
                "5.0",
                style: TextStyle(
                    color: Colors.white, fontSize: size.height * 0.020),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget notifyitemView() {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colors.white54)),
      margin: EdgeInsets.symmetric(
          horizontal: size.height * 0.015, vertical: size.height * 0.015),
      padding: EdgeInsets.all(size.height * 0.015),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.045,
                width: size.height * 0.045,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/item_icon.png'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: size.height * 0.015,
              ),
              Expanded(
                  child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam facilisis at nisl eget accumsan. Phasellus sollicitudin dolor quis semper posuere. Nam lobortis ante sit amet vulputate consequat. Etiam id iaculis nisi.",
                style: TextStyle(
                    color: Colors.white, fontSize: size.height * 0.020),
                maxLines: 4,
              )),
            ],
          )
        ],
      ),
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
