import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/api/name_repository.dart';
import 'package:frontend/game_services.dart';
import 'package:frontend/router/router.dart';
import 'package:frontend/ui-library/jh_primary_button.dart';
import 'package:frontend/ui-library/jh_text_field.dart';

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

@RoutePage()
class JoinPage extends ConsumerStatefulWidget {
  const JoinPage({super.key});

  @override
  ConsumerState<JoinPage> createState() => _JoinPageState();
}

class _JoinPageState extends ConsumerState<JoinPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Jekyll & Hide",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 64),
            JHTextField(
              hint: "Name",
              controller: _nameController,
            ),
            const SizedBox(height: 64),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: JHTextField(
                    hint: "Code",
                    controller: _codeController,
                    margin: EdgeInsets.zero,
                    inputFormatters: [UpperCaseTextFormatter()],
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                ValueListenableBuilder<TextEditingValue>(
                    valueListenable: _nameController,
                    builder: (context, nameValue, _) {
                      return ValueListenableBuilder<TextEditingValue>(
                        valueListenable: _codeController,
                        builder: (context, codeValue, _) {
                          return JHPrimaryButton(
                            width: 200,
                            disabled: nameValue.text.isEmpty ||
                                codeValue.text.isEmpty,
                            onPressed: () async {
                              final worked = await ref
                                  .read(gameRepositoryProvider)
                                  .joinGame(codeOverride: codeValue.text);
                              if (worked) {
                                await ref
                                    .read(storedGameCodeServiceProvider)
                                    .setCode(codeValue.text);
                                await ref
                                    .read(nameRepositoryProvider)
                                    .setName(nameValue.text);

                                if (mounted) {
                                  context.router.replace(const MapRoute());
                                }
                              } else {
                                // FIXME: show a snackbar or something if the game joining failed
                              }
                            },
                            child: const Text("Join"),
                          );
                        },
                      );
                    }),
              ],
            ),
            const SizedBox(height: 8),
            const Text("Or"),
            const SizedBox(height: 8),
            ValueListenableBuilder<TextEditingValue>(
                valueListenable: _nameController,
                builder: (context, nameValue, _) {
                  return JHPrimaryButton(
                    disabled: nameValue.text.isEmpty,
                    onPressed: () async {
                      final gameCode =
                          await ref.read(gameRepositoryProvider).createGame();
                      if (gameCode != null) {
                        await ref
                            .read(storedGameCodeServiceProvider)
                            .setCode(gameCode);
                        await ref
                            .read(nameRepositoryProvider)
                            .setName(nameValue.text);
                        if (mounted) {
                          context.router.replace(const MapRoute());
                        }
                      } else {
                        // FIXME: show a snackbar or something if the game creation failed
                      }
                    },
                    child: const Text("Start new Game"),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
