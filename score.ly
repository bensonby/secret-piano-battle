\version "2.18.2"
\include "articulate.ly"
#(set-global-staff-size 18)

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
\include "movt-threeB.ly"

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
          <<
            { \movt-three-primo-dynamics }
            { \movt-three-primo-single-staff-dynamics }
          >>
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
            << { \movt-two-lh } { \movt-two-dynamics-pedal } >>
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
        \new Staff = "rh" { \keepWithTag #'print \movt-one-rh }
        \new Dynamics = "dynamics" \movt-one-dynamics
        \new Staff = "lh" {
          <<
            { \keepWithTag #'print \movt-one-lh }
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
        \new Staff = "rh" { \keepWithTag #'print \movt-two-rh }
        \new Dynamics = "dynamics" \movt-two-dynamics
        \new Staff = "lh" {
          <<
            { \keepWithTag #'print \movt-two-lh }
            { \movt-two-dynamics-pedal }
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
      piece = "III"
    }
    \new StaffGroup <<
      \new PianoStaff \with {
        instrumentName = #"Piano II"
      } <<
        \new Staff = "secondo-rh" { \keepWithTag #'print \movt-three-secondo-rh }
        \new Dynamics = "secondo-dynamics" \movt-three-secondo-dynamics
        \new Staff = "secondo-lh" { \keepWithTag #'print \movt-three-secondo-lh }
        \new Dynamics = "secondo-single-staff-dynamics" \movt-three-secondo-single-staff-dynamics
      >>
    >>
    \layout {
      \context {
        \Staff \RemoveEmptyStaves
      }
      \context {
        \PianoStaff
        \accepts Dynamics
        \remove "Keep_alive_together_engraver"
      }
      \context {
        \Score
        \override VerticalAxisGroup #'remove-first = ##t
      }
    }
  }
  \score {
    \new StaffGroup <<
      \new PianoStaff \with {
        instrumentName = #"Piano I"
      } <<
        \new Staff = "primo-rh" { \keepWithTag #'print \movt-three-primo-rh }
        \new Dynamics = "primo-dynamics" \movt-three-primo-dynamics
        \new Staff = "primo-lh" { \keepWithTag #'print \movt-three-primo-lh }
        \new Dynamics = "primo-single-staff-dynamics" \movt-three-primo-single-staff-dynamics
      >>
    >>
    \layout {
      \context {
        \Staff \RemoveEmptyStaves
      }
      \context {
        \PianoStaff
        \accepts Dynamics
        \remove "Keep_alive_together_engraver"
      }
      \context {
        \Score
        \override VerticalAxisGroup #'remove-first = ##t
      }
    }
  }
  \score {
    \new StaffGroup <<
      \new PianoStaff \with {
        instrumentName = #"Piano I"
      } <<
        \new Staff = "primo-rh" { \keepWithTag #'print \movt-threeB-primo-rh }
        \new Dynamics = "primo-dynamics" \movt-threeB-primo-dynamics
        \new Staff = "primo-lh" { \keepWithTag #'print \movt-threeB-primo-lh }
      >>
      \new PianoStaff \with {
        instrumentName = #"Piano II"
      } <<
        \new Staff = "secondo-rh" { \keepWithTag #'print \movt-threeB-secondo-rh }
        \new Dynamics = "secondo-dynamics" \movt-threeB-secondo-dynamics
        \new Staff = "secondo-lh" { \keepWithTag #'print \movt-threeB-secondo-lh }
      >>
    >>
    \layout { }
  }
}
