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
  \autochange e' \relative c'' {
    <c e a c>16-> <c, c'>
    <d' d'> <d, d'>
    <c' c'> <c, c'>
    <b' b'> <b, b'>
    <a' a'> <a, a'>
    <c' c'> <c, c'>
    <b' b'> <b, b'>
    <a' a'> <a, a'>
  }
  \autochange b \relative c' {
    <gis' b e gis>-> <gis, gis'>
    <f' f'> <f, f'>
    <e' e'> <e, e'>
    <dis' dis'> <dis, dis'>
    <e' e'> <e, e'>
    <d' d'> <d, d'>
    <c' c'>4-.\glissando \ottava #1 e'''8-. %score
  }
}

movt-threeB-primo-rh = \relative c {
  \intro-primo-rh
}
movt-threeB-primo-lh = \relative c' {
  \clef bass
  r2 s2 r2 s2
  \clef treble
  s1*2
}
movt-threeB-secondo-rh = \relative c {
}
movt-threeB-secondo-lh = \relative c {
}
movt-threeB-primo-dynamics = {
}
movt-threeB-secondo-dynamics = {
}
