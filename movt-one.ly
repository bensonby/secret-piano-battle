movt-one-rh = \relative c' {
  \clef treble
  \tempo 4 = 124
  \time 4/4
  \key c \major
  c1
  % \bar "|."
}

movt-one-lh = \relative c {
  \set fingeringOrientations = #'(down)
  \clef bass
  \time 4/4
  \key c \major
  c1
  % \bar "|."
}

movt-one-dynamics = {
  s1\f
}
