# Not every project is big!

<div class="centered-container">
<figure>
<img src="images/figures/gym-calibration.png"
    alt="4 matplotlib figures representing Cable 1, 2, 3 and 4 Resistance. They all show a dashed straight line through a number of points, and each has a legend showing R² of between 0.9975 and 0.9997. The Y axis is ¨Actual Resistance (lbs)¨ and the X axis is ¨Nominal Weight (lbs)¨. The y values vary from 10 to 70 and the x values vary from 20 to 160."
    class="figure splash"/>

<figcaption>The cable machines in the Google Cambridge gym have ~2.2x leverage over the nominal weights</figure>
</figure>
</div>

Notes:

T: 18m30s

OK, so I've told you about a few of my big projects, but I don't want to leave you with the impression that every project you do has to be some big thing. Some of my most satisfying uses of programming for myself are times when I had a question that I wanted to answer, and I could use a computer to do it. For example, a few years ago I noticed that when I was at the gym at Google, I could lift like a ton of weight on the cable machines. 180 pound tricep pushdowns, no problem. For some reason, when I am travelling, I have to set the rack like less than half of that.

There are two obvious conclusions here: either Google offices make you extremely strong or traveling makes you extremely weak. But then I hit upon a third, clearly less likely option, which is that the pulleys on cable machines might be providing leverage. I wanted to quantify this, so I got a luggage scale and hooked it up to the cable machine, then figured out how much weight it was experiencing with each plate. I plugged this into a colab, which is like a jupyter notebook, but easier for me to share with other people at Google, and found that at the Cambridge gym the cable machine has a 2.2x leverage!

--

# Not every project is big!

## Example: Podcast normalization

<div class="centered-container">
<div class="gallery two-wide">
<div class="gallery-item">
    <img
        src="images/figures/seattle-library-podcast-2014-10-28.png"
        alt="A matplotlib figure with 5 lines representing the average loudness of a Seattle Public Library podcast from 2014. The true dbFS is a black dashed line at around -35, a red line labeled ¨random¨ wobbles around this a bit, but is basically tracking it perfectly for the whole graph, a line labeled start starts out very low and then shoots up after ~10,000 samples, then slowly start converging towards the true value, never reaching it. A line representing the end starts low and follows a gentle curve towards the true line, but never gets higher than -50 after ~80000 samples. A line labeled ¨middle¨ starts close to the true value, shoots up, then converges to the true value after ~30,000 samples."
        class="figure"
    />
</div>
<div class="gallery-item">
    <img
        src="images/figures/triunvirato-podcast-2015-03-31.png"
        alt="A similar matplotlib figure, this time representing an episode of Triunvirato from 2015. The black dbFS is near -26. The red line again tracks it basically perfectly from the start. All the other lines miss the mark by a lot; middle starts out closest but ends up at around -38 after ~90,000 samples. ´Start´ starts out very low, then has a major leap at around 15000 samples, then almost converges to the true value, then diverges a bit, ending up at ~35. End starts out at -95 and doesn't start inching up until ~70,000 samples and even then only makes it to ~-88dB"
        class="figure"
    />
</div>
</div>

<div class="gallery">
<div class="gallery-item">
<pre>                                      |                         dBFS                         |
| Name                                |   True   |  Start   |  Middle  |   End    |  Random  |
|=====================================|==========|==========|==========|==========|==========|
|10-percent-of-brain                  |<b>  -33.65  </b>|  -36.78  |  -39.18  |  -36.78  |<font color="#10BA13">  -33.43  </font>|
|triunviratopodcast6-3-31-2015        |<b>  -26.63  </b>|  -31.13  |  -33.73  |  -31.13  |<font color="#10BA13">  -26.64  </font>|
|ancient-greek-music                  |<b>  -20.45  </b>|<font color="#F61010">  -82.81  </font>|  -16.94  |<font color="#F61010">  -82.81  </font>|<font color="#10BA13">  -20.44  </font>|
|serial-episode-07                    |<b>  -19.04  </b>|<font color="#10BA13">  -19.13  </font>|  -20.78  |<font color="#10BA13">  -19.13  </font>|<font color="#10BA13">  -18.99  </font>|
|seattle-library-podcast-2014-10-28   |<b>  -34.13  </b>|  -28.08  |<font color="#10BA13">  -33.97  </font>|  -28.08  |<font color="#10BA13">  -34.06  </font>|
|spy-museum-podcast-2014-11-07        |<b>  -21.97  </b>|<font color="#F61010">  -42.74  </font>|  -17.81  |<font color="#F61010">  -42.74  </font>|<font color="#10BA13">  -22.00  </font>|
</pre>
</div>
</div>
</div>

