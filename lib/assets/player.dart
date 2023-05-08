class Player {
  String name = "";
  int score = 0;
  int highScore = 0;

  Player([this.name = "", this.score = 0]);

  String get playerName {
    return name;
  }

  set playerName(String name) {
    this.name = name;
  }

  int get playerScore {
    return score;
  }

  set playerScore(int score) {
    this.score = score;
    highScore = score > highScore ? score : highScore;
  }

  int get playerHighScore {
    return highScore;
  }

  void resetScore() {
    score = 0;
  }
}

class Leaderboard {
  List<Player> _players = [];

  Leaderboard() {
    _players = [];
  }

  Leaderboard.custom(this._players);

  List<Player> get getPlayers {
    return _players;
  }

  List<String> get getPlayerNames {
    List<String> names = [];
    for (Player player in _players) {
      names.add(player.playerName);
    }
    return names;
  }

  void addPlayer(Player player) {
    _players.add(player);
    sortPlayers();
  }

  // void removePlayer(Player player) {
  //   _players.remove(player);
  // }

  void sortPlayers() {
    _players.sort((a, b) => b.score.compareTo(a.highScore));
  }

  // void resetScores() {
  //   for (Player player in _players) {
  //     player.resetScore();
  //   }
  // }

  // void resetLeaderboard() {
  //   _players = [];
  // }

  // void resetLeaderboardScores() {
  //   resetScores();
  //   resetLeaderboard();
  // }

  Player getPlayer(String username) {
    for (Player player in _players) {
      if (player.playerName == username) {
        return player;
      }
    }

    return Player();
  }
}

Leaderboard leaderboard = Leaderboard();
