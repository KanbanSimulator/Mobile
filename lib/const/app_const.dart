class AppConst {
  static const String unnamed = "__unnamed__";
  static const int undefined = -1;

  // task table & task column
  // static const stageMapping =   {0:1, 1:3, 2:5, 3:2, 4:4, 5:6, 7:0}; // straight mapping
  static const stageIMapping =  {0:7, 1:0, 2:3, 3:1, 4:4, 5:2, 6:5}; // mapping table column -> stages

  // api back - front mappings
  static const stageBackToFrontMapping = {0: 7, 1: 0, 2: 3, 3: 1, 4: 4, 5: 2, 6: 5, 7: 6};
  static const stageFrontToBackMapping = {7: 0, 0: 1, 3: 2, 1: 3, 4: 4, 2: 5, 5: 6, 6: 7};

  // long polling
  static const int lobbyUpdateFrequency = 2;  // in sec
  static const int gameUpdateFrequency = 150; // in ms
}
