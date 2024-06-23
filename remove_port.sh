#!/bin/bash

# Argument: port à supprimer
port=$1
ports_file="./bin/ports_list.txt"

# Suppression du port du fichier
grep -v "^$port\$" $ports_file > $ports_file.tmp && mv $ports_file.tmp $ports_file

echo "Port $port removed from the list."
