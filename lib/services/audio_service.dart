import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

/// Records the microphone with `record` and plays it back with `audioplayers`.
class AudioService {
  final AudioRecorder _recorder = AudioRecorder();
  final AudioPlayer _player = AudioPlayer();

  /// Starts recording to a temporary file. Returns false if permission is denied.
  Future<bool> startRecording() async {
    if (!await _recorder.hasPermission()) return false;

    final directory = await getTemporaryDirectory();
    final filePath = '${directory.path}/recorded_audio.m4a';
    await _recorder.start(const RecordConfig(), path: filePath);
    return true;
  }

  /// Stops recording and returns the saved file path (or null).
  Future<String?> stopRecording() => _recorder.stop();

  Future<void> playRecording(String filePath) =>
      _player.play(DeviceFileSource(filePath));

  Future<void> dispose() async {
    await _recorder.dispose();
    await _player.dispose();
  }
}
