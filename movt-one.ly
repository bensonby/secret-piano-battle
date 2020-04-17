ffBrillante = \markup \concat { \dynamic "ff" \italic \larger "  brillante" }
fBrillante = \markup \concat { \dynamic "f" \italic \larger "  brillante" }
pCustom = \markup \concat { \dynamic "p" \italic \larger " " }
fLegatoELeggiero = \markup \concat { \dynamic "f" \italic \larger "  legato e leggiero" }
sempreLegato = \markup \italic \larger "sempre legato"
rall = \markup \bold \larger "rall."
aTempo = \markup \bold \larger "a tempo"
espressTxt = \markup \italic \larger "espress."
cresc = \markup \italic \larger "cresc."
posScriptA = \once \override TextScript.extra-offset = #'( 0.9 . 0 )
lh = \markup \italic \larger \center-align "l.h."
glissandoA = \once \override Glissando.bound-details = #'(
  (right
    (attach-dir . -1)
    (end-on-accidental . #t)
    (padding . 1.2)
  )
  (left
    (attach-dir . 1)
    (padding . 1.2)
  )
)

beamSettings = {
  \set subdivideBeams = ##t
  \set baseMoment = #(ly:make-moment 1/8)
  \set beatStructure = #'(1 1 1 1)
}

rest-duration-one = {
  s2*23
}

intro = \relative c''''' {
  \tag #'print {
    << {
      \newSpacingSection
      \override Score.SpacingSpanner.spacing-increment = #3.5
      \stemNeutral
      \ottava #1
      \ottava-one-short
      \instructionI
      \glissandoA
      \override Score.FootnoteItem.annotation-line = ##f
      \footnote "**" #'(0.5 . 1.5) \markup { "** Black-key glissando in bar 1 and 2. Piano II needs not play these two bars." }
      ges8\glissando
      \ottava #0 \hideNotes bes,,,,\noBeam \unHideNotes
      \newSpacingSection
      \override Score.SpacingSpanner.spacing-increment = #4.5
      \glissandoA
      \ottava #1
      \ottava-one-short
      des'''4\glissando \ottava #0
      \cl
      \newSpacingSection
      \override Score.SpacingSpanner.spacing-increment = #6.5
      \glissandoA
      ges,,,,,,4\glissando
      \cr
      \stemNeutral
      \ottava #1
      \ottava-one-short
      ges''''''8 \ottava #0
    } \\ {
      s8
      \newSpacingSection
      \override Score.SpacingSpanner.spacing-increment = #3.5
      \posScriptA
      \glissandoA
      bes,,8\glissando^\lh
      \hideNotes ges,8\noBeam \unHideNotes s8 % an octave higher because of the 8va sign in the other voice
    } >>
  }
  \newSpacingSection
  \revert Score.SpacingSpanner.spacing-increment
  \tag #'midi {
    \tuplet 20/16 {
      ges'''''128 ees des bes aes ges ees des
      bes aes ges ees des bes aes ges
      ees des bes aes
    }
    << { ges16 } \\ {
      \tuplet 22/16 {
        bes''128 aes ges ees des bes aes ges
        ees des bes aes ges ees des bes
        aes ges ees des bes aes
      }
    } >>
    << { ges16} \\ {
      \tuplet 28/16 {
        des'''''64 bes aes ges ees des bes aes
        ges ees des bes aes ges ees des
        bes aes ges ees des bes aes ges
        ees des bes aes
      }
      \tuplet 30/16 {
        ges64 aes bes des ees ges aes bes
        des ees ges aes bes des ees ges
        \tempo 8 = 160
        aes bes des ees ges aes bes des
        \tempo 8 = 140
        ees ges aes bes des ees
      }
      \tempo 8 = 176
      ges8
    } >>
  }
  r8
}

