# Case Study: Audiofeeder

<div class="centered-container">
<img src="images/screenshots/antennapod_queue_screenshot_base.png"
     class="splash mobile-screenshot screenshot nospace-fragment fragment disappearing-fragment fade-out"
     alt="The queue of an AntennaPod feed. It contains 5 elements"
     data-fragment-index="0"
     />
<img src="images/screenshots/antennapod_queue_screenshot_books_and_english.png"
     class="splash mobile-screenshot screenshot nospace-fragment fragment disappearing-fragment fade-in-and-out"
     alt="The same queue, but now 3 elements are highlighted. 'Charles Stross - Invisible Sun' is labeled 'Fiction Book', 'Core.py Episode 21: A Garbage Episode' is labeled 'Podcast Episode' and 'Cliff Kuang - User Friendly' is labeled 'Nonfiction Book'"
     data-fragment-index="0"
     />
<img src="images/screenshots/antennapod_queue_screenshot_spanish.png"
     class="splash mobile-screenshot screenshot nospace-fragment fragment fade-in"
     alt="The same queue, but now the other two elements are highlighted, both labeled 'Spanish Podcast'. The episodes are 'Pizzel Ep 37 - Un bofetazo de mono' and 'Esferas Invisibles - 23:59:60'"
     data-fragment-index="1"
     />
</div>

Notes:

T: 11m

OK, so the next project I'd like to show you is something that I built primarily for myself, but understanding why I care about it takes a bit of explanation. You see, I listen to a lot of audio content, a mix of audiobooks and podcasts. Specifically, I usually try to listen to about an hour of one audiobook, then about an hour of a podcast, then about an hour of a different audiobook, then repeating. And about 18 months ago I started learning Spanish, so now I also like to alternate content between English and Spanish. I do it this way because I find that interleaving my content and stretching it out over many days helps me retain it better when compared to "binging" all in a row, and not getting a chance to sleep on the ideas presented before returning to them later.

The problem, however, is that a lot of applications treat podcasts and audiobooks as fundamentally different things. They expect you to go to an audiobook application to listen to audiobooks and then switch to a podcast application to listen to podcasts, but about 10 years ago I realized that if I just have audio files on a computer, I can create an RSS feed for them and turn all my audiobooks into podcasts, so they would work with whatever podcast player I want!

--

# First version: manually run generated HTML pages

<img src="images/screenshots/audiobooks_v0.png"
     alt="A screenshot of a sparse webpage labeled 'Audiobook RSS Feeds'. It has 3 (public domain) books, each with a cover image and a QR code. The books are Edith Wharton - The Writing of Fiction, H. G. Wells - The Invisible Man and Bram Stoker - Dracula"
     class="splash screenshot"
     />

Notes:

T: 11m15s

The first version of this was janky as hell. I would from time to time run a script that generates an HTML page with QR codes for the RSS feeds on it. As you can see there was no CSS here. No pagination, it was just a bare list of stuff.

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

Notes:

T: 11m45s

As you can see from the code, not only was I manually running it, I was also manually adding the book information, but it worked! It generated a page and a rudimentary RSS feed that I could use.

--

# Still manually run, but with more features

<div class="centered-container">
<img src="images/screenshots/audiobooks_v1.png"
     alt="An improved version of the webpage. It now has 22 pages and large, oversized arrows left and right for navigation to first, previous, next and last pages. The section with books still has a cover and a QR code, but now the rows alternate between a dark and light grey background. The cover and QR code have moved to the left, and there is now a description below each book. The books are all by Vernor Vinge: ´A Fire Upon the Deep´, ´The Children of the Sky´ and ´A Deepness in the Sky´. (They are in this order even though ´Children of the Sky´ is actually the third book in the series)"
     class="splash screenshot"
     />
</div>

Notes:

T: 12m15s

I think pretty soon after that (I have no git history this early on in the project because it was all very yolo), I got tired of manually adding all the book information, and the number of books I had was getting unwieldy for a single page, so I added something that automatically parses the book names and authors from the folder names, retrieves descriptions from Google books, and breaks them up into multiple pages. This was still something I ran manually, and it was still generating a static page, but it was considerably more ergonomic.

--

# Next version: Flask site

<div class="centered-container fragment nospace-fragment disappearing-fragment fade-out"
     data-fragment-index="0"
>
<img src="images/screenshots/audio_feeder_00_list_entry.jpg"
     alt="A smaller more mobile-friendly version of the site. The arrows are now smaller, the rows are still striped between dark and light grey, but there is also a settings element in the top right. The QR codes are no longer visible, but there is an icon below each cover representing 4 squares, and each element has multiple links under the name, ´Single File´, ´Segmented´ and ´Chapters´ - some combination of these shows up on each book. It is the same 3 public domain books,b ut now Mary Shelley's Frankeinstein is also on the list."
     class="splash screenshot"
     />
</div>

<div class="centered-container nospace-fragment fragment disappearing-fragment fade-in"
     data-fragment-index="0"
     alt="A similar screenshot as before, but with a QR code superposed on top of the site"
>
<div class="side-by-side">

<img src="images/screenshots/audio_feeder_01_list_qr.jpg"
     class="splash screenshot"
     alt="A closer crop of the screenshot from before, but now a settings dialog pulldown is visible showing ´Sort Order´, ´Direction´ and ´Items per Page´"
     />

<img src="images/screenshots/audio_feeder_02_settings_pulldown.jpg"
     class="splash screenshot"
     data-fragment-index="0"
     />

