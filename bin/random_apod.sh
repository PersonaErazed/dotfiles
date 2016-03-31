files=(~/Pictures/apod/*)
printf "%s\n" "${files[RANDOM % ${#files[@]}]}" | xargs feh --bg-center
