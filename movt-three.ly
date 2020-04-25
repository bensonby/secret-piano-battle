% from single staff to two staves - clef change?
legato = \markup \italic \larger "legato"
leftHandOnly = \markup \larger "left hand only"
stillLeftHandOnly = \markup \larger "still left hand only"

extra-rest-before-three = {
  s2
}

rest-duration-three = {
  \time 4/4
  s1*8
  \time 5/4 s2. s2 s2. s2 \time 4/4 s1 \time 5/4 s2. s2 \time 4/4 s1
}

theme-running-notes-rh = \relative c {
  << { \repeat unfold 31 {e16 f} } { s16\( s16*14 s16\) s16^\sim } >> e dis
  \repeat unfold 2 {e f fis g gis a b a gis f d gis g e cis g'}
  \repeat unfold 2 {a ais b c cis d e d cis bes g cis c a fis c'}
}
theme-running-notes-lh = \relative c {
  % don't know why the print version will break the midi
  % (creating extra pause afterwords)
  \tag #'midi {
    \repeat unfold 6 {a8-. r c-. r b-. r bes-. r}
    \repeat unfold 2 { d8-. d-. f-. f-. e-. e-. ees-. ees-.}
  }
  \tag #'print {
    << {
      \repeat unfold 6 {a,8 r c r b r bes r}
      \repeat unfold 2 { d8 d f f e e ees ees}
    } {
      \repeat unfold 24 { \offsetA s8-. s }
      \repeat unfold 16 { \offsetA s8-. }
    } >>
  }
}

theme-arpeggios-rh = \relative c' {
  \clef treble
  \tag #'(midi both-hands left-hand) { \tempo 4 = 100 }
  r16
  \tag #'(midi both-hands left-hand) { \tempo 4 = 150 }
  \shpSlurC
  <d f>\( <f a> <a d>
  <d f> <f a> <a d> <d f>
  <f a> <d f> <a d> <f a>
  <d f>4\) r

  \tag #'(midi both-hands left-hand) { \tempo 4 = 100 }
  r16
  \tag #'(midi both-hands left-hand) { \tempo 4 = 150 }
  \shpSlurC
  <c, e>\( <e a> <a c>
  <c e> <e a> <a c> <c e>
  <e a> <c e> <a c> <e a>
  <c e>4\) r

  \dynamicNeutral
  \time 4/4
  \tag #'(midi both-hands left-hand) { \tempo 4 = 100 }
  r16
  \tag #'(midi both-hands left-hand) { \tempo 4 = 150 }
  \tag #'(print both-hands left-hand) {
    << {
      fis,,( a b fis' ais, b fis'
      b, dis fis a fis' ais, b fis')
    } \\ {
      s16 s8 <a,, c>8. <a c>16~ q4 <a' c>8. q16
    } >>
  }
  \tag #'(midi both-hands left-hand) {
    % force it to one voice for midi dynamics to apply
    << {
      fis,( a b fis' ais, b fis'
      b, dis fis a fis' ais, b fis')
    } {
      s16 s8 <a,, c>8. <a c>16~ q4 <a' c>8. q16
    } >>
  }
  \tag #'(midi both-hands left-hand) { \tempo 4 = 150 }

  \time 5/4 r4
  \tag #'(print both-hands) {
    << {
      <e' gis e'>16\([ s
      \makeOctaves 1 { f] s e[ s f] s e[ s f] s e[ s f] s }
      \time 4/4
      <e e'>4\)\accentB
    } \\ {
      \repeat unfold 4 { s16 <e, gis b d>[ s q] }
      q4\accentB
    } >>

    \ottava #1 \ottava-one-short
    e''' \ottava #0 r2
  }
  \tag #'(midi both-hands) {
    << {
      <e,, gis e'>16\([\f s
      \makeOctaves 1 { f]\f s e[\f s f]\f s e[\f s f]\f s e[\f s f]\f \tempo 4 = 100 s }
      \time 4/4
      <e e'>4\)\accentB\f
    } \\ {
      \repeat unfold 4 { s16 <e, gis b d>[\mp s q]\mp }
      q4\accentB\f
    } >>

    \ottava #1 \ottava-one-short
    e''' \ottava #0 r2
  }
  \tag #'(print left-hand) {
    <e,,, e'>16\( <gis b>
    <f f'> <gis b>
    \repeat unfold 3 {
      <e e'>16 <gis b>
      <f f'> <gis b>
    }
    \time 4/4
    <e gis b e>4\)
    e''4\sf-. r2
  }
  \tag #'(midi left-hand) {
    <e,, e'>16\(\f <gis b>\mp
    <f f'>\f <gis b>\mp
    \repeat unfold 3 {
      <e e'>16\f <gis b>\mp
      <f f'>\f <gis b>\mp
    }
    \time 4/4
    <e gis b e>4\)\f
    e''4\sf-. r2
  }
}

