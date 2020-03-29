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
  c4\glissando
  \ottava #1 e'''8 \ottava #0 r
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

movt-threeB-primo-rh = \relative c {
  \intro-primo-rh
}
movt-threeB-primo-lh = \relative c' {
  \clef bass
  \intro-primo-lh
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
