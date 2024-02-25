import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class GroupPage extends StatelessWidget {
//   const MyApp({super.key});

//   // @override
//   // Widget build(BuildContext context) {
//   //   return MaterialApp(
//   //     debugShowCheckedModeBanner: false,
//   //     theme: ThemeData(
//   //         drawerTheme: const DrawerThemeData(scrimColor: Colors.transparent)),
//   //     title: 'New Wathsapp UI',
//   //     home: const GroupPage(),
//   //   );
//   // }
// }

class GroupPage extends StatefulWidget {
  const GroupPage({super.key});

  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: const Color(0xFF171717),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 30, left: 5, right: 5, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          _globalKey.currentState!.openDrawer();
                        },
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 10),
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Messages",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                    const SizedBox(
                      width: 35,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Online",
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        )),
                    const SizedBox(
                      width: 35,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Groups",
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        )),
                    const SizedBox(
                      width: 35,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "More",
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        )),
                    const SizedBox(
                      width: 35,
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: 190,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 15, left: 25, right: 25),
              height: 220,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 172, 28),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Favorite contacts",
                        style: TextStyle(color: Colors.white),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_horiz,
                            color: Colors.white,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        buildContactAvatar('Fight!', 'img1.jpeg'),
                        buildContactAvatar('Love', 'img2.jpeg'),
                        buildContactAvatar('Peace', 'img3.jpeg'),
                        buildContactAvatar('Win', 'img4.jpg'),
                        buildContactAvatar('P', 'img5.jpeg'),
                        buildContactAvatar('UK', 'img6.jpeg'),
                        buildContactAvatar('India', 'img7.jpeg'),
                        buildContactAvatar('We fight!', 'img8.jpg'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              top: 365,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: ListView(
                  padding: const EdgeInsets.only(left: 25),
                  children: [
                    buildConversationRow(
                        'Win', 'Hello, how are you?', 'img1.jpeg', 0),
                    buildConversationRow(
                        'Fight', 'Will you visit us?', 'img2.jpeg', 2),
                    buildConversationRow('Peace',
                        'idk, i want to stay positive', 'img3.jpeg', 6),
                    buildConversationRow(
                        'Loave', 'This shall too pass', 'img5.jpeg', 0),
                    buildConversationRow(
                        'Uk', 'Let us fight together', 'img6.jpeg', 3),
                    buildConversationRow(
                        'We fight!', 'Hey, whatsup', 'img7.jpeg', 0),
                    buildConversationRow(
                        'India', 'Hello, how are you', 'img1.jpeg', 0),
                    buildConversationRow(
                        'mh', 'Hello, how are you', 'img1.jpeg', 0),
                  ],
                ),
              ))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: SizedBox(
        height: 65,
        width: 65,
        child: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 255, 176, 98),
          child: const Icon(
            Icons.edit_outlined,
            size: 30,
          ),
          onPressed: () {},
        ),
      ),
      drawer: Drawer(
        width: 275,
        elevation: 30,
        backgroundColor: const Color(0xF3393838),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(40))),
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.horizontal(right: Radius.circular(40)),
              boxShadow: [
                BoxShadow(
                    color: Color(0x3D000000), spreadRadius: 30, blurRadius: 20)
              ]),
          child: const Padding(
            padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(
                          width: 56,
                        ),
                        Text(
                          'Settings',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        UserAvatar(filename: 'img3.jpeg'),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          'Tom Brenan',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    DrawerItem(
                      title: 'Account',
                      icon: Icons.key,
                    ),
                    DrawerItem(title: 'Chats', icon: Icons.chat_bubble),
                    DrawerItem(
                        title: 'Notifications', icon: Icons.notifications),
                    DrawerItem(title: 'Data and Storage', icon: Icons.storage),
                    DrawerItem(title: 'Help', icon: Icons.help),
                    Divider(
                      height: 35,
                      color: Color.fromARGB(255, 255, 186, 47),
                    ),
                    DrawerItem(
                        title: 'Invite a friend', icon: Icons.people_outline),
                  ],
                ),
                DrawerItem(title: 'Log out', icon: Icons.logout)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildConversationRow(
      String name, String message, String filename, int msgCount) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                UserAvatar(filename: filename),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      message,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25, top: 5),
              child: Column(
                children: [
                  const Text(
                    '16:35',
                    style: TextStyle(fontSize: 10),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  if (msgCount > 0)
                    CircleAvatar(
                      radius: 7,
                      backgroundColor: Color.fromARGB(255, 255, 164, 74),
                      child: Text(
                        msgCount.toString(),
                        style:
                            const TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    )
                ],
              ),
            )
          ],
        ),
        const Divider(
          indent: 70,
          height: 20,
        )
      ],
    );
  }

  Padding buildContactAvatar(String name, String filename) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Column(
        children: [
          UserAvatar(
            filename: filename,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          )
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  const DrawerItem({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(
              width: 40,
            ),
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class UserAvatar extends StatelessWidget {
  final String filename;
  const UserAvatar({
    super.key,
    required this.filename,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 32,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 29,
        backgroundImage: Image.asset('assets/images/$filename').image,
      ),
    );
  }
}
