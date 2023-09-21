import json
import os
import sys


basepath = os.path.dirname(os.path.realpath(__file__))

input_dir = "lyrics"
out_dir = "lyrics_contents"

out_file = "content.json"

def get_files(dir):
    path = basepath + "/" + dir
    files = []
    for (dirpath, dirnames, filenames) in os.walk(path):
        files.extend(filenames)
    
    return files


def get_existing_lyrics():
    return get_files(input_dir)

def create_entry(lyrics_file):
    path = basepath + "/" + input_dir + "/" + lyrics_file
    raw_content = ""
    with open(path, encoding="utf8") as fp:
        raw_content = fp.read()
    
    json_content = json.loads(raw_content)

    return {
        "name": json_content['name'],
        "thumbnail": json_content['thumbnail'],
        "singer": "",
        "filename": lyrics_file,
        "youtube_hash": json_content['youtube_hash']
    }


existing_lyrics = get_existing_lyrics()

entries = []

for lyrics in existing_lyrics:
    entry = create_entry(lyrics)
    entries.append(entry)

path = basepath + "/" + out_dir + "/" + out_file
with open(path, "w") as fp:
    json.dump(entries, fp, indent=2)