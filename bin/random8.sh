#!/usr/bin/env bash

clear &&\

echo && echo "lenght=52" &&\

for lineID in $(seq 1 8); do

  # generate keys
  rm ~/tmp/id_ed25519* || true &&\
  my_passphrase="$(cat /proc/meminfo | sha256sum)"
  ssh-keygen -q -o -a 100 -t ed25519 -f ~/tmp/id_ed25519 -C "randomuser@randomdomain.com" -q -N "${my_passphrase}"
                                 # cut 0 O I l o i characters that look the same in some fonts and
  grp1=$(openssl rand -base64 32 | sed 's/[^123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghjkmnpqrstuvwxyz]//g' | cut -c11-14)
                                   # remove last char | remove spaces
  grp2=$(cat ~/tmp/id_ed25519 | sha256sum | sed 's/.$//' | sed 's: ::g' | cut -c2-43)
  grp3=$(openssl rand -base64 32 | sed 's/[^123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghjkmnpqrstuvwxyz]//g' | cut -c21-24)

  # show result
  echo "${grp1}_${grp2}_${grp3}"
done
