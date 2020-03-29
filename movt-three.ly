% from single staff to two staves - clef change?
legato = \markup \italic \larger "legato"
leftHandOnly = \markup \italic \larger "left hands only"
stillLeftHandOnly = \markup \italic \larger "still left hands only"

rest-duration-three = {
  s1*8
  s2. s2 s2. s2 s1 s2. s2 s1
}

theme-running-notes-rh = \relative c {
  \repeat unfold 31 {e16 f} e dis
  \repeat unfold 2 {e f fis g gis a b a gis f d gis g e cis g'}
  \repeat unfold 2 {a ais b c cis d e d cis bes g cis c a fis c'}
}
theme-running-notes-lh = \relative c {
  \repeat unfold 6 {a8-. r c-. r b-. r bes-. r}
  \repeat unfold 2 { d8-. d-. f-. f-. e-. e-. ees-. ees-.}
}

theme-arpeggios-rh = \relative c' {
  \clef treble
  \tag #'midi { \tempo 4 = 100 }
  r16
  \tag #'midi { \tempo 4 = 150 }
  <d f>\( <f a> <a d>
  <d f> <f a> <a d> <d f>
  <f a> <d f> <a d> <f a>
  <d f>4\) r

  \tag #'midi { \tempo 4 = 100 }
  r16
  \tag #'midi { \tempo 4 = 150 }
  <c, e>\( <e a> <a c>
  <c e> <e a> <a c> <c e>
  <e a> <c e> <a c> <e a>
  <c e>4\) r

  \dynamicNeutral
  \time 4/4
  \tag #'midi { \tempo 4 = 100 }
  r16
  \tag #'midi { \tempo 4 = 150 }
  << {
    fis,,( a b fis' ais, b fis'
    b, dis fis a fis' ais, b fis')
  } \\ {
    s16 s8 <a,, c>8. <a c>16~ q4 <a' c>8. q16
  } >>

  \time 5/4 r4
  \tag #'(print midi both-hands) {
    <e' gis e'>16\(
    <e, gis b d> <f' f'> <e, gis b d> <e' e'>
    <e, gis b d> <f' f'> <e, gis b d> <e' e'>
    <e, gis b d> <f' f'> <e, gis b d> <e' e'>
    <e, gis b d> <f' f'> <e, gis b d>

    \time 4/4
    <e' gis b e>4\) \ottava #1 e'' \ottava #0 r2
  }
  \tag #'(print midi left-hand) {
    <e,,, e'>16\( <gis b>
    <f f'> <gis b>
    <e e'>16 <gis b>
    <f f'> <gis b>
    <e e'>16 <gis b>
    <f f'> <gis b>
    <e e'>16 <gis b>
    <f f'> <gis b>
    <e gis b e>4->\)
    e''4\sf-. r2
  }
}

theme-arpeggios-lh = \relative c, {
  \time 5/4 <d d'>2.~->-- q8
  \tag #'midi { \tempo 4 = 140 }
  <gis gis'>->
  <a a'>->
  \tag #'midi { \tempo 4 = 130 }
  <d, d'>->
  <c c'>2.~---> q8
  \tag #'midi { \tempo 4 = 140 }
  <gis' gis'>->
  <a a'>->
  \tag #'midi { \tempo 4 = 130 }
  <ais, ais'>->
  \time 4/4 <b b'>1->--\sustainOn
  \time 5/4
  \tag #'(print midi both-hands) {
    <e e'>2.~ q2
    \time 4/4
    q4-> e,-. r2
  }
  \tag #'(print midi left-hand) {
    <e' e'>2.~ q2~
    \time 4/4
    q2 r2
  }
}

movt-three-primo-rh = \relative c {
  \clef treble
  \tempo 4 = 150
  \key a \minor
  s1*8
  \time 5/4
  \keepWithTag #'left-hand \theme-arpeggios-rh
  % \bar "|."
}

movt-three-primo-lh = \relative c' {
  \clef bass
  \tempo 4 = 150
  \time 4/4
  \key a \minor
  << 
    { \theme-running-notes-rh }
    { s1^\legato^\leftHandOnly } \\ {
      \theme-running-notes-lh
    }
  >>

  <<
    { \keepWithTag #'left-hand \theme-arpeggios-lh }
    { s1^\stillLeftHandOnly }
  >>
  % \bar "|."
}

movt-three-primo-single-staff-dynamics = {
  << 
    { \repeat unfold 8 { s4 s8.\< s16\! s8.\> s16\! s4 } }
    { s1\p s1*3 s1\mp s1 s1\mf s1 }
  >>
}

movt-three-secondo-single-staff-dynamics = {
  << 
    { \repeat unfold 8 { s4 s8.\< s16\! s8.\> s16\! s4 } }
    { s1\p s1*3 s1\mp s1 s1\mf s1 }
  >>
}

movt-three-primo-dynamics = {
  s1*8
  s16\f s8.\< s8. s16\! s4\> s2\!
  s16 s8.\< s8. s16\! s4\> s2\!
  s4\fp s4\< s4.. s16\!
  s1\f s4
  s4 s4 s2
}

movt-three-secondo-dynamics = {
  s1*8
  s16\f s8.\< s8. s16\! s4\> s2\!
  s16 s8.\< s8. s16\! s4\> s2\!
  s4\fp s4\< s4.. s16\!
  s1\f s4
  s4 s4\sfz s2
}

movt-three-secondo-rh = \relative c {
  \clef treble
  \time 4/4
  \key a \minor
  \tempo 4 = 150
  s1*8
  \time 5/4
  <<
    { \keepWithTag #'both-hands \theme-arpeggios-rh }
    { s2. s2 s2. s2 s1 s2. s2 s1 \break }
  >>
  % \bar "|."
}

movt-three-secondo-lh = \relative c {
  \clef bass
  \time 4/4
  \key a \minor
  << 
    { \theme-running-notes-rh }
    { s1^\legato } \\ {
      \theme-running-notes-lh
    }
  >>

  <<
    { \keepWithTag #'both-hands \theme-arpeggios-lh }
    { s1 }
  >>
  % \bar "|."
}
