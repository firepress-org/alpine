#!/usr/bin/env bash

clear &&\

echo && echo "lenght=52" &&\
for lineID in $(seq 1 8); do
                                 # cut 0 O I l o i characters that look the same in some fonts and
  grp1=$(openssl rand -base64 32 | sed 's/[^123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghjkmnpqrstuvwxyz]//g' | cut -c11-14)
                                   # remove last char | remove spaces
  grp2=$(cat /proc/meminfo | sha256sum | sed 's/.$//' | sed 's: ::g' | cut -c2-43)
  grp3=$(openssl rand -base64 32 | sed 's/[^123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghjkmnpqrstuvwxyz]//g' | cut -c21-24)
  echo "${grp1}_${grp2}_${grp3}"
done &&\

echo && echo "lenght=42" &&\
for lineID in $(seq 1 8); do
  grp1=$(openssl rand -base64 32 | sed 's/[^123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghjkmnpqrstuvwxyz]//g' | cut -c11-14)
  grp2=$(cat /proc/meminfo | sha256sum | sed 's/.$//' | sed 's: ::g' | cut -c2-33)
  grp3=$(openssl rand -base64 32 | sed 's/[^123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghjkmnpqrstuvwxyz]//g' | cut -c21-24)
  echo "${grp1}_${grp2}_${grp3}"
done &&\

echo && echo "lenght=32" &&\
for lineID in $(seq 1 8); do
  grp1=$(openssl rand -base64 32 | sed 's/[^123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghjkmnpqrstuvwxyz]//g' | cut -c11-14)
  grp2=$(cat /proc/meminfo | sha256sum | sed 's/.$//' | sed 's: ::g' | cut -c2-23)
  grp3=$(openssl rand -base64 32 | sed 's/[^123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghjkmnpqrstuvwxyz]//g' | cut -c21-24)
  echo "${grp1}_${grp2}_${grp3}"
done &&\

echo && echo "lenght=22" &&\
for lineID in $(seq 1 8); do
  grp1=$(openssl rand -base64 32 | sed 's/[^123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghjkmnpqrstuvwxyz]//g' | cut -c11-14)
  grp2=$(cat /proc/meminfo | sha256sum | sed 's/.$//' | sed 's: ::g' | cut -c2-13)
  grp3=$(openssl rand -base64 32 | sed 's/[^123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghjkmnpqrstuvwxyz]//g' | cut -c21-24)
  echo "${grp1}_${grp2}_${grp3}"
done && echo;
