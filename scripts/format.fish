#!/usr/bin/env fish
# Format all Fish shell files in the project

echo "Formatting Fish shell files..."

# Find all .fish files and format them
for file in (find . -name "*.fish" -not -path "./.git/*")
    echo "Formatting: $file"
    fish_indent -w $file
end

echo "✅ Formatting complete!"
