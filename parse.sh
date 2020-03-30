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

copy_link_src_file () {
	local file_arr=$1|tr "\n" " "
	local src_file=${file_arr[0]}
	local dst_file=${file_arr[1]}
	local dst_abs_path=$(cd $(dirname $dst_file);pwd)
	rm -rf $dst_file
	$(cd $dst_abs_path;cp -rf $src_file .)
}

while read line
do
	file_arr=($line)
	copy_link_src_file ${file_arr[*]}
done < $1
