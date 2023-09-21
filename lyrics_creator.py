import json
import os
import sys


basepath = os.path.dirname(os.path.realpath(__file__))

input_dir = "lyrics_raw"
out_dir = "lyrics"

def get_files(dir):
    path = basepath + "/" + dir
    files = []
    for (dirpath, dirnames, filenames) in os.walk(path):
        files.extend(filenames)
    
    return files


def get_existing_lyrics():
    files = get_files(out_dir)
    return list(map(lambda x : x.split('.')[0], files))


def get_new_lyrics():
    existing = get_existing_lyrics()
    all_lyrics = get_files(input_dir)
    return list(filter(lambda x : x.split('.')[0] not in existing , all_lyrics))


def create_lyrics_json(content):
    content = content.split('\n\n\n')

    data = []

    for c in content:
        current = {"name": "Verse"}
        current['lyrics'] = list(map(lambda x : repr(x)[1:-1],  c.split("\n\n")))
        data.append(current)



    return data

def extract_metadata(raw_meta):
    data = raw_meta.split(',')
    l = len(data)
    return data[0], data[1] if l > 1 else "", data[2] if l > 2 else ""

def create_lyrics_content(filename):
    path = basepath + "/" + input_dir + "/" + filename

    raw_content = ""

    with open(path) as fp:
        raw_content = fp.read()
    
    data = raw_content.split("\n")

    meta = data[0]

    content = "\n".join(data[1:]).strip()

    (name, youtube_hash, thumbnail) = extract_metadata(meta)

    lyrics = create_lyrics_json(content)

    return {
        "name": name,
        "youtube_hash": youtube_hash,
        "thumbnail": "",
        "lyrics": [
            {
                "type": "English",
                "lyrics": lyrics 
            }
        ]
    }


new_lyrics_files = get_new_lyrics()

for lyrics_file in new_lyrics_files:
    content = create_lyrics_content(lyrics_file)

    out_path = basepath + "/" + out_dir + "/" + lyrics_file.split(".")[0] + ".json"

    with open(out_path, "w") as f:
        json.dump(content, f, indent=2)
