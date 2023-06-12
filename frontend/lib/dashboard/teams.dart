import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/api/name_repository.dart';
import 'package:frontend/game_services.dart';
import 'package:frontend/router/router.dart';
import 'package:frontend/ui-library/jh_primary_button.dart';

class TeamsData {
  final String gameCode;
  final String myName;
  const TeamsData({required this.gameCode, required this.myName});
}

final _teamsDataProvider = FutureProvider((ref) async {
  final storedGameCodeService = ref.watch(storedGameCodeServiceProvider);
  // FIXME: it might be nice to do this with a `Future.wait`
  final gameCode = (await storedGameCodeService.code)!;
  final myName = await ref.watch(nameRepositoryProvider).myName;
  return TeamsData(
    gameCode: gameCode,
    myName: myName,
  );
});

@RoutePage()
class TeamsPage extends ConsumerStatefulWidget {
  const TeamsPage({super.key});

  @override
  ConsumerState<TeamsPage> createState() => _TeamsPageState();
}

class _TeamsPageState extends ConsumerState<TeamsPage> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(_teamsDataProvider);
    return data.when(
      data: (data) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Game Code: ${data.gameCode}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Name: ${data.myName}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Expanded(child: Container()),
            JHPrimaryButton(
                child: const Text("Quit"),
                onPressed: () async {
                  await ref.read(gameRepositoryProvider).quitGame();
                  await ref.read(storedGameCodeServiceProvider).setCode(null);
                  // TODO: maybe we should delete name from LocalStorage?
                  if (mounted) {
                    context.router.replace(const JoinRoute());
                  }
                })
          ],
        ),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Text(error.toString()),
    );
  }
}
