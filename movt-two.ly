movtTwoTempo = {
  \tag #'print {
    \tempo \markup {
      \concat
      \general-align #Y #CENTER { \bold "Allegro" }
      \general-align #Y #CENTER { \normal-text "(Piano II: " }
      \general-align #Y #-0.55 { \smaller \note "2." #1 }
      \general-align #Y #0.08 { \normal-text "= 62, Piano I: " }
      \general-align #Y #-0.55 { \smaller \note "2." #1 }
      \general-align #Y #0.0 { \normal-text "= 100)" }
    }
  }
  \tag #'midi {
    \tempo 4 = 185
  }
}
movtTwoTempoB = {
  \tag #'print {
    \tempo \markup {
      \concat
      \general-align #Y #CENTER { \bold "Vivace" }
      \general-align #Y #CENTER { \normal-text "(Piano II: " }
      \general-align #Y #-0.55 { \smaller \note "4" #1 }
      \general-align #Y #0.08 { \normal-text "= 126, Piano I: " }
      \general-align #Y #-0.55 { \smaller \note "4" #1 }
      \general-align #Y #0.0 { \normal-text "= 180)" }
    }
  }
  \tag #'midi {
    \tempo 4 = 140
  }
}

rest-duration-two = {
  % midi duration, partial treated as full bar
  s2.*16
  s2*20
}

section-A-rh = \relative c'' {
  \shpSlurA
  gis4\(
  gis'8 a gis fis dis gis,\)
  \shpSlurB
  fis'\( gis fis e cis gis\)
  \shpSlurB
  e'\( fis e dis bis fis\)
  dis'\( e dis cis a e\)
  cis'\( dis cis a cis dis,\)
  cis'\( dis cis gis cis cis,\)
  gis'\( fisis gis b a dis,
  e gis cis dis e fis\)
  gis\( fisis gis b a gis
  \acciaccatura fisis8 \paddingB gis4--
  \acciaccatura dis8 e4--
  \acciaccatura bis8 cis4--\)
  gis8^\( fisis gis b a gis
  \acciaccatura fisis8 gis4--
  \acciaccatura dis8 \paddingB e4--
  \acciaccatura bis8 \paddingB cis4--\)
  \acciaccatura gis'8\( a4-.
  \acciaccatura cis8 d4-.
  \acciaccatura eis8 fis4-.
  \acciaccatura gis8 a4-.
  \acciaccatura cis8 d4-.
  \acciaccatura eis8 fis4-.\)
  \ottava #1
  \ottava-one-short
  dis8\( e eis fis fisis gis
  \time 2/4
  cis8-.\)
  \ottava #0
}

section-A-lh = \relative c {
  r4
  \repeat unfold 2 {
    bis4 <gis' dis'> q
    cis, <gis' e'> q
    gis, <fis' bis> q
    a, <e' cis'> q
  }
  \alternative {
    {
      fis, <fis' cis'> r
      gis, <e' gis> r
      gis,,4. <fis'' bis>8~ q4
      cis4 <gis' e'> r
    }
    {
      fis,4 <a' d a'> r
      R2.
      gis,4 <gis' bis fis'> q
    }
  }
}

section-B-rh-theme = \relative c' {
  fisis16\( gis cis fisis, gis cis fisis, gis
  e' fisis, gis cis fisis, gis e' cis\)
  a\( cis fis a, cis e a, cis
  dis a cis e a, cis dis cis\)
  bis\( cis a' bis, cis gis' bis, cis
  fis bis, cis e bis cis dis e
  cis8-.\)
}

section-B-rh = \relative c {
  % already in 2/4. First note in section-A-rh
  r8 r4
  R2*3
  \section-B-rh-theme
  fisis16\( gis a ais b bis
  cis cisis dis e eis fis fisis gis\)
  \section-B-rh-theme
  r8 r4
  <cis' e gis cis>4\accentA r
}

