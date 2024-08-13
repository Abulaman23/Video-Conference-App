import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:video_conference_app/controller/jitsi_meet_methods.dart';
import 'package:video_conference_app/screens/create_meet_later_scree.dart';
import 'package:video_conference_app/screens/history_meeting_screen.dart';
import 'package:video_conference_app/screens/profile_screen.dart';
import 'package:video_conference_app/screens/video_call_screen_2.dart';
import 'package:video_conference_app/utils/colors.dart';
import 'package:video_conference_app/widgets/drop_down_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  final PageController _pageController = PageController();

  void _onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void _onNavBarTapped(int page) {
    _pageController.jumpToPage(page);
    setState(() {
      _page = page;
    });
  }

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

  int _currentPage = 0;

  // Create a separate PageController for the image carousel
  final PageController _imageCarouselController = PageController();

  void _nextPage() {
    if (_currentPage < _images.length - 1) {
      _currentPage++;
      _imageCarouselController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _currentPage--;
      _imageCarouselController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _imageCarouselController.dispose(); // Dispose the additional controller
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      // Handle the selected date, e.g., navigate to a screen or display the date
      print('Selected date: $picked');
    }
  }

  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  createNewMeeting() {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const VideoCallScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String formattedDate =
        DateFormat('hh:mm a•EEE, d MMM').format(DateTime.now());
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black87,
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.white,
          onTap: _onNavBarTapped,
          currentIndex: _page,
          unselectedFontSize: 12,
          selectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.comment_bank),
              label: 'Meet & Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.lock_clock),
              label: 'Meetings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: 'Contacts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              onPressed: () {},
              icon: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ),
                  );
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          children: [
            _buildHomePage(size, formattedDate),
            const HistoryMeetingScreen(),
            const Center(child: Text('Contacts')),
            const Center(child: Text('Settings')),
          ],
        ),
      ),
    );
  }

  Widget _buildHomePage(Size size, String formattedDate) {
    return SingleChildScrollView(
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
              Text(
                'Conferencia',
                style: Theme.of(context).textTheme.bodySmall,
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
                switch (result) {
                  case 'Create a meeting for later':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateMeetLaterScreen()),
                    );
                    break;
                  case 'Schedule in Calendar':
                    _selectDate(context); // Show date picker
                    break;
                  case 'Start an instant meeting':
                    createNewMeeting();
                    break;
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
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
                      icon: Icons.calendar_month, text: 'Schedule in Calendar'),
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
              ElevatedButton(
                onPressed: () {
                  joinMeeting(context);
                },
                child: SizedBox(
                  height: size.height * 0.04,
                  width: size.width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.people_alt_rounded,
                        color: primaryColor,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Join meet',
                        style: TextStyle(
                          color: Color.fromARGB(255, 84, 191, 12),
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          const Divider(
            color: primaryColor,
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
                  controller:
                      _imageCarouselController, // Use separate controller here
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
    );
  }
}
