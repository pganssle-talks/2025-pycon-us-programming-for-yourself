#!/bin/bash

FROM=1324
TO=1984

for img in "$@"; do
  filename=$(basename -- "$img")
  extension="${filename##*.}"
  filename="${filename%.*}"

  # Calculate bottom section height (total height minus TO)
  height=$(identify -format "%h" "$img")
  bottom_height=$((height - TO))

  # Extract top and bottom sections and combine
  convert "$img" \
    -gravity North -crop x${FROM}+0+0 \
    \( "$img" -gravity South -crop x${bottom_height}+0+0 \) \
    -append "${filename}_trimmed.${extension}"

  echo "Processed $img -> ${filename}_trimmed.${extension}"
done
