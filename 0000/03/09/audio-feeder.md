# Case Study: Audiofeeder

<div class="centered-container">
<img src="images/screenshots/antennapod_queue_screenshot_base.png"
     class="splash mobile-screenshot screenshot nospace-fragment fragment disappearing-fragment fade-out"
     data-fragment-index="0"
     />
<img src="images/screenshots/antennapod_queue_screenshot_books_and_english.png"
     class="splash mobile-screenshot screenshot nospace-fragment fragment disappearing-fragment fade-in-and-out"
     data-fragment-index="0"
     />
<img src="images/screenshots/antennapod_queue_screenshot_spanish.png"
     class="splash mobile-screenshot screenshot nospace-fragment fragment fade-in"
     data-fragment-index="1"
     />
</div>

--

# First version: manually run generated HTML pages

<img src="images/screenshots/audiobooks_v0.png"
     class="splash screenshot"
     />

--

<style>
div.striped-border-blocks code {
    border: 3px black dashed;
    padding: 3px;
}

</style>

<div class="side-by-side striped-border-blocks">

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

<div class="centered-container">
<img src="images/screenshots/audiobooks_v1.png"
     class="splash screenshot"
     />
</div>

--

# Next version: Flask app

<div class="centered-container fragment nospace-fragment disappearing-fragment fade-out"
     data-fragment-index="0"
>
<img src="images/screenshots/audio_feeder_00_list_entry.jpg"
     class="splash screenshot"
     />
</div>

<div class="centered-container nospace-fragment fragment disappearing-fragment fade-in"
     data-fragment-index="0"
>
<div class="side-by-side">

<img src="images/screenshots/audio_feeder_01_list_qr.jpg"
     class="splash screenshot"
     />

<img src="images/screenshots/audio_feeder_02_settings_pulldown.jpg"
     class="splash screenshot"
     data-fragment-index="0"
     />

</div>
</div>

--

# Your applications can grow with you

<div class="centered-container">
    <img src="images/screenshots/audio-feeder-gh.png"
         class="splash screenshot fragment nospace-fragment disappearing-fragment fade-out"
         data-fragment-index="0"/>
    <img src="images/screenshots/audio-feeder-docker-gh.png"
         class="splash screenshot fragment fade-in nospace-fragment"
         data-fragment-index="0"
         />
    <div class="caption">
        <i>Available at <a href="https://github.com/pganssle/audio-feeder">https://github.com/pganssle/audio-feeder</a></i>
    </div>
</div>


--

# Adding features for yourself

<style>
img.segfig {
    height: 80dvh !important;
}
</style>

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
