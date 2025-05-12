# Case Study: Audiofeeder

<img src="images/screenshots/antennapod_queue_screenshot_base.png"
     class="splash mobile-screenshot screenshot nospace-fragment fragment disappearing-fragment fade-out"
     data-fragment-index="0"
     />

<img src="images/screenshots/antennapod_queue_screenshot_books_and_english.png"
     class="splash mobile-screenshot screenshot nospace-fragment fragment disappearing-fragment fade-in-and-out"
     data-fragment-index="0"
     />

<img src="images/screenshots/antennapod_queue_screenshot_spanish.png"
     class="splash mobile-screenshot screenshot nospace-fragment fragment disappearing-fragment fade-in"
     data-fragment-index="1"
     />

--

# First version: manually run generated HTML pages

<img src="images/screenshots/audiobooks_v0.png"
     class="splash screenshot"
     />

--

<div style="display:flex; flex-direction: row">

<div>

```python
"""
Serve Audiobooks as podcasts
"""

from datetime import datetime
import time
from email import utils
import os
import hashlib
import qrcode

import win32file
...

server_name = "..."
server_name="192.168.0.XXX"
port_number = 6351

podcast_list = {
		"Writing of Fiction":
		{
			"author":"Edith Wharton",
			"title":"The Writing of Fiction",
			"cover":"WritingOfFiction-Cover.jpg",
			"location":"Nonfiction/Edith Wharton - The Writing of Fiction"
		},
		"Dracula":
		{
			"author": "Bram Stoker",
			"title": "Dracula",
			"cover":"Cover.jpg",
			"location":"Fiction/Bram Stoker - Dracula"
		},
        ...
```

<br/>

```python
HTML_page = """
<html>
<head>
<title>Audiobook RSS Feeds</title>
</head>
<body>
<center>
<h2>Audiobook RSS Feeds</h2>
<table>
{audiobooks}
</table>
</center>
</body>
</html>
"""
```

</div>
<div style="display: flex">

```python
RSS_feed="""<?xml version="1.0" encoding="UTF-8"?>
<rss xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd" version="2.0">
 
    <channel>

        <title>{channel_title}</title>
        <description>{channel_desc}</description>
        <link>{channel_link}</link>
        {cover_image_tag}
        <language>en-us</language>
        <lastBuildDate>{build_date}</lastBuildDate>
        <pubDate>{pub_date}</pubDate>
        <docs>http://blogs.law.harvard.edu/tech/rss</docs>
        
        <itunes:author>{author}</itunes:author>
        <itunes:summary>{channel_desc}</itunes:summary>
        <itunes:explicit>No</itunes:explicit>
        {itunes_cover_image_tag}
        {items}
    </channel>
</rss>
"""

RSS_item = """
        <item>
            <title>{item_title}</title>
            <link>{channel_link}</link>
            <description>{item_desc}</description>
            <pubDate>{item_pubdate}</pubDate>
            <guid>{item_guid}</guid>
            <enclosure url="{item_url}" length="{item_size}" type="audio/mpeg"/>
        </item>
"""

```

</div>
</div>


--

# Still manually run, but with more features

<img src="images/screenshots/audiobooks_v1.png"
     class="splash screenshot"
     />

--

# Next version: Flask app

<img src="images/screenshots/audio_feeder_00_list_entry.jpg"
     class="splash screenshot fragment disappearing-fragment fade-out"
     data-fragment-index="0"
     />

<div style="display:flex;">

<img src="images/screenshots/audio_feeder_01_list_qr.jpg"
     class="splash screenshot nospace-fragment fragment disappearing-fragment fade-in"
     data-fragment-index="0"
     />

<img src="images/screenshots/audio_feeder_02_settings_pulldown.jpg"
     class="splash screenshot nospace-fragment fragment disappearing-fragment fade-in"
     data-fragment-index="0"
     />

</div>

--

# Your applications can grow with you

<div class="fragment disappearing-fragment nospace-fragment fade-out" data-fragment-index="0">

```
$ tree --du -h
[ 46M]  .
├── [ 38M]  db.sqlite
└── [8.1M]  yaml_db
    ├── [105K]  authors.yml
    ├── [105K]  authors.yml.bak
    ├── [3.5M]  books.yml
    ├── [3.5M]  books.yml.bak
    ├── [466K]  entries.yml
    ├── [466K]  entries.yml.bak
    ├── [  23]  series.yml
    ├── [  23]  series.yml.bak
    ├── [  23]  users.yml
    └── [  23]  users.yml.bak
```

<br/>

```python
>>> import audio_feeder
>>> %timeit audio_feeder.database_handler.load_database(Path("yaml_db"))
6.29 s ± 333 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)

>>> %timeit audio_feeder.database_handler.load_database(Path("db.sqlite"))
936 ms ± 96.4 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)
```

</div>

<div class="fragment fade-in" data-fragment-index="0">

<img src="images/screenshots/audio-feeder-gh.png"
     class="splash screenshot fragment disappearing-fragment fade-in-and-out"
     data-fragment-index="0"
     />

<img src="images/screenshots/audio-feeder-docker-gh.png"
     class="splash screenshot fragment disappearing-fragment fade-in"
     data-fragment-index="1"
     />

<i>Available at [https://github.com/pganssle/audio-feeder](https://github.com/pganssle/audio-feeder)</i>

</div>

--

<style>
img.segfig {
    height: 80dvh !important;
}
</style>

# Adding features for yourself

<img src="images/screenshots/audio_feeder_03_feeds.jpg"
     class="splash screenshot fragment disappearing-fragment fade-out"
     data-fragment-index="0"
     />

<img src="images/figures/chapter-segmentation-base.svg"
     class="splash figure fragment disappearing-fragment fade-in-and-out segfig"
     data-fragment-index="0"
     />

<img src="images/figures/chapter-segmentation.svg"
     class="splash figure fragment disappearing-fragment fade-in-and-out segfig"
     data-fragment-index="1"
     />

<img src="images/figures/chapter-segmentation-greedy.svg"
     class="splash figure fragment disappearing-fragment fade-in-and-out segfig"
     data-fragment-index="2"
     />

<img src="images/figures/chapter-segmentation-greedy-red.svg"
     class="splash figure fragment disappearing-fragment fade-in-and-out segfig"
     data-fragment-index="3"
     />

<img src="images/figures/chapter-segmentation-optimal.svg"
     class="splash figure fragment disappearing-fragment fade-in-and-out segfig"
     data-fragment-index="4"
     />
