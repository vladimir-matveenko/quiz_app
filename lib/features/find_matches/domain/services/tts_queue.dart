import 'dart:collection';

import '../../../dictionary/services/tts_service.dart';

class TtsQueue {
  TtsQueue(this._ttsService);

  final TtsService _ttsService;
  final Queue<_TtsTask> _queue = Queue<_TtsTask>();
  bool _isProcessing = false;

  void add({required String text, required String language}) {
    _queue.add(_TtsTask(text: text, language: language));
    _process();
  }

  Future<void> _process() async {
    if (_isProcessing || _queue.isEmpty) return;
    _isProcessing = true;
    try {
      while (_queue.isNotEmpty) {
        final task = _queue.removeFirst();
        await _ttsService.setLanguage(task.language);
        await _ttsService.speak(task.text);
      }
    } finally {
      _isProcessing = false;
    }
  }

  void clear() {
    _queue.clear();
  }
}

class _TtsTask {
  const _TtsTask({required this.text, required this.language});

  final String text;
  final String language;
}
