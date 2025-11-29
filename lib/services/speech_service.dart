import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

final speechServiceProvider = Provider<SpeechService>((ref) => SpeechService());

class SpeechService {
  SpeechService();
  final stt.SpeechToText _speech = stt.SpeechToText();

  Future<bool> init() async => _speech.initialize();

  Future<void> start(void Function(String text) onText) async {
    await _speech.listen(onResult: (result) => onText(result.recognizedWords));
  }

  Future<void> stop() async => _speech.stop();

  bool get isListening => _speech.isListening;
}
