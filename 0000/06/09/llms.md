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

--

# LLMs make the easy stuff basically free

<style>
div.wide-code pre.code-wrapper {
    overflow-x: clip;
    max-width: 45dvw;
}

</style>

<div class="centered-container">
<div class="side-by-side">

<div class="left wide-code" style="margin-right: 3em;">
<b>Prompt</b>

````markdown
Please write me a Python script that takes a spreadsheet in this format as input:

```
Class	Child	Parent 1 Name	Parent 1 Email	Parent 1 Phone	Parent 2	Parent 2 Email	Parent 2 Phone
T1	Johnson, Thomas	Monica Johnson	monica.johnson@example.com	845-555-7632	Derek Johnson	derekjohnson@example.com	617-555-8291
T1	Rivera, Sophia	Elena Martinez	emartinez@example.com	781-555-4193	Miguel Rivera	miguelrivera@example.com	781-555-6047
```

The output of this should be a `.vcf` contact in the vCard format containing all
the selected contacts; there should also be an option to output one file per
classroom, or individual files. You should be able to specify the output file; for
configurations that generate more than one file, a separate input `--output-dir`
should be specified, and this option should be mutually exclusive with `--output`.

It should be possible to filter the selected contacts by class (allowing the
`--class parameter` to the script to be specified more than once to include more
than one class). It should also allow specifying --category any number of times,
which would set values for the `CATEGORY` of every member in the output.

To accomplish this, I recommend:

- Parse each line into `Child` and `Parent` objects (use frozen dataclasses for
  these), where `Parent` has attributes email and phone, and `Child` has attribute
  classroom, where `classroom` is one of T1, T2, P1, P2, PK. When sorting by
  `classroom`, it should sort in that order.

- Construct a mapping between `Parent` and a set of `Child` objects, so that we
  have an association between parents and their children. A given Parent may have
  more than one child.

...
````

</div>
<div class="right">

<b>Result</b>

```bash
$ uv run generate_vcard.py school-contacts.tsv --category=Boston \
                                               --output-mode=per-class \
                                               --output-dir=output-classes/
$ tree output-classes
output-classes/
├── P1.vcf
├── P2.vcf
├── PK.vcf
├── T1.vcf
└── T2.vcf

1 directory, 5 files
```

<br/>

```bash
$ uv run generate_vcard.py school-contacts.tsv --category=Boston \
                                               --output-mode=per-parent \
                                               --output-dir=output-example/

$ cat output-parents/Vorkosigan,Aral.vcf
BEGIN:VCARD
VERSION:3.0
CATEGORIES:Boston
EMAIL;TYPE=INTERNET,HOME:aral.vorkosigan@example.mil
FN:Aral Vorkosigan
ITEM1.X-ABLABEL:_$!<Spouse>!$_
ITEM1.X-ABRELATEDNAMES:Cordelia Naismith
ITEM2.X-ABLABEL:_$!<Child>!$_
ITEM2.X-ABRELATEDNAMES:Miles Naismith Vorkosigan
N:Vorkosigan;Aral;;;
TEL;TYPE=CELL:+1 999-555-1111
END:VCARD
```

</div>
</div>

--

# ML Models can be new components in your programs

<div class="centered-container fragment disappearing-fragment nospace-fragment fade-out" data-fragment-index="0">
<div>

<br/>

`getclip | python -m anki_lang_cards.org_to_csv`

<br/>


<div class="gallery two-wide">
<div class="gallery-item big-code">

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
<div class="gallery-item medium-code">

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

--

# General advice

<style>

div.bigger-uls li {
    margin-top: 1.5rem;
    margin-bottom: 1.5rem;
    font-size: 3rem;
}

div.bigger-uls li li {
    margin-left: 2rem;
}

</style>

<div class="centered-container bigger-uls">
<ul>
    <li class="fragment fade-in">LLMs are improving rapidly</li>
    <li class="fragment fade-in">LLMs can get you started really quickly on new technologies</li>
    <li class="fragment fade-in">
    Some stuff I use LLMs for while coding:
        <ul>
            <li>Generate boilerplate</li>
            <li>Write one-liners and small scripts</li>
            <li>Understanding long error messages</li>
            <li>Finding dumb mistakes</li>
            <li>Generating tests</li>
        </ul>
    </li>
</ul>
</div>
