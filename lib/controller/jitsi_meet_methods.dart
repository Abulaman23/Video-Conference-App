import 'package:flutter/material.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';

class JitsiMeetMethods {
  final JitsiMeet _jitsiMeetPlugin = JitsiMeet();

  Future<void> createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username = '',
  }) async {
    try {
      var options = JitsiMeetConferenceOptions(
        serverURL: "https://meet.jit.si",
        room: roomName,
        configOverrides: {
          "startWithAudioMuted": isAudioMuted,
          "startWithVideoMuted": isVideoMuted,
        },
        userInfo: JitsiMeetUserInfo(
          displayName: username.isNotEmpty ? username : "Flutter User",
        ),
      );

      var listener = JitsiMeetEventListener(
        conferenceJoined: (url) {
          debugPrint("Conference Joined: $url");
        },
        conferenceTerminated: (url, error) {
          debugPrint("Conference Terminated: $url, error: $error");
        },
        conferenceWillJoin: (url) {
          debugPrint("Conference Will Join: $url");
        },
      );

      await _jitsiMeetPlugin.join(options, listener);
    } catch (error) {
      debugPrint("Error: $error");
    }
  }
}
