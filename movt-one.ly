ffBrillante = \markup \concat { \dynamic "ff" \italic \larger "  brillante" }
fBrillante = \markup \concat { \dynamic "f" \italic \larger "  brillante" }
fLegatoELeggiero = \markup \concat { \dynamic "f" \italic \larger "  legato e leggiero" }
sempreLegato = \markup \italic \larger "sempre legato"
rall = \markup \bold \larger "Rall."
aTempo = \markup \italic \larger "a tempo"
espressTxt = \markup \italic \larger "espress."
cresc = \markup \italic \larger "cresc."

beamSettings = {
  \set subdivideBeams = ##t
  \set baseMoment = #(ly:make-moment 1/8)
  \set beatStructure = #'(1 1 1 1)
}

intro = \relative c'''' {
  << {
    \stemNeutral
    \ottava #1 ees8\glissando^"Black key glissando"
    \ottava #0 \cl \parenthesize ges,,,,\noBeam
    \cr \ottava #1 des''''4\glissando
    \cl
    \ottava #0
    ges,,,,,,4\glissando
    \cr
    \stemNeutral
    \ottava #1 ges''''''8 \ottava #0
  } \\ {
    s8 \cr des,8\glissando^"l.h."
    \cl
    \parenthesize
    ges,,,,8 s8
  } >>
  r8
}

theme-A-rh = \relative c'''' {
  \ottava #1
  \tuplet 3/2 8 {
    \ottava #1
    g16 b d, g e g d g b, \ottava #0 d g, b
    \omit TupletNumber
    g b d, g e g d g b, d g, b
    d, d' a d a a' a, a' e a e e'
    e, e' a, \ottava #1 e' a, a' a, a' d, a' d, d'
    g,16 b d, g e g d g b, \ottava #0 d g, b
    g b d, g e g d g b, d g, b
  }
}

theme-A-lh = \relative c' {
  <g b d g>8-. <g c e g>-. <g b d g>-. r
  <g g,>-. <c e g>-.[ <b d g>-.] r
  <d, d,>-. <a' d fis>-.[ <a c e>-.] a,
  << { r8 <a' c e>->[ <a c d>] } \\ { d,4. } >> r8
  <g b d g>8-. <g c e g>-. <g b d g>-. r
  <g g,>-. <c e g>-.[ <b d g>-.] r
}

theme-B-rh = \relative c' {
  \tuplet 3/2 8 {
    ees16 ees' aes, ees' aes, aes' ees aes ees \ottava #1 ees' aes, aes'
    \repeat unfold 6 { bes, bes' }
    <<
      { \repeat unfold 6 { b, b' } }
      { s16^\rall s16*10 s16\fermata }
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
    g b d, g e g d g b, d g, \showStaffSwitch b
  }
  % switch hands in notations for cross staff line
  \cl <g,, g'>8-. r q-> r
}

theme-C-lh = \relative c {
  \autoBeamOff
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
  \tempo 8 = 176
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
    { s2^\aTempo }
  >>
  \theme-C-rh
  \bar "|."
}

movt-one-lh = \relative c {
  \set fingeringOrientations = #'(down)
  \clef bass
  \time 2/4
  \key ges \major
  r8 s8 s4 s2
  \transpose g ges { \theme-A-lh }
  \theme-B-lh
  \key g \major
  \theme-A-lh
  \theme-C-lh
  \bar "|."
}

movt-one-dynamics = {
  s2-\ffBrillante s2
  s2-\fLegatoELeggiero s2\p s4 s4-\cresc s2
  s2\f s2\p s4 s4\< s4\! s4\> s2\!\mf
  s2\f s2\p s4 s4-\cresc s2
  s2\f s2\mp s2 s2-\espressTxt s2-\cresc
  s2-\fBrillante
}
