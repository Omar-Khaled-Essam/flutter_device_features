import 'package:flutter/material.dart';

import '../services/audio_service.dart';
import '../widgets/primary_action_button.dart';

/// Phase 5: record the voice, then play it back.
class AudioRecorderScreen extends StatefulWidget {
  const AudioRecorderScreen({super.key});

  @override
  State<AudioRecorderScreen> createState() => _AudioRecorderScreenState();
}

class _AudioRecorderScreenState extends State<AudioRecorderScreen> {
  final AudioService _audioService = AudioService();
  bool _isRecording = false;
  String? _recordedFilePath;

  /// Toggles between starting and stopping the recording.
  Future<void> _toggleRecording() async {
    if (_isRecording) {
      final savedPath = await _audioService.stopRecording();
      setState(() {
        _isRecording = false;
        _recordedFilePath = savedPath;
      });
      return;
    }

    final started = await _audioService.startRecording();
    if (!mounted) return;
    if (started) {
      setState(() => _isRecording = true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Microphone permission denied')),
      );
    }
  }

  @override
  void dispose() {
    _audioService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Audio Recorder')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryActionButton(
              label: _isRecording ? 'Stop Recording' : 'Record Audio',
              icon: _isRecording ? Icons.stop : Icons.mic,
              onPressed: _toggleRecording,
            ),
            // The play button only appears once a recording exists.
            if (_recordedFilePath != null && !_isRecording) ...[
              const SizedBox(height: 16),
              PrimaryActionButton(
                label: 'Play Audio',
                icon: Icons.play_arrow,
                onPressed: () =>
                    _audioService.playRecording(_recordedFilePath!),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