Notes:

T: 20m

Another example like this is a little project I did about 14 years ago. Back then, podcasts weren't nearly as professionally produced as they are today, and I found that there was an incredible amount of inconsistency between how they were mastered. Some of them were really loud and some of them were really quiet. But the thing is, they are pretty consistent throughout, and they're also very long files, so I was wondering how well you could estimate the amount of correction to the levels you would need to apply to normalize the audio *without* reading the whole file.

I found that as you might expect, reading from the beginning or end of the file was not that consistent, because they usually have intro or outro music or something that is different from the bulk of the file. The middle was a lot better, but not consistently getting to the "true value", even for the relatively small sample I tested.

However, I found that if you just took samples from the file randomly, you would converge on the true value remarkably quickly, using something like 2 seconds of audio from an hour+ long file. Very interesting result, and something that I'd love to see implemented in a podcast player (specifically AntennaPod, which is open source, hint hint all you developers looking for projects).

--

# Not every project is big!

<div class="centered-container">
<img src="images/screenshots/anki-nightingale-00.png"
    alt="A screenshot of an Anki card labeled ´el ruiseñor, nm´, followed by a play button and a button labeled ´Example Sentence´. There is a settings gear in the bottom right corner."
    class="fragment mobile-screenshot screenshot disappearing-fragment nospace-fragment fade-out"
    data-fragment-index="0"/>
<img src="images/screenshots/anki-nightingale-01-sentence.png"
    alt="The same screenshot as before, but with a Spanish sentence revealed, ´Los poetas románticos a menudo escribían sobre el melodioso canto del ruiseñor', followed by a play button"
    class="fragment mobile-screenshot screenshot disappearing-fragment nospace-fragment fade-in-and-out"
    data-fragment-index="0"/>
<img src="images/screenshots/anki-nightingale-02-sentence-english.png"
    alt="Same as before, but now there is an English translation: nightingale; Romantic poets often wrote about the melodious song of the nightingale. There is also a citation below showing that this was generated by claude-3-5-sonnett-20241022 on 2025-02-16."
    class="fragment mobile-screenshot disappearing-fragment nospace-fragment screenshot fade-in-and-out"
    data-fragment-index="1"/>
<img src="images/screenshots/anki-nightingale-03-settings.png"
    alt="Same as the previous screenshot, but now there are also some settings checkboxes below the Spanish sentence (Automatically read word/sentence, automatically show sentence, and an input box showing an adjustable 2500 millisecond delay before reading the sentence."
    class="fragment mobile-screenshot screenshot nospace-fragment fade-in"
    data-fragment-index="2"/>
</div>

Notes:

T: 21m15s

Another little project I have is that I use Anki all the time, which is a spaced repetition flash card system. When I learned that you could put Javascript in the cards, it was somewhat dangerous knowledge for me, since it let me start expanding what I could do with cards.

The method I'm using to learn spanish initially recommends that you don't do too much reading in favor of listening in context, but I still wanted flash cards, so I added some javascript that would automatically read words to me, first by themselves, and then in context. Then if you notice I added this little settings button, which when you expand it, it lets you use this janky little interface to decide what gets read and when.

The thing is, now that I was using Javascript already, I realized that it might be nice to hear words in a lot of different contexts, so I added something that randomly chooses a sentence from a pre-set list of sentences, encoded in JSON in a field on the card. But then I needed a source of natural, native-sounding sentences.

--

# Not every project is big!

<div>

<pre class="code-wrapper">
<code data-trim data-noescape class="language-python">
<span class="fragment semi-fade-out" data-fragment-index="0">
SENTENCE_PROMPT: Final[str] = """\
You are an expert Spanish teacher and lexicographer, whose specialty is designing excellent example sentences that show
off the range of uses of a given word.

I am going to give you valid JSON representing a term ("term") in Spanish and its meaning in English ("meaning"). I
would like you to generate valid JSON containing 4 example sentences in idiomatic Spanish that use the term accompanied
by a translation from the original Spanish into English; the example sentences should use the sense of the term that has
the meaning specified by the English meaning. When the word is a verb, select different moods and tenses in the
different sentences. The translations do not need to be word-for-word translations, it is more important that they
capture the general spirit of the original Spanish.

</span><span class="fragment custom bolds" data-fragment-index="0">In some of your example sentences, it would be a bonus if they contain useful or interesting facts.</span>
<span class="fragment semi-fade-out" data-fragment-index="0">

Example:
========
INPUT:
----------
{
    "term": "casa",
    "part_of_speech": "nf",
    "meaning": "house"
}

OUTPUT:
--------------
{
    "term": "casa",
    "meaning": "house",
    "examples": [
        {
            "spanish": "La casa de mi abuela está en el campo.",
            "english": "My grandmother's house is in the country."
        },
        {

...
"""
</span>
</code>
</pre>

