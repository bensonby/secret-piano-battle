intro-primo-rh = \relative c {
  \metronomePaddingD
  \tempo "Agitato"
  \clef bass
  r2
  % autochange with specified point not supported in 2.18.2
  \autochange b, \relative c,, {
    \acciaccatura <e e'>16
    <e'' gis e'>16-- e,
    <f' f'> f,
    <e' e'> e,
    <dis' dis'> dis,
  }
  \cpr r2
  \autochange b, \relative c, {
    \acciaccatura <d, d'?>16
    <d''? gis d'?>16-- d,
    <e' e'> e,
    <d' d'> d,
    <cis' cis'> cis,
  }

  \cpr
  \makeOctaves 1 {
    c?8 d c b a c b a
  }
  \clef bass
  \autochange a, \relative c, {
    \makeOctaves 1 { e16 e' f, f' e, e' f, f' e, e' d, d'}
  }
  \cpr
  \tag #'print {
    << {
      c'4\glissando \clef treble \ottava #1 \ottava-one-short \stemDown e'''8 \ottava #0
    } \\ {
      s4 \cpl \stemUp a,,16 gis
      \cpr \stemDown a b
    } >>
  }
  \tag #'midi {
    \clef treble
    \tuplet 23/16 { c,,,64 d e f g a b c d e f g a b c d e f g a b c d }
    <e a,,>16 gis,, a b
  }
}

intro-primo-lh = \relative c, {
  r2 s2 r2 s2
  c8 d c b a c b a
  s2 s4 <c c'>8 r
}

intro-secondo-rh = \relative c {
  \autochange g' \relative c'' {
    <<
      { \paddingC <e gis e'>16-- s \makeOctaves 1 { f s e s dis s } }
      { \makeOctaves -1 { s e, s f s e s dis } }
    >>
  }
  % \csr % why this will give error?
  r2
  \autochange f' \relative c'' {
    <<
      { \paddingC <d? gis d'?>16-- s \makeOctaves 1 { e s d s cis s } }
      { \makeOctaves -1 { s d,? s e s d s cis } }
    >>
  }
  \csr
  r2
  \autochange e' \relative c'' {
    <<
      { <c? e a c?>16 s \makeOctaves 1 { d s c s b s a s c s b s a s } }
      { \makeOctaves -1 { s c,? s d s c s b s a s c s b s a } }
    >>
  }
  \csr
  \paddingC <gis'' b e gis>8-- \makeOctaves 1 { f e dis e d c b }
}

intro-secondo-lh = \relative c {
  s2 r2 s2 r2 s1
  << \makeOctaves -1 { e8 f e f e d c b } { \paddingC s8-- } >>
}