section-B-lh-theme = \relative c, {
  <<
    {
      <cis cis'>8-. s gis'-. s <cis, cis'>-. s gis'-. s
      <fis fis'>-. s cis'-. s <fis, fis'>-. s cis'-. s
      <gis gis'>-. s dis'-. s <gis, gis'>-. s dis'-. s
    }
    {
      s <gis cis e>-. s q-. s q-. s q-.
      s <a cis fis>-. s q-. s q-. s q-.
      s <gis bis fis'>-. s q-. s q-. s q-.
    }
  >>
  <cis, cis'>-.
}

section-B-intro-lh = \relative c, {
  \time 2/4
  <<
    {
      \repeat unfold 4 {
        <<
          { <cis cis'>8-. s gis'-. s }
          { s <gis' cis e>-. s q-. }
        >>
      }
    }
    {
      \tag #'midi {
        \tempo 4 = 45 s8
        \tempo 4 = 52 s8
        \tempo 4 = 60 s8
        \tempo 4 = 70 s8
        \tempo 4 = 80 s8
        \tempo 4 = 90 s8
        \tempo 4 = 100 s8
        \tempo 4 = 110 s8
        \tempo 4 = 114 s8
        \tempo 4 = 118 s8
        \tempo 4 = 121 s8
        \tempo 4 = 124 s8
        \tempo 4 = 127 s8
        \tempo 4 = 130 s8
        \tempo 4 = 133 s8
        \tempo 4 = 136 s8
      }
    }
  >>
  \tag #'midi { \tempo 4 = 140}
}

section-B-lh = \relative c {
  \section-B-lh-theme
  << 
    { \makeOctaves -1 { gis8\( gis gis gis gis ais bis\) } }
    { \tag #'midi {
      s8 \tempo 4 = 142
      s8 \tempo 4 = 144
      s8 \tempo 4 = 146
      s8 \tempo 4 = 148
      s8 \tempo 4 = 150
      s8 \tempo 4 = 152
      s8 \tempo 4 = 154
    } }
  >>
  \section-B-lh-theme
  r8 r4
  <cis cis,>4\accentA r
}

movt-two-rh = \relative c' {
  \clef treble
  \metronomePaddingB
  \movtTwoTempo
  \time 3/4
  \key cis \minor
  \instructionII
  \tag #'print { \partial 4 }
  \tag #'midi { r2 }
  \section-A-rh
  \section-B-rh
  \bar "|."
}

movt-two-lh = \relative c {
  \clef bass
  \movtTwoTempo
  \time 3/4
  \key cis \minor
  \tag #'print { \partial 4 }
  \tag #'midi { r2 }
  \section-A-lh
  \tag #'print {
    \metronomePaddingC
    \movtTwoTempoB
  }
  \section-B-intro-lh
  \section-B-lh
  \bar "|."
}

movt-two-dynamics = {
  s4\mf
  \repeat unfold 6 {
    s2\> s8. s16\!
  }
  s4 s2\<
  s2 s8. s16\!
  s2.\mf s2.
  s2.\p s2.
  s2.\< s2 s8 s8\!
  s2.\f
  \textScriptShiftA
  s2-\beginSlowlyThenAccel s2 s2 s2
  \dynamicShiftD
  s2\mf s2*5
  s8 \subPAccelAndCrescSpanner s4.-\startTextSpan s2
  \dynamicShiftE
  s2\stopTextSpan\f
}

movt-two-dynamics-pedal = {
  % section A
  \tag #'print {
    s4 % partial 4
    \textScriptShiftC
    s2-\conPedal
  }
  \tag #'midi {
    s2.
    \repeat unfold 12 {
      s8\son s4. s8. s16\soff
    }
    s2.\son s2 s8. s16\soff
    s2\son s8. s16\soff

    % section-B
    \repeat unfold 10 {
      s8\son s4.\soff
    }
    s8 s4.\son s4.. s16\soff
    \repeat unfold 6 {
      s8\son s4.\soff
    }
  }
}
