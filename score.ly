\version "2.18.2"
\include "articulate.ly"
#(set-global-staff-size 16)

cr = \change Staff = "rh"
cl = \change Staff = "lh"
cpr = \change Staff = "primo-rh"
cpl = \change Staff = "primo-lh"
csr = \change Staff = "secondo-rh"
csl = \change Staff = "secondo-lh"
son = \sustainOn
soff = \sustainOff
rhMark = \markup { 
  \path #0.1 #'((moveto -1 0)(rlineto 0 -1.5)(rlineto 0.5 0))
}

\include "makeOctaves.ly"
\include "movt-one.ly"
\include "movt-two.ly"
\include "movt-three.ly"

\paper {
    top-margin = 6\mm                              %-minimum top-margin: 8mm
    top-markup-spacing.basic-distance = #6         %-dist. from bottom of top margin to the first markup/title
    markup-system-spacing.basic-distance = #5      %-dist. from header/title to first system
    top-system-spacing.basic-distance = #12         %-dist. from top margin to system in pages with no titles
    last-bottom-spacing.basic-distance = #12        %-pads music from copyright block
}

\book {
  \header {
    title = "Piano Battle from 'Secret'"
    arranger = "Transcribed by Benson"
    copyright = "https://music.bensonby.me"
    tagline = "https://music.bensonby.me"
  }
  \score {
    <<
      \new PianoStaff <<
        \new Staff = "rh" {
          \set Staff.midiInstrument = #"acoustic grand"
          \set Staff.midiMinimumVolume = #0.2
          \set Staff.midiMaximumVolume = #0.5
          \articulate <<
            \keepWithTag #'midi
            << { \movt-one-rh } { \movt-one-dynamics-pedal } >>
          >>
          \articulate <<
            \keepWithTag #'midi
            \movt-two-rh
          >>
          \articulate <<
            \keepWithTag #'midi
            \movt-three-primo-rh
          >>
        }
        \new Dynamics = "dynamics" <<
          \keepWithTag #'midi
          \movt-one-dynamics
          \movt-two-dynamics
          \movt-three-primo-dynamics
        >>
        \new Staff = "lh" {
          \set Staff.midiInstrument = #"acoustic grand"
          \set Staff.midiMinimumVolume = #0.2
          \set Staff.midiMaximumVolume = #0.5
          \articulate <<
            \keepWithTag #'midi
            << { \movt-one-lh } { \movt-one-dynamics-pedal } >>
          >>
          \articulate <<
            \keepWithTag #'midi
            \movt-two-lh
          >>
          \articulate <<
            \keepWithTag #'midi
            \movt-three-primo-lh
          >>
        }
      >>
      \new PianoStaff <<
        \new Staff = "secondo-rh" {
          \set Staff.midiInstrument = #"acoustic grand"
          \set Staff.midiMinimumVolume = #0.2
          \set Staff.midiMaximumVolume = #0.5
          \keepWithTag #'midi
          #(skip-of-length movt-one-rh)
          #(skip-of-length movt-two-rh)
          \articulate <<
            \keepWithTag #'midi
            \movt-three-secondo-rh
          >>
        }
        \new Dynamics = "dynamics" <<
          \keepWithTag #'midi
          #(skip-of-length movt-one-rh)
          #(skip-of-length movt-two-rh)
          \movt-three-secondo-dynamics
        >>
        \new Staff = "secondo-lh" {
          \set Staff.midiInstrument = #"acoustic grand"
          \set Staff.midiMinimumVolume = #0.2
          \set Staff.midiMaximumVolume = #0.5
          \keepWithTag #'midi
          #(skip-of-length movt-one-rh)
          #(skip-of-length movt-two-rh)
          \articulate <<
            \keepWithTag #'midi
            \movt-three-secondo-lh
          >>
        }
      >>
    >>
    \midi {
    }
  }

  \score {
    \header {
      piece = "I"
    }
    \new StaffGroup <<
      \new PianoStaff <<
        \new Staff = "rh" { \removeWithTag #'midi \movt-one-rh }
        \new Dynamics = "dynamics" \movt-one-dynamics
        \new Staff = "lh" {
          <<
            { \removeWithTag #'midi \movt-one-lh }
            { \movt-one-dynamics-pedal }
          >>
        }
      >>
    >>
    \layout {
    }
  }
  \pageBreak
  \score {
    \header {
      piece = "II"
    }
    \new StaffGroup <<
      \new PianoStaff <<
        \new Staff = "rh" { \removeWithTag #'midi \movt-two-rh }
        \new Dynamics = "dynamics" \movt-two-dynamics
        \new Staff = "lh" { \removeWithTag #'midi \movt-two-lh }
      >>
    >>
    \layout {
    }
  }
  \pageBreak
  \score {
    \header {
      piece = "III"
    }
    \new StaffGroup <<
      \new PianoStaff <<
        \new Staff = "primo-rh" { \removeWithTag #'midi \movt-three-primo-rh }
        \new Dynamics = "primo-dynamics" \movt-three-primo-dynamics
        \new Staff = "primo-lh" { \removeWithTag #'midi \movt-three-primo-lh }
      >>
      \new PianoStaff <<
        \new Staff = "secondo-rh" { \removeWithTag #'midi \movt-three-secondo-rh }
        \new Dynamics = "secondo-dynamics" \movt-three-secondo-dynamics
        \new Staff = "secondo-lh" { \removeWithTag #'midi \movt-three-secondo-lh }
      >>
    >>
    \layout {
    }
  }
}
