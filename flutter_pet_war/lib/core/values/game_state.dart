enum GameState {
  idle("IDLE"),
  waiting("WAITING"),
  ready("READY"),
  start("START"),
  finish("FINISH"),
  //
  initGame("INITGAME"),
  playerTurn("PLAYERTURN"),
  sendAction("SENDACTION"),
  confirmAction("CONFIRMACTION"),
  finishAction("FINISHACTION"),
  nextTurn("NEXTTURN"),
  // getCard("GETCARD"),
  // onPlayerDefeated("ONDEFEAT"),
  gameFinish("GAMEFINISH");

  final String _name;
  const GameState(this._name);
  String get name => _name;
}
