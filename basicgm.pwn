#include <a_samp>
#include <zcmd>
#include <sscanf2>
#include <foreach>

main()
{
   print(" Basic Samp Gamemode ");
   return 1;
}

public OnGameModeInIt()
{
   
   SetGameModeText(" Basic Freeroam ");
   return 1;
}

public OnGameModeExit()
{
   return 1;
}

public OnPlayerConnect(playerid)
{
   new string[128];
   format(string, sizeof(string), "%s Join The Server", GetName(playerid));
   SendClientMessageToAll(0xFFFF00FF, string);
}

public OnPlayerDisconnect(playerid)
{
   new string[128];
   format(string, sizeof(string), "%s Left The Server", GetName(playerid));
   SendClientMessageToAll(0xFFFF00FF, string);
}

stock GetName(playerid)
{
   new player[MAX_PLAYER_NAME];
   GetPlayerName(playerid,player,sizeof(player));
   return player;
}
