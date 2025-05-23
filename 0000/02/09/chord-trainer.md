# Case Study: Chord Identification Trainer

<div class="centered-container">
<img src="images/screenshots/study_abstract_00.png"
     alt="Abstract of a study called 'A longitudinal study of the process of acquiring absolute pitch: A practical report of training with the ´chord identification method´'. It is published in Psychology of Music 2014, Vol. 42(1) 86-111."
     class="screenshot splash">
</div>

Notes:

T: 4m

One of my projects that I think really illustrates the home-cooked meal idea is the Chord Identification Method trainer that I built; a few years ago I came across this study from a Japanese music school, which claimed that they have a method for teaching children between the ages of 2 and 6 to have perfect pitch which works by having them identify a series of chords.

The way it works is that the child does 5 sessions of 25 identifications every day. Each session is very short, true, but this requires that I am able to be near a piano with my son, 5 times a day. It also requires me to generate sequences of randomly-chosen chords by some unspecified method, and they also recommend that you keep records of how your child does. Obviously, none of this is going to happen, but you know what is basically always around, can make sounds, and is really good at generating pseudo-random sequences? Computers! And luckily, as we've already established, as a programmer I hold dominion over computers, and can bend them to my will.

--

# Feedback from your loved ones is fun

<img src="images/screenshots/chord-trainer-v00-red-yellow.png"
     class="screenshot splash fragment nospace-fragment disappearing-fragment fade-out"
     alt="A black screen with the words ´Chord Identification Method Trainer´ at the top, with a small circled info button. Under that is a play button and a greyed-out right arrow. Below that are two squares, one red and one yellow, and under that is a score (0/0) with a ´reset´' button next to it. The lowest element on the page is a pulldown that says ´Yellow (CFA)´. It looks fine but crude, elements aren't centered or anything of that nature."
     data-fragment-index="0">
<img src="images/screenshots/chord-trainer-v02-cat-faces.png"
     class="screenshot splash fragment disappearing-fragment nospace-fragment fade-in"
     data-fragment-index="0"
     alt="Screenshot of the application which now has a neutral cat emoji next to the progress numbers."
/>

Notes:

T: 4m30s

Now, normally, I don't build web applications, but a web application seemed likely to be the easiest thing to deploy to tablets and phones on different platforms, so to solve this problem, I found an online piano and whipped up a little web app using a static site generator and some Javascript, and we started using it with my son's tablet.

Unfortunately, I had some trouble getting my son to feel motivated by making a number go up, and so obviously I needed to add... cats! Now there was a kitty whose emotions reflect how well you are doing.

--

# Feedback from your loves ones is fun

<div class="centered-container">
<div class="gallery two-high nospace-fragment disappearing-fragment fragment fade-out" data-fragment-index="0">
<div class="gallery-item">
    <img
        src="images/screenshots/chord-trainer-v02-cat-hearts.png"
        alt="Cropped screenshot of the chord trainer application. Red has been selected and is correct. The cat emoji now has hearts in its eyes. 😻"
        class="screenshot"/>
</div>
<div class="gallery-item">
    <img
        src="images/screenshots/chord-trainer-v02-cat-eek.png"
        alt="Cropped screenshot of the chord trainer application. Red has been selected and is incorrect. The cat emoji is spooked. 🙀"
        class="screenshot"/>

</div>
</div>

<div class="gallery two-wide two-high fragment fade-in"
     data-fragment-index="0">
    <div class="gallery-item">
        <img src="images/screenshots/chord-trainer-v02-cat-faces-0-happy.png"
             alt="Smiling cat emoji (😸) next to a 3/3 (100%) score."
             class="screenshot"
        />
    </div>
    <div class="gallery-item">
        <img src="images/screenshots/chord-trainer-v02-cat-faces-1-neutral.png"
             alt="Slightly smiling cat emoji (🐱) next to a 3/4 (75%) score."
             class="screenshot"
             />
    </div>
    <div class="gallery-item">
        <img src="images/screenshots/chord-trainer-v02-cat-faces-2-mad.png"
             alt="Mad cat emoji (😾) next to a 3/5 (60%) score."
             class="screenshot"
        />
    </div>
    <div class="gallery-item">
        <img src="images/screenshots/chord-trainer-v02-cat-faces-3-sad.png"
             alt="Sad cat emoji (😿) next to a 3/5 (60%) score."
             class="screenshot"
             />
    </div>
<div>
</div>

Notes:

T: 5m30s

When you get one right, she's happy, when you get one wrong, she's spooked! And her emotion varies from happy to sad depending on how well you are doing overall.

I think this is an example of something that was actually quite fun to build because my son and I were working together to build something that worked for both of us. He also had very strong opinions about how we should indicate when you have gotten a perfect score, and several other things. Sometimes he would chide me with stuff like, "How come you haven't added this feature yet?"

--

# My son shows off his inner hacker

<div class="centered-container">
<img src="images/generated/hacker_kid.png"
     alt="A generated image of a kid in a hoodie sitting in a dark room working on a computer with green screen on black text"
     class="splash fragment disappearing-fragment nospace-fragment fade-out"
     data-fragment-index="0">

