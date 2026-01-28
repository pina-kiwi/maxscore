#!/bin/bash
#max score
#laura beatty
#ceng 298

declare -a score
max=0

echo "Enter 5 scores, each followed by enter"

for (( i=1; i < 6; i++ ))
do
	read -r score["$i"]
	[[ -z "${score["$i"]}" ]] && continue
	score[i]="${score["$i"]//$'\r'/}"

	if [[ ${score["$i"]} -gt $max ]]; then
		max=${score[i]}
	fi
done

echo "The highest score is $max."
echo "The scores are: "

for (( i=1; i < 6; i++ ))
do
	difference=$(( max - score["$i"] ))
	echo "${score["$i"]} differs from max by $difference"
done


