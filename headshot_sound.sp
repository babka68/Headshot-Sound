#pragma semicolon 1
#include <sourcemod>
#include <sdktools>
#pragma newdecls required

#define SOUND_LOAD    "sound/headshot_sound/headshot_sound1.mp3"
#define SOUND_PLAY    "*/headshot_sound/headshot_sound1.mp3"

public Plugin myinfo = 
{
	name = "Headshot Sound",
	author = "babka68",
	description = "При убийстве в голову проигрывается звук.",
	version = "1.0",
	url = "https://vk.com/zakazserver68"
};

public void OnPluginStart()
{
    HookEvent("player_death", Event_PlayerDeath);
}

public void OnMapStart()
{
    PrecacheSound(SOUND_PLAY, true);
    AddFileToDownloadsTable(SOUND_LOAD);
}

public void Event_PlayerDeath(Event event, const char[] name, bool dontBroadcast)
{
    if (GetEventBool(event, "headshot"))
    {
        int attackerIndex = GetClientOfUserId(GetEventInt(event, "attacker"));
        EmitSoundToClient(attackerIndex, SOUND_PLAY, SOUND_FROM_PLAYER, SNDCHAN_STATIC, SNDLEVEL_RAIDSIREN);
    }
}
