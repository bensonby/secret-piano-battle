intro-primo-rh = \relative c' {
  r2
  % autochange with specified point not supported in 2.18.2
  \autochange b \relative c' {
    <dis gis dis'>16-> dis,
    <f' f'> f,
    <e' e'> e,
    <dis' dis'> dis,
    r2
    <d' gis d'>16-> d,
    <e' e'> e,
    <d' d'> d,
    <cis' cis'> cis,
  }

  \cpr
  \makeOctaves 1 {
    c8 d c b a c b a
  }
  \autochange a, \relative c, {
    \makeOctaves 1 { e16 e' f, f' e, e' f, f' e, e' d, d'}
  }
  \cpr
  \tag #'print {
    << {
      c4\glissando \ottava #1 \stemDown e'''8 \ottava #0
    } \\ {
      s4 \cpl \stemUp a,,16 gis \cpr \stemDown a b
    } >>
  }
  \tag #'midi {
    \tuplet 23/16 { c,,,64 d e f g a b c d e f g a b c d e f g a b c d }
    <e a,,>16 gis,, a b
  }
}

intro-primo-lh = \relative c, {
  r2 s2 r2 s2
  \makeOctaves 1 { c8 d c b a c b a }
  s2 s4 <c c'>8 r
}

intro-secondo-rh = \relative c {
  \autochange g' \relative c'' {
    <<
      { <e gis e'>16-> s \makeOctaves 1 { f s e s dis s } }
      { \makeOctaves -1 { s e, s f s e s dis } }
    >>
  }
  % \csr % why this will give error?
  r2
  \autochange f' \relative c'' {
    <<
      { <d gis d'>16-> s \makeOctaves 1 { e s d s cis s } }
      { \makeOctaves -1 { s d, s e s d s cis } }
    >>
  }
  \csr
  r2
  \autochange e' \relative c'' {
    <<
      { <c e a c>16-> s \makeOctaves 1 { d s c s b s a s c s b s a s } }
      { \makeOctaves -1 { s c, s d s c s b s a s c s b s a } }
    >>
  }
  \csr
  <gis'' b e gis>8-> \makeOctaves 1 { f e dis e d c b }
}

intro-secondo-lh = \relative c {
  s2 r2 s2 r2 s1
  \makeOctaves -1 { e8 f e f e d c b }
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
  e-> c e a c-> a e a e'-> c a c a'-> e c e

  \repeat unfold 4 { a-> e c e b'-> gis e gis }

  \autochange c'' \relative c''' {
    \repeat unfold 8 {
      <<
        { <c e a>16 s <b e gis> s }
        { s <b, d e gis> s q }
      >>
    }
  }

  \cpr
  <c, e a>4-. r <e, gis b e>-. r <a c e a>-. r r2

   \bar "|."
}

main-primo-lh = \relative c'' {
  \repeat unfold 3 {
    c16 b c d e d e f g f e d f e d b
    c b c d e d e f g f e d f e d b
    c b c e a e a c a f d f bes d, f bes
    a e c e c e, a e b' e, a e fis gis a b
  }

  a16 gis \cpr a b \cpl c,16 b c b f a d f e c e c
  e-> c e a c-> a e a e'-> c a c a'-> e c e

  \repeat unfold 4 {a-> e c e b'-> gis e gis}
  s1 s1
  <c, e a>4-. r <e, a e'>-. r <a c e a>4-. r r2
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
}
movt-threeB-secondo-lh = \relative c {
  \clef bass
  \intro-secondo-lh
}
movt-threeB-primo-dynamics = {
}
movt-threeB-secondo-dynamics = {
}

movt-threeB-dynamics-pedal = {
  % intro
  \repeat unfold 8 {
    s4...\son s32\soff
  }
}