theme-arpeggios-lh = \relative c, {
  \time 5/4 \paddingB <d d'>2.~\accentA q8
  \tag #'(midi both-hands left-hand) { \tempo 4 = 130 }
  \paddingB <gis gis'>\accentA
  \tag #'(midi both-hands left-hand) { \tempo 4 = 125 }
  \paddingB <a a'>\accentA
  \tag #'(midi both-hands left-hand) { \tempo 4 = 150 }
  \paddingB <d, d'>\accentA
  <c c'>2.~\accentA q8
  \tag #'(midi both-hands left-hand) { \tempo 4 = 130 }
  \paddingB <gis' gis'>\accentA
  \tag #'(midi both-hands left-hand) { \tempo 4 = 125 }
  \paddingB <a a'>\accentA
  \tag #'(midi both-hands left-hand) { \tempo 4 = 150 }
  \paddingB <ais, ais'>\accentA
  \tag #'(midi both-hands left-hand) { \tempo 4 = 150 }
  \time 4/4
  \tag #'(print both-hands left-hand) { \paddingB <b b'>1\accentA }
  \tag #'(midi both-hands left-hand) {
    \paddingB <b b'>2.\accentA~ q8.~ \tempo 4 = 50 q16
    \tempo 4 = 150
  }
  \time 5/4
  \tag #'(print midi both-hands) {
    \paddingB <e e'>2.~\accentA q2~
    \time 4/4
    \tag #'(midi both-hands) { \tempo 4 = 180 }
    q4
    \tag #'(midi both-hands) { \tempo 4 = 150 }
    e,-. r2
  }
  \tag #'(print midi left-hand) {
    <e' e'>2.~\accentA q2~
    \time 4/4
    \tag #'(midi left-hand) { \tempo 4 = 180 }
    q2
    \tag #'(midi left-hand) { \tempo 4 = 150 }
    r2
  }
}

movt-three-primo-rh = \relative c {
  \clef treble
  \tag #'midi { \tempo 4 = 150 }
  \key a \minor
  s1*8
  \time 5/4
  \keepWithTag #'left-hand \theme-arpeggios-rh
  \bar "||"
}

movt-three-primo-lh = \relative c' {
  \clef bass
  \time 4/4
  \key a \minor
  \tag #'print {
    << 
      { \theme-running-notes-rh }
      { s1^\leftHandOnly } \\ {
        \theme-running-notes-lh
      }
    >>
  }
  \tag #'midi {
    % force it to one voice for midi dynamics to apply
    << 
      { \theme-running-notes-rh }
      { s1^\leftHandOnly }
      { \theme-running-notes-lh }
    >>
  }

  <<
    { \keepWithTag #'left-hand \theme-arpeggios-lh }
    { s1^\stillLeftHandOnly }
  >>
  \attacaB
  \bar "||"
}

