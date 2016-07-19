#!/bin/sh

# Fill this variables with your desired options
loc="$1"                             # Location
auth="PTC"                              # PTC or google
user="rvmaps"                              # User
passwd="maps123!"                            # Password
steps=10                              # Number of steps
refresh=3                            # Refresh rate
host="0.0.0.0"                     # Host IP
port=80                            # Host Port
locale="-Len"                        # Locale
ignore=""             # -i to ignore/ -o to only display those pokemons
opts="-dg -ol"                           # Aditional options: -dg/--display-gym, -dp/--display-pokestop , -ol/--onlylure, -d/--debug, -c/--china

if [ \( "$user" = "" \) -o \( "$passwd" = "" \) -o \( "$auth" = "" \) ];then
    echo "Please open this script and configure it first"
    exit 1
elif [ "$#" -eq 0 ];then
    echo "Insert valid location as parameter and nothing more. E.g. 'sh run.sh \"Boulder, CO\"'"
    exit 1
elif [ "$#" -ne 1 ];then
    echo "Pleae insert a valid location between \" \""
	exit 1
elif [ \( "$auth" != "PTC" \) -a \( "$auth" != "google" \) ];then
    echo "Please enter a valid auth method (PTC or google)"
    exit 1
fi

# Check python is accesible via PATH env variable
if [ $(which python) -eq "" ];then
    echo "Ensure python is installed and accesible via PATH variable"
    exit 1
fi

# Check python major version
if [ $(python -c 'import sys; print(sys.version_info[0])') != "2" ];then
    echo "Ensure Python 2 is installed"
    exit 1
fi
python example.py -a "$auth" -u "$user" -p "$passwd" -l "$loc" -st "$steps" -ar "$refresh" -H "$host" -P "$port" "$locale" "$ignore" "$opts"