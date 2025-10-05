#!/usr/bin/env bash

dirpath=$(dirname $0)
filepath=$1
outdir=$2
force=${3:-false}
basename=$(basename ${filepath})
offsets_config="$(dirname ${filepath})/offsets.conf"

if [[ -z $filepath || -z $basename ]] then
	echo 'No file given' >&2
	exit
fi
if [[ -z $outdir ]] then
	echo 'No output directory given' >&2
	exit
fi

# filename fit  x_offset y_offset aspect_ratio gravity
# filename crop x_offset y_offset rotate       gravity
if [[ -f $offsets_config ]] then
	config=$(cat "${offsets_config}" | grep $basename | tail -n 1)
	if [[ ! -z $config ]] then
		transform_type=$(cut -d ' ' -f 2 <<< ${config})
	fi
fi
transform_type=${transform_type:-'crop'}

# Check cache
target_file_name="${basename}"
if [[ -f "${outdir}/${target_file_name}" && ${force} == false ]] then
	echo "${outdir}/${target_file_name}"
	exit
fi

# Transform
if [[ $transform_type == 'fit' ]] then
	x_offset=$(cut -d ' ' -f 3 <<< ${config})
	x_offset=${x_offset:-0}
	y_offset=$(cut -d ' ' -f 4 <<< ${config})
	y_offset=${y_offset:-0}
	aspect_ratio=$(cut -d ' ' -f 5 <<< ${config})
	aspect_ratio=${aspect_ratio:-'1:1'}
	gravity=$(cut -d ' ' -f 6 <<< ${config})
	gravity=${gravity:-'North'}

	magick ${filepath} \
		-gravity 'Center' \
		-crop '16:9' \
		-gaussian-blur '0x8' \
		-resize '1920x1080' \
		\( \
			${filepath} \
			-gravity "${gravity}" \
			-crop "${aspect_ratio}+${x_offset}+${y_offset}" \
			-resize '1920x1080' \
		\) \
		-composite -resize '1920x1080!' \
		+repage "${outdir}/${target_file_name}"
# Preferred when not cropping
elif [[ $transform_type == 'fit2' ]] then
	x_offset=$(cut -d ' ' -f 3 <<< ${config})
	x_offset=${x_offset:-0}
	y_offset=$(cut -d ' ' -f 4 <<< ${config})
	y_offset=${y_offset:-0}
	aspect_ratio=$(cut -d ' ' -f 5 <<< ${config})
	aspect_ratio=${aspect_ratio:-'1:1'}
	gravity=$(cut -d ' ' -f 6 <<< ${config})
	gravity=${gravity:-'North'}

	magick ${filepath} \
		-gravity 'Center' \
		-crop '16:9' \
		-gaussian-blur '0x8' \
		-resize '1920x1080' \
		\( \
			${filepath} \
			-gravity "${gravity}" \
			-resize '1920x1080' \
		\) \
		-composite -resize '1920x1080!' \
		+repage "${outdir}/${target_file_name}"
elif [[ $transform_type == 'crop' ]] then
	x_offset=$(cut -d ' ' -f 3 <<< ${config})
	x_offset=${x_offset:-0}
	y_offset=$(cut -d ' ' -f 4 <<< ${config})
	y_offset=${y_offset:-0}
	rotate=$(cut -d ' ' -f 5 <<< ${config})
	rotate=${rotate:-0}
	gravity=$(cut -d ' ' -f 6 <<< ${config})
	gravity=${gravity:-'Center'}

	magick "${filepath}" \
		-rotate "${rotate}" \
		-gravity "${gravity}" \
		-crop "16:9+${x_offset}+${y_offset}" \
		-resize '1920x1080!' \
		+repage "${outdir}/${target_file_name}"
else
	notify-send "Wallpaper - Unknown transform type" "${filepath}"
	echo "Unknwon transform type of ${transform_type} for ${filepath}" >> \
		"${dirpath}/wp-error.log"
	exit
fi

echo "${outdir}/${target_file_name}"