<video controls autoplay muted class="fragment disappearing-fragment nospace-fragment fade-in-and-out" data-fragment-index="0"
    aria-label="Screen capture of the chord trainer application. A perfect score is achieved on the red/yellow label, showing 5/5 (100%), then the level is changed to red/yellow/blue and the perfect score remains."
    >
    <source src="videos/color_change_hack.webm"
            type="video/webm">
</video>
</div>

Notes:

T: 6m30s

This also provided some awesome moments of parental pride, when I got to see my son's inner hacker. You see, when I first threw together the app, it was pretty janky. It was really not designed for the kid to use it themselves, but eventually my son wanted to occasionally just do it himself like a game — sure! And wow, he was improving fast! He started getting perfect scores on the 3-chord level almost immediately!

Of course, then I realized that he had found the bug where the score didn't change if you changed the level. He would go off into his room, turn it to the level he could do perfectly, and then change it back at the end and say, "Check it out, perfect score!"

Brings a tear to your eye to see the next generation of hacker growing up before your very eyes, but of course I had to fix that to up the challenge.

--

# You can use software to connect to those around you

<div class="centered-container">
<img src="images/screenshots/chord-trainer-video-00.png"
     class="screenshot splash fragment nospace-fragment disappearing-fragment fade-out"
     alt="Paul and his son (a boy of around 5) at a table with a microphone and the chord trainer overlaid in the bottom left corner. THey are both wearing shirts with a space pattern and taco-cats (cats sticking out of tacos). The boy is also wearing headphones with cat ears. The application shows 12/12 (100%)"
     data-fragment-index="0">
<img src="images/pictures/conference-photo.jpg"
     alt="Paul (a man with brown hair and a beard in his late 30s) and his son. They are wearing conference lanyards and are standing in front of a projector that says ´Welcome Nerds! March 8-9, 2024, new england regional developers. UMass Amherst Campus Center"
     class="splash fragment nospace-fragment disappearing-fragment fade-in"
     data-fragment-index="0" style="border: 2px solid black;">
</div>

Notes:

T: 8m

The other thing that's great about this project is that it's given me lots of opportunities to connect with my son. At some point I wanted to make a little video to put on YouTube explaining to people how to use the app, and my son was super excited to do it together, he was super excited to be on a Youtube channel and to show off that he knew all the rules and that he was mastering chord identification.

And last March, I put together a presentation about this project that was given at the NERD Summit in western Massachusetts, and my son got to join me on stage as part of the talk, which was really fun­— he got to feel the pride of his accomplishments with his first time presenting at a conference, plus it didn't hurt that we got to stay in a hotel.

With this project in particular, I am often asked whether it's something I'd like to start selling or build a business around, and my answer is basically always no. I'm not saying it would be wrong or bad to make money from my work, but I don't want to worry about prioritizing user features, or features that drive engagement or retention. I am happy to make this available and use it to connect with my family. Though I have started to get a number of other parents contacting me saying that they've been using the app, and it is nice to know that other families are getting some joy out of it as well.

--

# Progress

<div class="centered-container">
<video controls
    aria-label="Video of a child using a tablet with an overlay of the application in the corner. He calls out chord names and presses the corresponding button, getting them all right. The chords are chosen randomly from 13 options, arranged in a grid. Each option has its own color and the chord components in western (A-G) notation."
    >
    <source src="videos/chord_identification.webm"
            type="video/webm">
</video>
</div>

Notes:

T: 9m15s

OK, so at this point, it would be unfair of me to tell you that I built this app 2 years ago and then not tell you how it's been going. I will not sugar-coat this, I would say it's going OK. He can consistently identify 13 chords, and he's /really/ good at it, as you'll see in the video. He doesn't seem to be identify individual notes, though according to the book that should just start happening naturally, so I don't know if he will actually acquire absolute pitch from this or not, but what he can do is already quite impressive, take a look:

--

<style>
div#logo-container {
    display: flex;
    flex-direction: row;
    justify-content: space-evenly;
    width: 95dvw;
}

div.logo-entry {
    display: flex;
    flex-direction: row;
    align-items: center;
    font-size: 1.5em;
}

div.logo-entry img.logo {
    height: 1.5em;
    max-height: 1.5em;
    margin-right: 0.2em;
}

</style>

<div class="centered-container">
<img src="images/pictures/timepandamax_banner_like_and_subscribe.png"
     alt="A large image showing a Minecrat avatar that is in clashing cyan and pink and with an 8-bit-style face drawn on. He is standing in front of a circle of armor stands with sand heads in Minecraft. Below that it says, ¨Like and Subscribe¨ in a sort of comical bouncy font, in blue with orange and red flames coming off every letter."
     class="splash">

<div id="logo-container">
    <div class="logo-entry">
        <img src="external-images/logos/youtube.svg" class="logo"/>
        <a href="https://youtube.com/@TimePandaMax">TimePandaMax</a>
    </div>
    <div class="logo-entry">
        <img src="external-images/logos/twitch.svg" class="logo"/>
        <a href="https://twitch.tv/timepanda920621">timepanda920621</a>
    </div>
</div>
</div>

Notes:

T: 9m45s

And as compensation for helping me out with the video, I have agreed to use this time to tell you all about my son's Youtube Channel, which is TimePandaMax on Youtube, and so far consists of gaming live streams, so if you are interested in watching a 7-year-old play Portal 2 or Minecraft, uh... smash that... bell? And don't forget to like and subscribe! His goal is to get 1 million followers, so I'm sure he would appreciate it.
