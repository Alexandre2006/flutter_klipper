import 'package:flutter_klipper/src/commands/base.dart';

class GetSudoInfoCommand extends JsonRPCCommand {
  @override
  String method = 'machine.sudo.info';

  @override
  Map<String, dynamic> parameters = {};

  GetSudoInfoCommand({bool checkForSudo = false}) {
    if (checkForSudo) {
      parameters['check_access'] = checkForSudo;
    }
  }
}
