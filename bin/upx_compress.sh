#!/bin/sh

#set -o errexit          # Exit on most errors (see the manual)
#set -o errtrace         # Make sure any error trap is inherited
#set -o nounset          # Disallow expansion of unset variables
#set -o pipefail         # Use last non-zero exit code in a pipeline
#set -o xtrace          # Trace the execution of the script (debug)

# find all executable, with more than 1k, with path including *bin*
# Before 9.4 MO, after 5.6M

in_path="/bin /sbin /usr/bin"
min="1"
max=$(find ${in_path} -size +1k -perm /u=x,g=x,o=x | wc -l)
echo ${max};

# check what's to compress
for action in $(seq ${min} ${max}); do
		app=$(find ${in_path} -size +1k -perm /u=x,g=x,o=x | head -n${action} | tail -n1)
		is_executable=$(file -b --mime-type ${app} | sed 's|/.*||')
		if [ "$is_executable" == "application" ]; then

			upx -t ${app} | grep not

		fi
done;

# compress with upx
for action in $(seq ${min} ${max}); do
		app=$(find ${in_path} -size +1k -perm /u=x,g=x,o=x | head -n${action} | tail -n1)
		is_executable=$(file -b --mime-type ${app} | sed 's|/.*||')
		if [ "$is_executable" == "application" ]; then

			upx --ultra-brute ${app}

		fi
done

# check what was compressed
for action in $(seq ${min} ${max}); do
		app=$(find ${in_path} -size +1k -perm /u=x,g=x,o=x | head -n${action} | tail -n1)
		is_executable=$(file -b --mime-type ${app} | sed 's|/.*||')
		if [ "$is_executable" == "application" ]; then

			upx -t ${app} | grep OK

		fi
done;