#!/bin/bash

pushd ../../bootisos/

for f in `find . -type f \( -name "*.iso" -o -name "*.bin" -o -name "*.img" \) -printf "%f\n"`
do
	if [ -f ${f}.md5 ]
	then
		md5sum -c $f.md5
		# if not exit code = 0 read "md5 failed on $f"
	else
		echo "generating $f.md5"
		md5sum $f > $f.md5
		cat $f.md5
	fi
done

popd

read -n 1 -p "Press any key to continue..."
