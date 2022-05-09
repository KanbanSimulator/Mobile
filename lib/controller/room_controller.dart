import 'package:get/get.dart';
import 'package:kanban/model/room/room_model.dart';

import '../core/api.dart';
import '../model/player/player_model.dart';

class RoomController extends GetxController {
  var room = RoomModel().obs;

  get getRoom => room.value;
  get isOwner => room.value.player!.creator!;
  get roomId => room.value.id!;
  get teamId => room.value.player!.teamId;
  get teams => room.value.teams!;

  fetch({
    required int playerId,
  }) async {
    RoomModel? roomFromServer = await RoomApi.checkRoom(playerId, roomId);
    if (roomFromServer != null) {
      _addNewPlayers(newRoom: roomFromServer);
    } else {
      printError(info: "room fetched from server is null!");
    }
  }

  // this changes player's team number to what the owner selected in the UI
  changePlayerTeam({
    required PlayerModel player,
    required int teamNumberSelected,
  }) {
    int index = (room.value.players?.indexOf(player))!;
    room.value.players?.removeAt(index);
    room.value.players?.insert(
      index,
      player.copyWith(
        teamNumber: teamNumberSelected,
        teamId: _teamIdByNumberMapping[teamNumberSelected],
      ),
    );
    room.refresh();
  }

  changePlayerSpectatorMode({
    required PlayerModel player,
    required bool newValue,
  }) {
    // because models in freezed are immutable...
    // ...we replace element in list through deletion
    int index = (room.value.players?.indexOf(player))!;
    room.value.players?.removeAt(index);
    room.value.players?.insert(index, player.copyWith(spectator: newValue));
    room.refresh();
  }

  // this method adds only new players so that we don't override
  // any local changes by the ones that came from the server
  // i. e. if we have Player1 already in room state locally, and if we change Player1.teamNumber to 7,
  // when new players come from server in the form of [Player1, Player2], we don't want to set Player.teamNumber
  // so we only add Player2 to our local state and then we won't ever update it from server
  _addNewPlayers({
    required RoomModel newRoom,
  }) {
    // add only newly gotten players
    List<PlayerModel> newPlayers = [];
    List<PlayerModel> serverPlayers = newRoom.players!;
    for (var pServer in serverPlayers) {
      int? found = room.value.players?.indexWhere((PlayerModel p) => p.id! == pServer.id!);
      if (found == null || found == -1) {
        newPlayers.add(pServer);
      }
    }
    // copy all fields except the players
    room.value = newRoom.copyWith(
      players: [...room.value.players!, ...newPlayers],
    );
    room.refresh();
  }

  // populate mapping team id -> team number
  // there is a need to convert team id to team number
  get _teamIdByNumberMapping {
    final mapping = {};
    for (int i = 0; i < room.value.teams!.length; i++) {
      mapping[room.value.teams![i].teamId!] = room.value.teams![i].teamNumber!;
    }
    return mapping;
  }
}
