movt-two-rh = \relative c' {
  \clef treble
  \tempo 4 = 124
  \time 4/4
  \key c \major
  d1
  % \bar "|."
}

movt-two-lh = \relative c {
  \set fingeringOrientations = #'(down)
  \clef bass
  \time 4/4
  \key c \major
  d1
  % \bar "|."
}

movt-two-dynamics = {
  s1\p
}
