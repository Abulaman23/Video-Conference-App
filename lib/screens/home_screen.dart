import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:video_conference_app/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<String> _images = [
    'assets/images/video_conference_4.png',
    'assets/images/video_conference_5.jpeg',
    'assets/images/video_conference_6.jpeg',
  ];

  final List<String> _texts = [
    'Get a link that you can share',
    'Your meeting is safe',
    'Plan Ahead',
  ];

  void _nextPage() {
    if (_currentPage < _images.length - 1) {
      _currentPage++;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _currentPage--;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfileScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String formattedDate =
        DateFormat('hh:mm a•EEE, d MMM').format(DateTime.now());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              onPressed: () {},
              icon: GestureDetector(
                onTap: onTap,
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.video_chat,
                    size: 60,
                    color: Color.fromARGB(255, 84, 191, 12),
                  ),
                  const Text(
                    'Conferencia',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.12,
                  ),
                  Text(
                    formattedDate,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 84, 191, 12),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'MAKE VIDEO CALLS HINDERFREE WITH EVERYONE!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    shadows: [
                      Shadow(
                        blurRadius: 50,
                        color: Color.fromARGB(255, 84, 191, 12),
                        offset: Offset(5, 8),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: size.height * 0.06,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  shape: const ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                child: PopupMenuButton<String>(
                  onSelected: (String result) {
                    // Handle the selected menu item.
                    // ignore: avoid_print
                    print('Selected: $result');
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'Start an instant meeting',
                      child: DropdownItem(
                        icon: Icons.add,
                        text: 'Start an instant meeting',
                      ),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Create a meeting for later',
                      child: DropdownItem(
                          icon: Icons.link_outlined,
                          text: 'Create a meeting for later'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Schedule in Calendar',
                      child: DropdownItem(
                          icon: Icons.calendar_month,
                          text: 'Schedule in Calendar'),
                    ),
                  ],
                  child: SizedBox(
                    width: size.width * 0.9,
                    height: size.height * 0.045,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.video_call_sharp,
                          size: 40,
                          color: Colors.white,
                        ),
                        Text(
                          'New Meeting',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      constraints: BoxConstraints(
                        maxWidth: size.width * 0.7,
                      ),
                      labelText: 'Enter the joining code',
                      labelStyle: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Join',
                      style: TextStyle(
                        color: Color.fromARGB(255, 84, 191, 12),
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              const Divider(
                color: Colors.black38,
                indent: 18,
                endIndent: 18,
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Container(
                padding: const EdgeInsets.only(
                  bottom: 40,
                  left: 20,
                  right: 20,
                ),
                height: size.height * 0.4,
                child: Stack(
                  children: [
                    PageView.builder(
                      controller: _pageController,
                      itemCount: _images.length,
                      itemBuilder: (context, index) {
                        return SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  _images[index],
                                  fit: BoxFit.cover,
                                  width: size.width * 0.5,
                                  height: size.width * 0.5,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                _texts[index],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                    ),
                    Positioned(
                      left: 35,
                      top: size.height * 0.15 - 25,
                      child: GestureDetector(
                        onTap: _previousPage,
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 35,
                      top: size.height * 0.15 - 25,
                      child: GestureDetector(
                        onTap: _nextPage,
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DropdownItem extends StatelessWidget {
  const DropdownItem({
    super.key,
    required this.icon,
    required this.text,
  });
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.black87,
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
