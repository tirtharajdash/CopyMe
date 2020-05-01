#!/bin/bash

#task: To move particular named files to a destination directory. These particular filenames are based on the values: a=[2,3], b=[0.5 0.75], c=[1]. The filenames can also include trigonometric functions or any other mathematical funciton

#useful for many computaitonal simulation works.

dest="destdirname" #destination directory name

for n in {1..4};
do
	src="head_$n""_tail"
	echo $src

	for a in 2 3;
	do
		#set your scale of precision
		sina=`echo "scale=3;s($a)" | bc -l` #for radian
		#sina=`echo "scale=3;s($a*0.017453293)" | bc -l` #for deg
		apt=`echo $sina | awk '{ printf "%d\n",$1 }'` #point
		apc=`echo "$sina - $apt" | bc -l` #precision
		for b in 0.5 0.75;
		do
			expb=`echo "scale=3;e($b)" | bc -l`
			bpt=`echo $expb | awk '{ printf "%d\n",$1 }'` #point
			bpc=`echo "$expb - $bpt" | bc -l` #precision
			for c in 1 10;
			do
				filename="file_$apt""_$apc""_$bpt""_$bpc""_$c"
				filename=`echo $filename | sed -e "s/\.//g"` #remove the . from filenames
				echo $filename.txt
				#cp $src/$filename.txt $dest/.
			done
		done
	done
done
