/*

  Basic Freeroam Gamemode ( No Saving System )

*/

#include <a_samp>
#include <zcmd>
#include <sscanf2>

// Defines

#define DIALOG_HELP 1
#define DIALOG_ACCHELP 2
#define DIALOG_GENHELP 3
#define DIALOG_VEHHELP 4

main()
{
   print(" Basic Samp Gamemode Loaded ");
   return 1;
}

public OnGameModeInIt()
{
   SetGameModeText(" Basic Freeroam 0.3.7/DL");
   ShowPlayerMarkers(1);
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

public OnPlayerDisconnect(playerid, reason)
{
   new string[128];
   format(string, sizeof(string), "%s Left The Server", GetName(playerid));
   SendClientMessageToAll(0xFFFF00FF, string);
}

public OnPlayerSpawn(playerid)
{
   SetPlayerPos(playerid, 0, 0, 0);
   GameTextForPlayer(playerid, "~g~Basic Freeroam~n~~w~Build 001", 3000, 0);
   return 1;
}

CMD:help(playerid)
{
   ShowPlayerDialog(playerid, DIALOG_HELP, DIALOG_STYLE_LIST, "Do You Need Help?","Account Help\nGeneral Help\nVehicles Help\nAdmin Help", "Close", "");
}

CMD:scar(playerid, params[])
{
   new veh, col1, col2, string[128], Float:x, Float:y, Float:x, Float:angle;
   GetPlayerPos(playerid, X, Y, Z);
   GetPlayerFacingAngle(playerid, angle);
   if(sscanf(params, "i", car, col1, col2)) return SendClientMessage(playerid, 0xFFFFFFFF, "USAGE: /scar [vehid] [color1] [color2]");
   format(string, sizeof(string), "The Vehicle Successfully Spawn. Id : %d", car);
   SendClientMessage(playerid, 0xFFFFFFFF, string);
   CreateVehicle(car, x, y, z, angle, col1, col2, -1);
   return 1;
}

CMD:money(playerid)
{
   GivePlayerMoney(playerid, 10000000);
   SendClientMessage(playerid, 0xFFFFFFFF, "I Love Money");
   return 1;
}

CMD:killme(playerid)
{
   SetPlayerHealth(playerid, 0.0);
   SendClientMessage(playerid, 0xFFFFFFFF, "Click [F] For Respect");
   return 1;
}

public OnPlayerDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
   if(dialogid == DIALOG_HELP)
   {
      if(response)
      {
         if(listitem == 0)
         {
            ShowPlayerDialog(playerid, DIALOG_ACCHELP, DIALOG_STYLE_MSGBOX, "Account Help", "Text Here\nText Here", "Close", "");
         }
         if(listitem == 1)
         {
            ShowPlayerDialog(playerid, DIALOG_GENHELP, DIALOG_STYLE_MSGBOX, "General Help", "Text Here\nText Here", "Close", "");
         }
         if(listitem == 2)
         {
            ShowPlayerDialog(playerid, DIALOG_VEHHELP, DIALOG_STYLE_MSGBOX, "Vehicles Help", "Text Here\nText Here", "Close", "");
         }
      }
   }
   return 1;
}

stock GetName(playerid)
{
   new player[MAX_PLAYER_NAME];
   GetPlayerName(playerid,player,sizeof(player));
   return player;
}
