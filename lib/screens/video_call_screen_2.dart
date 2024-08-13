import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_conference_app/controller/jitsi_meet_methods.dart';
import 'package:video_conference_app/utils/colors.dart';
import 'package:video_conference_app/widgets/meeting_option.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  late TextEditingController nameController;
  late TextEditingController meetingIdController;
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  bool isAudioMuted = true;
  bool isVideoMuted = true;

  @override
  void initState() {
    nameController = TextEditingController();
    meetingIdController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    meetingIdController.dispose();
    nameController.dispose();
  }

  _joinMeeting() {
    _jitsiMeetMethods.createMeeting(
      roomName: meetingIdController.text,
      isAudioMuted: isAudioMuted,
      isVideoMuted: isVideoMuted,
      username: nameController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 14),
                child: Text(
                  'WANNA JOIN A MEET?',
                  style: GoogleFonts.firaSans(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
                child: SizedBox(
                  height: 60,
                  child: TextFormField(
                    controller: meetingIdController,
                    decoration: InputDecoration(
                      constraints: BoxConstraints(
                        maxWidth: size.width * 0.7,
                      ),
                      hintMaxLines: 1,
                      labelText: 'Enter the joining code...',
                      labelStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: primaryColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: primaryColor,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
                child: SizedBox(
                  height: size.height * 0.1,
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      constraints: BoxConstraints(
                        maxWidth: size.width * 0.7,
                      ),
                      hintMaxLines: 1,
                      labelText: 'Enter your name...',
                      labelStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: primaryColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                child: SizedBox(
                  width: size.width * 0.4,
                  height: size.height * 0.06,
                  child: ElevatedButton(
                    onPressed: _joinMeeting,
                    child: const Text(
                      'JOIN',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.05),
              MeetingOption(
                  text: "Mute Audio",
                  isMute: isAudioMuted,
                  onChanged: onAudioMuted),
              MeetingOption(
                  text: "Turn Off My Video",
                  isMute: isVideoMuted,
                  onChanged: onVideoMuted),
            ],
          ),
        ),
      ),
    );
  }

  onAudioMuted(bool val) {
    setState(() {
      isAudioMuted = val;
    });
  }

  onVideoMuted(bool val) {
    setState(() {
      isVideoMuted = val;
    });
  }
}
