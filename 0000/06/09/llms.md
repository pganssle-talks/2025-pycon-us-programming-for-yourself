# LLMs are changing the bespoke application landscape

<img src="images/screenshots/claude-textual-ui-00.png"
    class="screenshot splash fragment disappearing-fragment nospace-fragment fade-out"
    data-fragment-index="0"/>

<div class="gallery two-high">
    <div class="gallery-item">
        <img src="images/screenshots/claude-textual-ui-01.png"
            class="screenshot fragment nospace-fragment fade-in"
            data-fragment-index="0"/>
    </div>
    <div class="gallery-item">
        <img src="images/screenshots/claude-textual-ui-02.png"
            class="screenshot fragment nospace-fragment fade-in"
            data-fragment-index="0"/>
    </div>
</div>

<div class="caption">LLMs let you be more ambitious</div>

Notes:

T: 24m45s

So this brings me to another point, which is the role of LLMs in bespoke applications. When I first conceived of this talk, I did not propose to discuss LLMs at all, because they were not that useful, but I'm finding that the LLMs we have right now are /really/ good for this kind of thing. For one thing, they let you take on more ambitious projects than you thought otherwise might be able to because they help with a lot of the boilerplate and I find that they tend to be highest leverage at getting me up to speed with a new technology, because they will generate some code that more or less works, and then I can ask follow-up questions about how it's supposed to work and what it's supposed to be doing.

When I was building the Textual UI, I had never used Textual before, so I asked an LLM for what I wanted, and it didn't work at first, but after a bit of back and forth I had something I could reasonably debug, and I'm confident that that I was only able to fit that project in the amount of time I had available to do it because of the leverage the LLM provided.

--

# LLMs make the easy stuff basically free

<div class="centered-container">
<div class="side-by-side">

<div class="left-container left">
<b>Prompt</b>

<blockquote>

Please write me an imagemagick or other command line command that takes a
number of images and removes a section from the middle of it (along the y
axis). So if I have an image that is 500 pixels tall, and I specify `FROM=200`
and `TO=250`, I want the result to be an image that is 450 pixels tall (because
50 rows of pixels have been removed), and the missing section should start 200
pixels from the top and go until 250 pixels from the top.

</blockquote>

</div>
<div class="right left-container">

<b>Result</b>

```bash
#!/bin/bash

FROM=200
TO=250

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
```

</div>
</div>

Notes:

T: 25m30s

Similarly, on the extreme low end, LLMs can make some of the easy stuff basically free. When I was putting together this talk, I needed a way to cut a chunk out of the middle of a bunch of screenshots, so I wrote up a quick prompt describing what I wanted, got a result and it worked the first time. The whole interaction took about a minute and I didn't have to try to remember how to do anything in bash or read any man pages.

--

# ML Models can be new components in your programs

<div class="centered-container fragment disappearing-fragment nospace-fragment fade-out" data-fragment-index="0">
<div>

<br/>

`getclip | python -m anki_lang_cards.org_to_csv`

<br/>


<div class="gallery two-wide">
<div class="gallery-item medium-code left-container">

<h3>Input</h3>

```
- [ ] tienes más cara que espalda = ?
- [ ] tiquismiquis = ?
- [ ] chute = shot, goal
- [ ] un hueso duro de roer = a tough nut to crack
- [ ] fiaca = lazy (Argentina)
- [ ] quintal = a lot?
```

</div>
<div class="gallery-item medium-code left-container">

<h3>Output</h3>


```
,tienes más cara que espalda,you have a lot of nerve,v phr,,,,,
,tiquismiquis,"fussiness, nitpicking",nm,el,,,,
,chute,"shot, goal",nm,el,,,,
,un hueso duro de roer,a tough nut to crack,v phr,,,,,
,fiaca,laziness (Argentina),nf,la,,,,
,quintal,"hundredweight, a large amount",nm,el,,,,
```

</div>
</div>
</div>
</div>

<div class="centered-container fragment nospace-fragment fade-in" data-fragment-index="0">

<img src="images/screenshots/sumana-blog-whisper.png"
     class="splash screenshot"/>

https://www.harihareswara.net/posts/2022/speech-to-text-with-whisper-how-i-use-it-why/

</div>

Notes:

T: 27m

The other thing that ML models can do is act as components in your programs, doing things that were previously difficult or maybe even impossible to do. Long ago I tried doing other flash card generating things and I often was stmied by the complexity of NLP applications, headword stemming, that sort of thing. Now, I can do things like this where I can just take notes on new Spanish words I encounter, sometimes with definitions and sometimes not, and I just pipe them into something that cleans them up and gets them ready to go into the flash card generator.

There are also non-LLM ML models getting better all the time. A few years ago I read a blog post by my friend, open source and Python legend Sumana, where she talks about using self-hosted instances of Whisper for speech recognition. This inspired me to set up a pipeline where my personal voice memos that I take about my children's lives and growth milestones can be automatically transcribed, so I can easily search through them.
