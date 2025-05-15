# Case Study: Chord Identification Trainer

<div class="centered-container">
<img src="images/screenshots/study_abstract_00.png"
     class="screenshot splash">
</div>

Notes:

One of my projects that I think really illustrates the home-cooked meal idea is the Chord Identification Method trainer that I built; a few years ago I came across this study from a Japanese music school, which claimed that they have a method for teaching children between the ages of 2 and 6 to have perfect pitch which works by having them identify a series of chords.

The way it works is that the child does 5 sessions of 25 identifications every day. Each session is very short, true, but this requires that I am able to be near a piano with my son, 5 times a day. It also requires me to generate sequences of randomly-chosen chords by some unspecified method, and they also recommend that you keep records of how your child does. Obviously, none of this is going to happen, but you know what is basically always around, can make sounds, and is really good at generating pseudo-random sequences? Computers! And luckily, as we've already established, as a programmer I hold dominion over computers, and can bend them to my will.

--

# Feedback from your loved ones is fun

<img src="images/screenshots/chord-trainer-v00-red-yellow.png"
     class="screenshot splash fragment nospace-fragment disappearing-fragment fade-out"
     data-fragment-index="0">
<img src="images/screenshots/chord-trainer-v02-cat-faces.png"
     class="screenshot splash fragment disappearing-fragment nospace-fragment fade-in"
     data-fragment-index="0"
     alt="Screenshot of the application which now has a neutral cat emoji next to the progress numbers."
/>

Notes:

To solve this problem, I found an online piano, recorded a bunch of chords, and whipped up a simple web application that we could use with my son's tablet.

Unfortunately, I had some trouble getting my son to feel motivated by making a number go up, and so obviously I needed to add... cats! Now there was a kitty whose emotions reflect how well you are doing.

--

# Feedback from your loves ones is fun

<div class="centered-container">
<div class="gallery two-high nospace-fragment disappearing-fragment fragment fade-out" data-fragment-index="0">
<div class="gallery-item">
    <img src="images/screenshots/chord-trainer-v02-cat-hearts.png" class="screenshot"/>
</div>
<div class="gallery-item">
    <img src="images/screenshots/chord-trainer-v02-cat-eek.png" class="screenshot"/>
</div>
</div>

<div class="gallery two-wide two-high fragment fade-in"
     data-fragment-index="0">
    <div class="gallery-item">
        <img src="images/screenshots/chord-trainer-v02-cat-faces-0-happy.png"
             class="screenshot"
        />
    </div>
    <div class="gallery-item">
        <img src="images/screenshots/chord-trainer-v02-cat-faces-1-neutral.png"
             class="screenshot"
             />
    </div>
    <div class="gallery-item">
        <img src="images/screenshots/chord-trainer-v02-cat-faces-2-mad.png"
             class="screenshot"
        />
    </div>
    <div class="gallery-item">
        <img src="images/screenshots/chord-trainer-v02-cat-faces-3-sad.png"
             class="screenshot"
             />
    </div>
<div>
</div>

Notes:

When you get one right, she's happy, when you get one wrong, she's spooked! And her emotion varies from happy to sad depending on how well you are doing overall.

I think this is an example of something that was actually quite fun to build because my son and I were working together to build something that worked for both of us. He also had very strong opinions about how we should indicate when you have gotten a perfect score, and several other things. Sometimes he would chide me with stuff like, "How come you haven't added this feature yet?"

--

# My son shows off his inner hacker

<div class="centered-container">
<img src="images/generated/hacker_kid.png"
     alt="A generated image of a kid in a hoodie sitting in a dark room working on a computer with green screen on black text"
     class="splash fragment disappearing-fragment nospace-fragment fade-out"
     data-fragment-index="0">

<video controls autoplay muted class="fragment disappearing-fragment nospace-fragment fade-in-and-out" data-fragment-index="0">
    <source src="videos/color_change_hack.webm"
            type="video/webm">
</video>
</div>

Notes:

This also provided some awesome moments of parental pride, when I got to see my son's inner hacker. You see, when I first threw together the app, it was pretty janky. It was really not designed for the kid to use it themselves, but eventually my son wanted to occasionally just do it himself like a game — sure! And wow, he was improving fast! He started getting perfect scores on the 3-chord level almost immediately!

Of course, then I realized that he had found the bug where the score didn't change if you changed the level. He would go off into his room, turn it to the level he could do perfectly, and then change it back at the end and say, "Check it out, perfect score!"

Brings a tear to your eye to see the next generation of hacker growing up before your very eyes, but of course I had to fix that to up the challenge.

--

# Hacking the System: Part II

<div class="centered-container">
<video controls autoplay muted class="fragment disappearing-fragment nospace-fragment fade-out" data-fragment-index="0">
    <source src="videos/reset_hack.webm"
            type="video/webm">
</video>

<img src="images/screenshots/chord-trainer-v03-session-history-viewer.png"
     class="splash screenshot nospace-fragment fragment fade-in"
     data-fragment-index="0"
     alt="A screenshot of the 'Session History Viewer', which shows the stats for each
         recent session."/>

</div>

Notes:

That didn't stop my son, though! He also discovered that I had no way of knowing whether or not the chord trainer had gotten reset — and the rule for going to the next level was that he had to get 4 perfect scores *in a row*. So he would just do it over and over again, resetting any time he got one wrong until he got 25 perfect in a row.

I did figure out that he was doing that because a 5-year-old lacks a certain amount of guile, but incidentally I was working on a session history viewer feature /anyway/, which eliminated this little hack.

--

# You can use software to connect to those around you

<div class="centered-container">
<img src="images/screenshots/chord-trainer-video-00.png"
     class="screenshot splash fragment nospace-fragment disappearing-fragment fade-out"
     data-fragment-index="0">
<img src="images/pictures/conference-photo.jpg"
     class="splash fragment nospace-fragment disappearing-fragment fade-in"
     data-fragment-index="0">
</div>

--

# Progress

<div class="centered-container">
<video controls>
    <source src="videos/chord_identification.webm"
            type="video/webm">
</video>
</div>

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
