#!/usr/bin/env bash

filepath=$1
outdir=$2
basename=$(basename $1)
offsets_config="$(dirname ${filepath})/offsets.conf"

if [[ -z $filepath || -z $basename ]] then
	echo "No file given" >&2
	exit
fi
if [[ -z $outdir ]] then
	echo "No output directory given" >&2
	exit
fi

# filename fit
# filename crop x_offset y_offset gravity rotate

transform_type='crop'
x_offset=0
y_offset=0
rotate=0
gravity='Center'

if [[ -f $offsets_config ]] then
	config=$(cat "${offsets_config}" | grep $basename)
	if [[ ! -z $config ]] then
		transform_type=$(cut -d ' ' -f 2 <<< ${config})

		if [[ $transform_type == 'crop' ]] then
			x_offset=$(cut -d ' ' -f 3 <<< ${config})
			y_offset=$(cut -d ' ' -f 4 <<< ${config})
			rotate=$(cut -d ' ' -f 5 <<< ${config})
			gravity=$(cut -d ' ' -f 6 <<< ${config})
		fi
	fi
fi

# Check cache
target_file_name="${basename}"
if [[ -f "${outdir}/${target_file_name}" ]] then
	echo "${outdir}/${target_file_name}"
	exit
fi

# Transform
if [[ $transform_type == 'fit' ]] then
	magick ${filepath} -gravity "${gravity}" -crop "16:9+${x_offset}+${y_offset}" -gaussian-blur 0x8 -resize "1920x1080" \( ${filepath} -resize "1920x1080" \) -composite -resize "1920x1080!" +repage "${outdir}/${target_file_name}"
else
	magick "${filepath}" -rotate "${rotate}" -gravity "${gravity}" -crop "16:9+${x_offset}+${y_offset}" -resize "1920x1080!" +repage "${outdir}/${target_file_name}"
fi

echo "${outdir}/${target_file_name}"
