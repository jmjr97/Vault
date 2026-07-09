#!/usr/bin/env bash

echo "  -- Create Quick Note --\n"

note_name=$(gum input --placeholder="Note Name")
echo "Name: $note_name"

# echo note name is $note_name now

if [ "$note_name" != nil ] || [ $note_name != nil ]; then
	note_body=$(gum write)
	echo "Body: $note_body"

	echo "**$note_name:** $(date)" >> ~/Dropbox/obsidian/notes/_dump.md
	echo "- $note_body" >> ~/Dropbox/obsidian/notes/_dump.md
	echo "---" >> ~/Dropbox/obsidian/notes/_dump.md
fi