theme-A-rh = \relative c'''' {
  \tuplet 3/2 8 {
    \ottavaShorterEndA
    \ottava #1
    \ottava-one-short
    g16 b d, g e g d g b, \ottava #0 d g, b
    \omit TupletNumber
    g b d, g e g d g b, d g, b
    d, d' a d a a' a, a' e a e e'
    e, e' a, \ottavaShorterEndA \ottava #1 \ottava-one-short e' a, a' a, a' d, a' d, d'
    g,16 b d, g e g d g b, \ottava #0 d g, b
    g b d, g e g d g b, d g, b
  }
}

theme-A-lh = \relative c' {
  \tag #'midi { \tempo 8 = 176 }
  <g b d g>8-. <g c e g>-. <g b d g>-. r
  <g g,>-. <c e g>-.[ <b d g>-.] r
  <d, d,>-. <a' d fis>-.[ <a c e>-.] a,
  << { r8 <a' c e>->-.[ <a c d>-.] } \\ { d,4. } >> r8
  <g b d g>8-. <g c e g>-. <g b d g>-. r
  <g g,>-. <c e g>-.[ <b d g>-.] r
}

theme-B-rh = \relative c' {
  \tuplet 3/2 8 {
    ees16 ees' aes, ees' aes, aes' ees aes ees \ottavaShorterEndA \ottava #1 \ottava-one-short ees' aes, aes'
    \repeat unfold 6 { bes, bes' }
    <<
      { \repeat unfold 6 { b, b' } }
      { \textScriptShiftB s16^\rall s16*10 s16\fermata }
      { \tag #'midi {
        s16\tempo 8 = 126
        s16*8 s16\tempo 8 = 90
        s16\tempo 8 = 70
        s16\tempo 8 = 20
      }}
    >>
  }
}

theme-B-lh = \relative c {
  ces8 <aes' ees'>4-> ces,8
  <bes f' d'>2\arpeggio
  <b g' d'>2\arpeggio
}

theme-C-rh = \relative c' {
  \tuplet 3/2 8 {
    e16 e' a, e' a, a' e, e' a, e' a, a'
    d,, d' g, d' g, g' g, g' d g d d'
    c c, e b' b, e g a b d, e g~
    g b d, g e g d g b, d g, b
    g b d, g e g d g b, d g, \override VoiceFollower.style = #'dashed-line \showStaffSwitch b
  }
  % switch hands in notations for cross staff line
  \cl <g,, g'>8-. r q-> r
}

theme-C-lh = \relative c {
  <<
    { cis8 s c s b s e s a, s d s }
    { s8 <a' e'> s q s <g d'> s <b e> s <b c e> s <a d fis> }
  >>
  g,-. <c' e g>-.[ <b d g>-.] r
  <g, g,>-. <c e g>-.[ <b d g>-.] r

  % switch hands in notations for cross staff line
  \cr r4 <g''' b d g>8-> r
}

movt-one-rh = \relative c' {
  \clef treble
  \metronomePaddingA
  \tempo "Vivace" 8 = 176
  \tag #'midi { \tempo 8 = 176 }
  \time 2/4
  \key ges \major
  \beamSettings
  \intro
  <<
    \transpose g ges { \theme-A-rh }
    {\tuplet 3/2 8 { s16\( s16*22 s16\) } s2^\sempreLegato}
  >>
  \theme-B-rh
  \key g \major
  <<
    { \theme-A-rh }
    { \textScriptShiftB s2^\aTempo }
  >>
  \theme-C-rh
  \bar "|."
}

movt-one-lh = \relative c {
  \set fingeringOrientations = #'(down)
  \clef bass
  \time 2/4
  \key ges \major
  s8 s8 s4 s2
  \transpose g ges { \theme-A-lh }
  \theme-B-lh
  \key g \major
  \theme-A-lh
  \theme-C-lh
  \bar "|."
}

movt-one-dynamics = {
  % intro
  s2-\ffBrillante s2

  % theme A
  s2-\fLegatoELeggiero s2-\pCustom s4 s4-\cresc s2
  s2\f s2\p

  % theme B
  s4 s4\< s4\! s4\> s2\!\mf

  % theme A
  s2\f s2\p s4 s4-\cresc s2
  s2\f \dynamicShiftC s2\mp

  % theme C
  s2-\espressTxt s2 s2-\cresc
  s2-\fBrillante
}

movt-one-dynamics-pedal = {
  \set Staff.pedalSustainStyle = #'bracket
  % intro
  s2\son s4 s4\soff

  % theme A
  s2 s8\son s4.\soff
  \tag #'midi {
    s8\son s8\soff s8..\son s32\soff
    s8\son s8\soff s8..\son s32\soff
    s2 s8\son s4.\soff
  }
  \tag #'print {
    s8\son s8\soff s4\son
    s8\soff\son s8\soff s4\son
    s2\soff s8\son s4.\soff
  }

  % theme B
  \tag #'midi {
    s4...\son s32\soff
    s4...\son s32\soff
    s4...\son s32\soff
  }
  \tag #'print {
    s2\son s2\soff\son s2\soff\son
  }

  % theme A
  \tag #'midi {
    s2
  }
  \tag #'print {
    s2\soff
  }
  s8\son s4.\soff
  \tag #'midi {
    s8\son s8\soff s8..\son s32\soff
    s8\son s8\soff s8..\son s32\soff
    s2 s8\son s4.\soff
  }
  \tag #'print {
    s8\son s8\soff s4\son
    s8\soff\son s8\soff s4\son
    s2\soff s8\son s4.\soff
  }

  % theme C
  \tag #'midi {
    \repeat unfold 6 { s8..\son s32\soff }
    \repeat unfold 2 { s8\son s4.\soff }
  }
  \tag #'print {
    s4\son
    s4\soff\son
    s4\soff\son
    s4\soff\son
    s4\soff\son
    s4\soff\son
    s8\soff\son
    s4.\soff
    s8\son
    s4.\soff
  }
}
