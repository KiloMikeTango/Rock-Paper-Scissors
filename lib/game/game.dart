
abstract class Game {
  int get computerScore;
  int get playerScore;
  int? random;
  int? playerIndex; //TODO

  String? computerChoice;
  String? playerChoice;

  void computerPick();

  void resetState();

  void check(context, {onPressed});

  Future<void> stateDialog(context, String title, Function()? onContinue);
}
