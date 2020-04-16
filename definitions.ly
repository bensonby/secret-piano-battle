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
conPedal = \markup \italic \larger "con pedal"
sim = \markup \italic \larger "sim."
ottava-one-short = \set Staff.ottavation = #"8"
ottavaShorterEndA = \once \override Score.OttavaBracket.shorten-pair = #'(0 . 0)
dynamicShiftA = \once \override DynamicText.X-offset = #-4
dynamicShiftB = \once \override DynamicText.X-offset = #-2
dynamicShiftC = \once \override Dynamics.DynamicText.self-alignment-X = #-0.2 % for overlap on the left with barline
dynamicShiftD = \once \override DynamicText.Y-offset = #-0.8
dynamicShiftE = \once \override DynamicText.Y-offset = #-7
textScriptShiftA = \once \override TextScript.X-offset = #-4
textScriptShiftB = \once \override TextScript.extra-offset = #'(0 . 0.5)
textScriptShiftC = \once \override TextScript.extra-offset = #'(0 . -0.5)
metronomePaddingA = \once \override Score.MetronomeMark.padding = #9
metronomePaddingB = \once \override Score.MetronomeMark.padding = #4
metronomePaddingC = \once \override Score.MetronomeMark.padding = #7
metronomePaddingD = \once \override Score.MetronomeMark.padding = #2
sfpAccelAndCrescSpanner = {
  \override TextSpanner #'(bound-details left text) = \markup \whiteout { \concat { \dynamic "sfp" \italic \larger "  accel. e cresc." } }
  \override TextSpanner #'(bound-details left-broken text) = ##f
  \override TextSpanner #'(bound-details left stencil-align-dir-y) = #CENTER
  \override TextSpanner.dash-fraction = #0.15
  \override TextSpanner.dash-period = #3.5
  \override TextSpanner.thickness = 1.7
  \override TextSpanner.avoid-slur = #'inside
  \override TextSpanner.outside-staff-priority = ##f
  \override TextSpanner.staff-padding = #3.0
  \override TextSpanner.Y-offset = #-0.3
  \override TextSpanner #'(bound-details right padding) = #4.0
  \override TextSpanner #'(bound-details right-broken padding) = #0.5
}
subPAccelAndCrescSpanner = {
  \override TextSpanner #'(bound-details left text) = \markup \whiteout { \concat { \italic "sub. " \dynamic "p" \italic \larger "  accel. e cresc." } }
  \override TextSpanner #'(bound-details left-broken text) = ##f
  \override TextSpanner #'(bound-details left stencil-align-dir-y) = #CENTER
  \override TextSpanner.dash-fraction = #0.15
  \override TextSpanner.dash-period = #3.5
  \override TextSpanner.thickness = 1.7
  \override TextSpanner.avoid-slur = #'inside
  \override TextSpanner.outside-staff-priority = ##f
  \override TextSpanner.staff-padding = 3.0
  \override TextSpanner #'(bound-details right padding) = #4.0
  \override TextSpanner #'(bound-details right-broken padding) = #0.5
}
shpSlurA = \shape #'((0.2 . 0.5) (0 . 0.5) (0 . 0.5) (0 . 0.5)) PhrasingSlur
shpSlurB = \shape #'((0 . 0) (0 . 0.5) (0 . 0.5) (0 . 0.5)) PhrasingSlur
shpSlurC = \shape #'((0 . 0.2) (0 . 0.6) (0 . 0.3) (0 . 0.5)) PhrasingSlur
shpSlurD = \shape #'((0 . 0.2) (0 . 1.9) (0 . 1.5) (0 . 0.0)) PhrasingSlur
