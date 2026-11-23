import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_tenis/oyun_tenis.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(tenisConfig.title.length, 33);
    expect(tenisConfig.tagline.length, 33);
    for (final s in tenisConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(tenisRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: tenisId, optionalMechanics: tenisRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(tenisRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
