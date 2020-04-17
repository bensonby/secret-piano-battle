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
cresc = \markup \italic \larger "cresc."
fpCresc = \markup \concat { \dynamic "fp" \italic \larger "  cresc." }
beginSlowlyThenAccel = \markup \whiteout { \concat { \dynamic "sfp" \italic \larger "  begin slowly and ease into tempo" } }
ottava-one-short = \set Staff.ottavation = #"8"
ottavaShorterEndA = \once \override Score.OttavaBracket.shorten-pair = #'(0 . 0)
attaca = {
  \once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
  \once \override Score.RehearsalMark.self-alignment-X = #RIGHT
  \once \override Score.RehearsalMark.side-axis = #1 % below
  \once \override Score.RehearsalMark.direction = #-1 % below
  \mark \markup \italic \smaller "attacca"
}
instructionI = {
  \once \override Score.RehearsalMark.self-alignment-X = #LEFT
  \once \override Score.RehearsalMark.font-size = #0.4
  \once \override Score.RehearsalMark.X-offset = #0
  \mark \markup \box \pad-around #1 {
    \smaller "First played by Piano II starting at bar 3; then by Piano I from the beginning including the black-key glissandos."
  }
}
instructionII = {
  \once \override Score.RehearsalMark.self-alignment-X = #LEFT
  \once \override Score.RehearsalMark.font-size = #0.4
  \once \override Score.RehearsalMark.X-offset = #0
  \mark \markup \box \pad-around #1 {
    \smaller "First played by Piano II; then by Piano I from bar 16 (no high C#) till the end, then from bar 1 to bar 16's first note."
  }
}
dynamicShiftA = \once \override DynamicText.X-offset = #-4
dynamicShiftB = \once \override DynamicText.X-offset = #-2
dynamicShiftC = \once \override Dynamics.DynamicText.self-alignment-X = #-0.2 % for overlap on the left with barline
dynamicShiftD = \once \override DynamicText.Y-offset = #-0.8
dynamicShiftE = \once \override DynamicText.Y-offset = #-7
dynamicShiftF = \once \override Dynamics.DynamicText.self-alignment-X = #-0.4 % for overlap on the left with barline
textScriptShiftA = \once \override TextScript.extra-offset = #'(0 . 1.4)
textScriptShiftB = \once \override TextScript.extra-offset = #'(0 . 0.5)
textScriptShiftC = \once \override TextScript.extra-offset = #'(0 . -0.5)
metronomePaddingA = \once \override Score.MetronomeMark.padding = #8
metronomePaddingB = \once \override Score.MetronomeMark.padding = #4
metronomePaddingC = \once \override Score.MetronomeMark.padding = #7
metronomePaddingD = \once \override Score.MetronomeMark.padding = #2
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
voiceFollowerA = {
  \override VoiceFollower.style = #'dashed-line
  \override VoiceFollower.Y-extent = #'(-3 . 3)
  \override VoiceFollower.bound-details = #'(
    (right
      (attach-dir . -1)
      (end-on-accidental . #t)
      (padding . 3.8)
      (Y . 4)
    )
    (left
      (attach-dir . 1)
      (padding . 3.8)
      (Y . -9.5)
    )
  )
}
voiceFollowerB = {
  \override VoiceFollower.style = #'dashed-line
  \override VoiceFollower.Y-extent = #'(-3 . 3)
  \override VoiceFollower.bound-details = #'(
    (right
      (attach-dir . -1)
      (end-on-accidental . #t)
      (padding . 2.8)
      (Y . 2.5)
    )
    (left
      (attach-dir . 1)
      (padding . 0.5)
      (Y . 9.5)
    )
  )
}
shpSlurA = \shape #'((0.2 . 0.5) (0 . 0.5) (0 . 0.5) (0 . 0.5)) PhrasingSlur
shpSlurB = \shape #'((0 . 0) (0 . 0.5) (0 . 0.5) (0 . 0.5)) PhrasingSlur
shpSlurC = \shape #'((0 . 0.2) (0 . 0.6) (0 . 0.3) (0 . 0.5)) PhrasingSlur
shpSlurD = \shape #'((0 . 0.2) (0 . 1.9) (0 . 1.5) (0 . 0.0)) PhrasingSlur