movt-three-primo-single-staff-dynamics = {
  \tag #'print {
    << 
      { \repeat unfold 8 { s4 s8.\< s16\! s8.\> s16\! s4 } }
      { s1\p s1*3 \dynamicShiftC s1\mp s1 s1\mf s1 }
    >>
  }
  \tag #'midi {
    \repeat unfold 4 { s4\pp s8.\< s16\!\mf s8.\> s16\!\pp s4 }
    \repeat unfold 2 { s4\pp s8.\< s16\!\f s8.\> s16\!\pp s4 }
    \repeat unfold 2 { s4\mp s8.\< s16\!\ff s8.\> s16\!\mf s4 }
  }
  \time 5/4
  s2. s2
  s2. s2
  \time 4/4
  s1
  \time 5/4
  s2. s2
  \time 4/4
  s1
}

movt-three-secondo-single-staff-dynamics = {
  \tag #'print {
    << 
      { \repeat unfold 8 { s4 s8.\< s16\! s8.\> s16\! s4 } }
      { s1\p s1*3 \dynamicShiftF s1\mp s1 s1\mf s1 }
    >>
  }
  \tag #'midi {
    \repeat unfold 4 { s4\pp s8.\< s16\!\mf s8.\> s16\!\pp s4 }
    \repeat unfold 2 { s4\pp s8.\< s16\!\f s8.\> s16\!\pp s4 }
    \repeat unfold 2 { s4\mp s8.\< s16\!\ff s8.\> s16\!\mf s4 }
  }
  \time 5/4
  s2. s2
  s2. s2
  \time 4/4
  s1
  \time 5/4
  s2. s2
  \time 4/4
  s1
}

movt-three-primo-dynamics = {
  s1*8
  \tag #'print {
    s16\f s8.\< s8. s16\! s4\> s2\!
    s16 s8.\< s8. s16\! s4\> s2\!
    s4-\fpCresc s2.
  }
  \tag #'midi {
    s16\f s8.\ppppp\< s8. s16\!\f s4\> s8\!\pp s4.\f
    s16\f s8.\ppppp\< s8. s16\!\f s4\> s8\!\pp s4.\f
    s16\f s8.\ppppp\< s4 s4 s8. s16\f
  }
  s1\f s4
  s4 s4 s2
}

movt-three-secondo-dynamics = {
  s1*8
  \tag #'print {
    s16\f s8.\< s8. s16\! s4\> s2\!
    s16 s8.\< s8. s16\! s4\> s2\!
    s4-\fpCresc s2.
  }
  \tag #'midi {
    s16\f s8.\ppppp\< s8. s16\!\f s4\> s8\!\pp s4.\f
    s16\f s8.\ppppp\< s8. s16\!\f s4\> s8\!\pp s4.\f
    s16\f s8.\ppppp\< s4 s4 s8. s16\f
  }
  s1\f s4
  s4 s4\sfz s2
}

movt-three-secondo-rh = \relative c {
  \clef treble
  \time 4/4
  \key a \minor
  \metronomePaddingD
  \tempo "Animato" 4 = 150
  s1*8
  \time 5/4
  <<
    { \keepWithTag #'both-hands \theme-arpeggios-rh }
    { s2. s2 s2. s2 s1 s2. s2 s1 \break }
  >>
  \bar "||"
}

movt-three-secondo-lh = \relative c {
  \clef bass
  \time 4/4
  \key a \minor
  \tag #'print {
    << 
      { \theme-running-notes-rh }
      \\
      { \theme-running-notes-lh }
    >>
  }
  \tag #'midi {
    % force it to one voice for midi dynamics to apply
    << 
      { \theme-running-notes-rh }
      { \theme-running-notes-lh }
    >>
  }

  <<
    { \keepWithTag #'both-hands \theme-arpeggios-lh }
    { s1 }
  >>
  \attacaA
  \bar "||"
}

movt-three-dynamics-pedal = {
  s1*8
  \repeat unfold 2 { s2.\son s8. s16\soff s8..\son s32\soff }
  s2....\son s32\soff s1\son s4 s2 s2\soff
}