</div>
</div>

Notes:

T: 12m45s

A few years after that, I didn't want to keep having to manually run the updater, and I realized that I wanted some more dynamic features that wouldn't fit with a static site. Despite having worked as a developer professionally for several years at this point, I barely knew how to make any kind of dynamic web site and I didn't know how to use SQL, but I had an interesting problem to solve, so over Christmas break I looked up how to use Flask and created and deployed a version of the app with nice mobile support, with different options for sorting and pagination, and that automatically updated itself with some cadence.

--

# Your applications can grow with you

<div class="centered-container">
    <img src="images/screenshots/audio-feeder-docker-gh.png"
         class="splash screenshot fragment fade-out nospace-fragment"
         alt="Screenshot of a Github repository called audio-feeder-docker. It has 1 star, 17 commits and no releases. The languages are visible, 78% Dockerfile and 21% Shell."
         data-fragment-index="0"
         />
    <img src="images/screenshots/audio-feeder-gh.png"
         class="splash screenshot fragment nospace-fragment disappearing-fragment fade-in"
         alt="Screenshot of a GitHub repository called audio-feeder. It has 18 stars and 0 forks. There are 5 releases, the most recent is 0.6.2 on December 3, 2022."
         data-fragment-index="0"/>
    <div class="caption">
        <i>Available at <a href="https://github.com/pganssle/audio-feeder">https://github.com/pganssle/audio-feeder</a></i>
    </div>
</div>

Notes:

T: 14:00

I've been maintaining some version of this app for a decade now, and I think it's a striking example of how your projects and your abilities can grow in a mutually-reinforcing way. When this project started causing problems with updates because of how I was deploying it, it encouraged me to learn to use docker so that I could isolate this from my system. Similarly, when I started doing a lot more work with SQL during my job, I finally felt confident migrating this system away from the previous system, which was using a giant YAML file as a "database" to something based on SQLlite

--

# Adding features for yourself

<style>
img.segfig {
    height: 80dvh !important;
}
</style>

<img src="images/screenshots/audio_feeder_03_feeds.jpg"
     class="splash screenshot fragment disappearing-fragment fade-out"
     alt="One of the earlier screenshots of the website, this time with the 3 alternate feeds (Single File, Chapters, Segmented) highlighted on Bram Stoker - Dracula"
     data-fragment-index="0"
     />
<img src="images/figures/chapter-segmentation-base.svg"
     class="splash figure fragment disappearing-fragment fade-in-and-out segfig"
     alt="A vector drawing with various rounded rectangles of various thicknesses stacked on one another, representing chapters in an audiobook file. They have numbers on them in white representing minutes. 45, 10, 25, 55, 18, 8, 50, 35, 93, 15, 20"
     data-fragment-index="0"
     />
<img src="images/figures/chapter-segmentation.svg"
     class="splash figure fragment disappearing-fragment fade-in-and-out segfig"
     alt="The same as the previous figure, but now there is an arrow pointing right to another figure which has all the same rectangles but spread out and with no numbers on them. The shorter ones are in red and the longer ones are in green."
     data-fragment-index="1"
     />
<img src="images/figures/chapter-segmentation-greedy.svg"
     class="splash figure fragment disappearing-fragment fade-in-and-out segfig"
     class="The figure representing chapters with an arrow that now splits into 5 right arrows, each pointing to smaller stacks of rounded rectangles. The chapters have been grouped together, and there are numbers representing each aggregate's size: 70, 73, 93, 93, 35"
     data-fragment-index="2"
     />
<img src="images/figures/chapter-segmentation-greedy-red.svg"
     class="splash figure fragment disappearing-fragment fade-in-and-out segfig"
     alt="The same as the previous figure, but now the last number (35) is bright red, and two of the other numbers (73 and 93) are a darker red)."
     data-fragment-index="3"
     />
<img src="images/figures/chapter-segmentation-optimal.svg"
     class="splash figure fragment disappearing-fragment fade-in-and-out segfig"
     alt="Another distribution of the chapters, this time into 4 files of length 70, 81, 85 and 128"
     data-fragment-index="4"
     />

Notes:

T: 17m00s

The other thing that I think this app demonstrates is how valuable it is to build something that you can tailor to your own needs. For example, eagle-eyed viewers may have noticed that in the latest version, there are actually 3 RSS feeds. The reason for this is that I get audiobooks from various sources, and they're not always in the exact same format. Sometimes they're one giant file, sometimes they are broken up into a million 5 minute-long files, neither of which really works for me. There is often chapter information available, so this would be an example of some book with chapter metadata, the units are all in minutes.

Eventually I added what is probably my favorite feature of the whole application, which breaks up big files and merges small files until I get something that is made up of chunks of about an hour. The naïve way to do this would be to just greedily combine files until you get to an hour, but this leaves you with some sub-optimal splits, including some that are way too short.

So the way I do it now, I can provide it an arbitrary cost function, and it will find the optimal way to split or merge the file that minimizes the total cost over the total audiobook. The default cost function is even an asymmetric cost function, that takes into account the fact that if I need something to be too short or too long, I'd prefer it to be too long.

This is a ridiculous feature. It brings in an ffmpeg dependency, it uses dynamic programming — I've literally never needed to use dynamic programming before outside of an interview context, but apparently *this situation* is exactly what we've all been practicing for — and if this were a commercial product I'm sure I would have prioritized things like user accounts or filtering by tag way, way before this thing, but honestly, it's my favorite part of the application.
