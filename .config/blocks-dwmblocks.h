//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {

// $HOME/.scripts/dwmblocks/

{"Mem: ", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g",		2,		0},
{"", "$HOME/.scripts/dwmblocks/load.sh",					2,		0}, // Load
// {"", "$HOME/.scripts/dwmblocks/uptime.sh",					60,		0},
// {"Wifi: ", "$HOME/.scripts/dwmblocks/wifi.sh",			                30,		0},
// {"Disk: ", "$HOME/.scripts/dwmblocks/disk.sh",				        15,		0},
{"Vol: ", "$HOME/.scripts/dwmblocks/volume.sh",					1,		0}, // Volume
{"", "$HOME/.scripts/dwmblocks/keymap.sh",					1,		0}, // Keymap
{"Bat: ", "$HOME/.scripts/dwmblocks/battery.sh",				1,		0},
{"", "date '+%b %d (%a) %T %p'",						1,		0} // Date

};

static char delim[] = " | ";
static unsigned int delimLen = 5;
