#!/usr/bin/env bash
replace_dir(){
	local src_str=$1
	str=${src_str//[a-Z]\//..\/}
	for((i=0;i<20;i++))
	do
	str=${str//[a-Z]..\//..\/}
	done
	str=${str%/*}"/.."
	#echo $str
}
while read line
do
#	echo $line
	link=${line#* }
	src=${line% *}
	link_dir=${link%/*}
	replace_dir $link_dir
#	echo $link
#	echo $src
#	echo $link_dir
	src=${src/$str/.}
:<<EOF
if [ -f $src ]
then
	#echo "cp $src $link_dir"
	mv $link ${link}.zy
	#echo "mv $src ${src}.zy"
	cp -R $src $link_dir
else
	echo "$src is a dir"
fi
EOF
	rm $link
	cp -R $src $link_dir
done < $1