<div><em>You know what's really good at languages? A Large Language Model</em></div>

</div>

Notes:

T: 21m30s

And it turns out that that's something LLMs are *really* good at, so I created this prompt to take words and their meanings and generate sentences. And the part of this I'm most proud of is this line, which tells the LLM that if the sentence can double as an interesting fact, go for it.

--

<!-- .slide: data-transition="none" -->

# Not every project is big!

<div class="gallery three-wide">
    <div class="gallery-item">
        <img src="images/screenshots/anki-nightingale-04-distinct-sounds.png"
             alt="Screenshot of an Anki card for ´el ruiseñor´ with the sentence ´El ruiseñor común puede producir más de 1000 diferentes sonidos distintos´ / ´The common nightingale can produce more than 1000 different sounds.´"
             class="screenshot mobile-screenshot"
        >
    </div>
    <div class="gallery-item">
        <img src="images/screenshots/anki-nightingale-05-full-moon.png"
             alt="Screenshot of an Anki card for ´el ruiseñor´ with the sentence ´El canto del ruiseñor es más potente durante las noches de la luna llena´ / ´The nightingale's song is strongest during full moon nights.´"
             class="screenshot mobile-screenshot"
        >
    </div>
    <div class="gallery-item">
        <img src="images/screenshots/anki-nightingale-06-borges.png"
             alt="Screenshot of an Anki card for ´el ruiseñor´ with the sentence ´Hay un ruiseñor y una noche.´ / ´There is a nightingale and a night.´ The citation says that this comes from Jorge Luis Borges's Ficciones, ¨Examen de la obra de Herbert Quain¨ p114-115"
            class="fragment mobile-screenshot screenshot fade-in"
            data-fragment-index="2"
        >
    </div>
</div>

Note:

T: 23m

And you can see it works really well! It tends to give me a lot of interesting animal facts. Mostly they seem real, too, some of them are made up. I could have sworn that this full moon one was going to be made up, but actually that one appears to be real.

But now I'm far enough along in learning Spanish that I've started doing a lot of reading, and reading is a big source of new vocabulary, and I wanted an easy way to turn those into flash cards, so I wrote a script that extracts annotations from my e-reader, and then takes the sentences that the word appeared in and turns that into an example sentence.

And as you can see, I also have it generating a little bit of source information. This is important because I know that when something came from a Jorge Luis Borges book, it is probably some extremely obscure thing and if I use that word Spanish speakers will look at me funny. Half the time I looked up a word in his books I didn't know the word for the concept in /english/.

--

<h1> <span class="fragment nospace-fragment disappearing-fragment fade-out" data-fragment-index="1">Not every project is big!</span>
<span class="fragment nospace-fragment fade-in" data-fragment-index="1">Sometimes your small projects <b>become<b> big</span></h1>

<div>
<img src="images/screenshots/anki-textual-lite-word-merger.svg"
     alt="Screenshot of a Textual UI merging 3 versions of ´sacar de quicio´, which means ¨to drive someone crazy, make them lose their cool¨. The UI shows more information about the part of speech, Article and number of examples (total = 8). There are 6 options for what to do: Back, Accept Merge, Edit Merge, Choose Word, Refresh and Quit. In the title bar you can see that this is word 16 of 158."
     class="screenshot splash">
<div class="caption">Using Textual to create a proper UI to resolve word conflicts</div>
 </div>

 Notes:

 T: 23m30s
 
 This was all well and good, but then I found that with all these new words coming in, I was seeing a lot of conflicts with words already in the deck, and I was spending a lot of time resolving these conflicts, so I whipped up this little user interface with Textual to make it easier to resolve the conflicts. And you know what I'm realizing now? This slide was supposed to be all about little projects, but uh.. that title isn't exactly appropriate at this point is it? Because actually what I'm demonstrating here is the way that small projects have a way of turning into big projects when you are really using the things you're working on.
