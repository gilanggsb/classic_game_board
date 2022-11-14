class TicTacEntities {
  final int oScore;
  final int xScore;
  final List<String> displayElement;
  final bool isXWin;
  final bool isOWin;
  final bool isDraw;
  TicTacEntities(
      {required this.displayElement,
      required this.isXWin,
      required this.oScore,
      required this.xScore,
      required this.isDraw,
      required this.isOWin});
  TicTacEntities copyWith({
    int? oScore,
    int? xScore,
    List<String>? displayElement,
    bool? isXWin,
    bool? isOWin,
    bool? isDraw,
  }) {
    return TicTacEntities(
        isDraw: isDraw ?? this.isDraw,
        displayElement: displayElement ?? this.displayElement,
        isXWin: isXWin ?? this.isXWin,
        isOWin: isOWin ?? this.isOWin,
        oScore: oScore ?? this.oScore,
        xScore: xScore ?? this.xScore);
  }
}
