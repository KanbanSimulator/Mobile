class AppRes {
  static const String rules = "The rules:\n\n\n"
  "Kanban is a popular approach to implementing agile principles in software development.\n\n"
      "The methodology involves real-time performance discussion and full transparency of workflows. Work tasks are visually represented on the Kanban board provided by the game, allowing team members to see the status of each task at any given time.\n\n"
      "There are cards in the QUEUE that represent some part of the functionality of the future product. To select a card for work, transfer it to the ANALYSIS stage. To speed up the gameplay, the game starts from the middle of the first week, and some tasks have already been partially completed, and the corresponding cards are already in the DEVELOPMENT and TESTING columns.\n\n"
      "Once a card is placed in the ASSETWater column of the columns, to continue working on it, you need to make an effort * by transferring players of the corresponding color to it (for analysis - red, for development - blue, for testing - green). More players on one card - faster completion of the task. A card can get into the DEVELOPMENT column only if it has full analysis effort, into the TESTING column only if it has full development effort. Players can be dragged to the corresponding cards\n\n"
      "In order for the players to start doing their work, you need to press the START DAY button.\n\n"
      "*effort- effort (eng.); in Kanban, the amount of work that must be done for the card to be considered complete\n\n"
      "On the tenth day of the game, a new set of cards will be added to the BACKLOG. This will be accompanied by a notification about their appearance. Also, at the beginning of each day, there is a chance that urgent tasks will appear, the cards of which are marked in yellow, as well as the notification accompanying them. These tasks are valued more than ordinary , but their business value drops much faster over time, try to complete them as soon as possible!\n\n";

  static const String usernameNotValid = "Username not valid: it should contain at least 4 characters.";

  static const String checkLoggedIn = "Something went wrong: Check if you're logged in.";

  static const String incorrectTeamsCounter = "You cannot have this number of teams in the game.";

  static const String incorrectRoomId = "This room id does not exist.";

  static const String inProgress = "In progress";

  static const String finished = "Finished";

  static const List<String> stageTitle = ["Analysis", "Development", "Testing"];
}