main-primo-rh = \relative c''' {
  \repeat unfold 3 {
    c16 b c d e d c b d c b gis
    a gis a b c b c d e d c b d c b gis
    a gis a c e c e a f d a d f bes, d f
    e c a c a c, e c b' e, a e fis gis a b
  }
  \alternative {
    { a16 gis a b }
    { a16 gis a b }
    {}
  }
  a8 s c,16 b c a c b d f dis c e c
  e\accentA c e a c\accentA a e a e'\accentA c a c a'\accentA e c e

  \repeat unfold 4 { a\accentA e c e b'\accentA gis e gis }

  <<
    {
      \repeat unfold 8 {
        <c, e a>16[ s <b e gis>] s
      }
      \stemDown
      <c e a>4-.
    } \\ {
      \repeat unfold 8 {
        s16 <b, d e gis>[ s q]
      }
      \voiceFollowerB
      \showStaffSwitch
      \cpl \hideNotes a'4 \unHideNotes \cpr
    }
  >>

  r4 <e gis b e>-. r <a c e a>-. r r2

   \bar "|."
}

main-primo-lh = \relative c'' {
  \repeat unfold 3 {
    c16 b c d e d e f g f e d f e d b
    c b c d e d e f g f e d f e d b
    c b c e a e a c a f d f bes d, f bes
    a e c e c e, a e b' e, a e fis gis a b
  }

  a16 gis \cpr a b \cpl c,16 b c a f a d f dis c e c
  e\accentA c e a c\accentA a e a e'\accentA c a c a'\accentA e c e

  \repeat unfold 4 {a\accentA e c e b'\accentA gis e gis}
  s1 s1
  <c, e a>4-. r <e, a>-. r <a c e>4-. r r2
}

main-secondo-rh = \relative c'' {
  <a a'>4-.
  \repeat unfold 3 {
    \makeOctaves 1 {
      c4-. b-. bes-.
      a-. c-. b-. bes-.
      a-. e'-. d-. f-.
      e-. \stemNeutral c8-. a-. gis-. a-.
      \tag #'print { \paddingC b4--\glissando }
    }
    \tag #'midi { \tuplet 17/16 {
      b64 c d e f g a b c d e f g a b c d
    }}
    \stemUp
    \ottava #1 \ottava-one-short e8-. \ottava #0 r8
  }

  \paddingC <e,,, c' e>4-- <f f'>8-. <e e'>-. \paddingC <dis dis'>4--
  <e e'>4-. <c c'>8-. <a a'>-. <gis gis'>-. <a a'>-. \paddingC <b b'>4--

  <a e' a>4-.-- r8 <f c' f>-. <e b' e>4-.-- r8 <gis e' gis>-.
  <a e' a>4-.-- r8 <f c' f>-. <e b' e>4-.-- r8 <gis e' gis>-.

  \paddingC <c e a>4-- \clef bass <a, b d gis>--
  <c e a>4-- \clef treble \paddingC <a' b d gis>--
  \paddingC <c e a>4-- \paddingC <gis' d'>--
  \paddingC <c e a>4-- \paddingC <gis e'>8-. d'-.
  <e, a c>4-. r <gis, b e gis>-. r <a c e a>-. r r2
}

main-secondo-lh = \relative c, {
  \repeat unfold 3 {
    <<
      {
        <a a,>8-. s a-. s a-. s a-. s
        q-. s a-. s a-. s a-. s
        q-. s a-. s <bes bes,>-. s bes-. s
      }
      {
        s8 <c' e>-. s q-. s <d f>-. s q-. 
        s8 <c e>-. s q-. s q-. s q-.
        s q-. s q-. s <d f>-. s q-.
      }
    >>
  }
  \alternative {
    {
      <c, c,>8-. <c' e>-. a,-. q-.
      <e e'>\accentA-. <fis fis'>\accentA-. <gis gis'>4\accentA--
    }
    {
      <c c,>8-. <c' e>-. a,-. q-.
      <d d'>\accentA-. <e e'>\accentA-. <d d'>4\accentA--
    }
    {
      <c c,>8-. <c' e>-. a,-. q-.
      <e e'>\accentA-. <fis fis'>\accentA-. <gis gis'>4\accentA--
    }
  }

  <a a,>8-. <c' e>-. <c, c'>-. <c' e>-. <f, b f'>8\accentA <e b' e>\accentA <dis b' dis>4--\accentA
  <a a,>8-. <c' e>-. <a, a'>-. <c' e>-. <e,, e'>8-.\accentA <fis fis'>-.\accentA <gis gis'>4--\accentA

  <a e a,>8---. <a' e'> d, <f, c' f>-. <e b' e>---. <b'' e> d, <gis, e' gis>-.
  <a e' a>8---. <a' e'> d, <f, c' f>-. <e b' e>---. <b'' e> d, <gis, e' gis>-.

  a8-. <e' a>-. e,-. <b' e>-. a-. <e' a>-. e-. <b' e>-.
  a8-. <e' a>-. <e b'>-. <a e'>-. a-. q-. <e a e'>-. e-.
  <a, e' a>4-.-> r <e a e'>-.-> r \ottava #-1 <a,, e' a>-.-> \ottava #0 r r2

  \bar "|."
}

movt-threeB-primo-rh = \relative c {
  \intro-primo-rh
  \main-primo-rh
}
movt-threeB-primo-lh = \relative c' {
  \clef bass
  \intro-primo-lh
  \clef treble
  \main-primo-lh
}
movt-threeB-secondo-rh = \relative c {
  \clef treble
  \intro-secondo-rh
  \main-secondo-rh
}
movt-threeB-secondo-lh = \relative c {
  \clef bass
  \intro-secondo-lh
  \main-secondo-lh
}
movt-threeB-primo-dynamics = {
  s2 \dynamicShiftA s2\f s1 s1 s1
  s1 s1 s1 s1
  \dynamicShiftC s1\mf s1 s1 s1
  s1\f s1 s1 s1

  \dynamicShiftH s1\fp s1-\cresc s1\f s1
  \tag #'print { \textScriptShiftC s1-\cresc }
  \tag #'midi { s1\pp\< }
  s1 \dynamicShiftC s1\ff s1
}
movt-threeB-secondo-dynamics = {
  \dynamicShiftB s1\f s1 s1 s1
  s1 s1 s1 s1
  s1 s1 s1 s1
  s1 s1 s1 s1

  \dynamicShiftC s1\mf s1 s1\f s1
  \tag #'print { s1-\cresc } \tag #'midi { s1\pp\< }
  s1 \dynamicShiftC s1\ff s1
}

movt-threeB-dynamics-primo-pedal = {
  \set Staff.pedalSustainStyle = #'bracket
  \tag #'midi {
    % intro
    \repeat unfold 8 {
      s4...\son s32\soff
    }
    \repeat unfold 56 {
      s8..\son s32\soff
    }

    \repeat unfold 8 {
      s8..\son s32\soff
    }

    \repeat unfold 8 {
      s8..\son s32\soff
    }

    % hack to prevent pedal still hanging at the end
    s16\son s8.\soff s2. s1
  }
}

movt-threeB-dynamics-secondo-pedal = {
  \set Staff.pedalSustainStyle = #'bracket
  \tag #'midi {
    % intro
    \repeat unfold 2 {
      s2\son s2\soff
    }
    \repeat unfold 4 {
      s4...\son s32\soff
    }
    \repeat unfold 3 {
      s8\son s4.\soff s2
      s8\son s4.\soff s2
      s8\son s4.\soff s8\son s4.\soff
      s8\son s4.\soff s4 s8...\son s64\soff
    }

    % hack to prevent pedal hanging
    s16\son s8.\soff s2. s1

    \repeat unfold 4 {
      s8\son s4.\soff
    }

    s1 s1

    % hack to prevent pedal still hanging at the end
    s16\son s8.\soff s2. s1
  }
}
