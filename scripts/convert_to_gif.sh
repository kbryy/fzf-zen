#!/bin/bash

# ./convert_to_gif.sh input.mov output.gif
INPUT="$1"
OUTPUT="$2"

ffmpeg -i "$INPUT" \
  -vf "fps=15,scale=800:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
  -loop 0 \
  "$OUTPUT"