cr = \change Staff = "up"
cl = \change Staff = "down"
cpr = \change Staff = "up"
cpl = \change Staff = "down"
csr = \change Staff = "up"
csl = \change Staff = "down"
son = \sustainOn
soff = \sustainOff
rhMark = \markup { 
  \path #0.1 #'((moveto -1 0)(rlineto 0 -1.5)(rlineto 0.5 0))
}
lhMark = \markup { 
  \path #0.1 #'((moveto 0 1)(rlineto -0.5 0)(rlineto 0 -1.5))
}
ottava-one-short = \set Staff.ottavation = #"8"
dynamicShiftA = \once \override DynamicText.X-offset = #-4
dynamicShiftB = \once \override DynamicText.X-offset = #-2
dynamicShiftC = \once \override Dynamics.DynamicText.self-alignment-X = #-0.2 % for overlap on the left with barline
textScriptShiftA = \once \override TextScript.X-offset = #-4
textScriptShiftB = \once \override TextScript.extra-offset = #'(0 . 0.5)
metronomePaddingA = \once \override Score.MetronomeMark.padding = #9
metronomePaddingB = \once \override Score.MetronomeMark.padding = #4
metronomePaddingC = \once \override Score.MetronomeMark.padding = #7
