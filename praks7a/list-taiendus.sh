#!/bin/bash
# Skript, mis küsib kasutajalt kataloogi nime ja väljastab kataloogis olevad failid, kataloogid ja linkide arvu.

# Küsime kasutajalt kataloogi nime.
echo -n "Sisesta kataloogi nimi: "
read kataloog

# Loendurid failide, kataloogide ja linkide jaoks.
failid=0
kataloogid=0
linkid=0

# Vaatame kataloogi sisu ja väljastame iga asja kohta info.
for asi in "$kataloog"/*
do
    if [ -f "$asi" ]
    then
        echo "$asi on fail"
        failid=$((failid + 1))
    elif [ -d "$asi" ]
    then
        echo "$asi on kataloog"
        kataloogid=$((kataloogid + 1))
    elif [ -L "$asi" ]
    then
        echo "$asi on link"
        linkid=$((linkid + 1))
    fi
done

# Väljastame kokkuvõtte failide, kataloogide ja linkide arvust.
echo "Kokku on $failid faili, $kataloogid kataloogi ja $linkid linki."