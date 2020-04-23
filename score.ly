\version "2.20.0"
\include "articulate.ly"
#(set-global-staff-size 17.5)

currentTag = #"print"
midiPan = #0.2 % affecting whole midi output, value from -1 to 1

\include "definitions.ly"
\include "makeOctaves.ly"
\include "movt-one.ly"
\include "movt-two.ly"
\include "movt-three.ly"
\include "movt-threeB.ly"

\paper {
    top-margin = 8\mm %-minimum top-margin: 8mm
    top-markup-spacing.basic-distance = #3 %-dist. from bottom of top margin to the first markup/title
    markup-system-spacing.basic-distance = #5 %-dist. from header/title to first system
    top-system-spacing.basic-distance = #12 %-dist. from top margin to system in pages with no titles
    last-bottom-spacing.basic-distance = #12 %-pads music from copyright block

    print-all-headers = ##t
    footnote-separator-markup = ##f
    oddFooterMarkup = \markup {
      \fill-line {
        "https://music.bensonby.me"
      }
    }
    evenFooterMarkup = \oddFooterMarkup
}

\book {
  \header {
    title = "Piano Battle Scene (from \"Secret\")"
    arranger = "Transcribed by Benson Yeung"
    % copyright = "https://music.bensonby.me"
    % tagline = "https://music.bensonby.me"
  }
  \score {
    <<
      \new PianoStaff <<
        \new Staff = "up" {
          \set Staff.midiInstrument = #"acoustic grand"
          \set Staff.midiMinimumVolume = #0.2
          \set Staff.midiMaximumVolume = #0.5
          \set Staff.midiPanPosition = \midiPan
          \new Voice <<
            %\articulate <<
            <<
              \keepWithTag #'midi {
                \movt-one-rh
                \movt-two-rh
                \extra-rest-before-three
                \rest-duration-three
                \movt-three-primo-rh
                \movt-threeB-primo-rh
              }
            >>
            <<
              \keepWithTag #'midi {
                \movt-one-dynamics
                \movt-two-dynamics
                \extra-rest-before-three
                \rest-duration-three
                \movt-three-primo-dynamics
                \movt-threeB-primo-dynamics
              }
            >>
            <<
              \keepWithTag #'midi {
                \movt-one-dynamics-pedal
                \movt-two-dynamics-pedal
                \extra-rest-before-three
                \rest-duration-three
                \movt-three-dynamics-pedal
                \keepWithTag #'primo \movt-threeB-dynamics-pedal
              }
            >>
            <<
              \keepWithTag #'midi {
                \rest-duration-one
                \rest-duration-two
                \extra-rest-before-three
                \rest-duration-three
                \movt-three-primo-single-staff-dynamics
              }
            >>
          >>
        }
        \new Staff = "down" {
          \set Staff.midiInstrument = #"acoustic grand"
          \set Staff.midiMinimumVolume = #0.2
          \set Staff.midiMaximumVolume = #0.5
          \set Staff.midiPanPosition = \midiPan
          \new Voice <<
            <<
              \keepWithTag #'midi {
                \movt-one-lh
                \movt-two-lh
                \extra-rest-before-three
                \rest-duration-three
                \movt-three-primo-lh
                \movt-threeB-primo-lh
              }
            >>
            <<
              \keepWithTag #'midi {
                \movt-one-dynamics
                \movt-two-dynamics
                \extra-rest-before-three
                \rest-duration-three
                \movt-three-primo-dynamics
                \movt-threeB-primo-dynamics
              }
            >>
            <<
              \keepWithTag #'midi {
                \movt-one-dynamics-pedal
                \movt-two-dynamics-pedal
                \extra-rest-before-three
                \rest-duration-three
                \movt-three-dynamics-pedal
                \keepWithTag #'primo \movt-threeB-dynamics-pedal
              }
            >>
            <<
              \keepWithTag #'midi {
                \rest-duration-one
                \rest-duration-two
                \extra-rest-before-three
                \rest-duration-three
                \movt-three-primo-single-staff-dynamics
              }
            >>
          >>
        }
      >>
      \new PianoStaff <<
        \new Staff = "up" {
          \set Staff.midiInstrument = #"acoustic grand"
          \set Staff.midiMinimumVolume = #0.2
          \set Staff.midiMaximumVolume = #0.5
          \set Staff.midiPanPosition = -\midiPan
          \new Voice <<
            <<
              \keepWithTag #'midi {
                \rest-duration-one
                \rest-duration-two
                \extra-rest-before-three
                \movt-three-secondo-rh
                \rest-duration-three
                \movt-threeB-secondo-rh
              }
            >>
            <<
              \keepWithTag #'midi {
                \rest-duration-one
                \rest-duration-two
                \extra-rest-before-three
                \movt-three-dynamics-pedal
                \rest-duration-three
                \keepWithTag #'secondo \movt-threeB-dynamics-pedal
              }
            >>
            <<
              \keepWithTag #'midi {
                \rest-duration-one
                \rest-duration-two
                \extra-rest-before-three
                \movt-three-secondo-dynamics
                \rest-duration-three
                \movt-threeB-secondo-dynamics
              }
            >>
            <<
              \keepWithTag #'midi {
                \rest-duration-one
                \rest-duration-two
                \extra-rest-before-three
                \movt-three-secondo-single-staff-dynamics
              }
            >>
          >>
        }
        \new Staff = "down" {
          \set Staff.midiInstrument = #"acoustic grand"
          \set Staff.midiMinimumVolume = #0.2
          \set Staff.midiMaximumVolume = #0.5
          \set Staff.midiPanPosition = -\midiPan
          \new Voice <<
            <<
              \keepWithTag #'midi {
                \rest-duration-one
                \rest-duration-two
                \extra-rest-before-three
                \movt-three-secondo-lh
                \rest-duration-three
                \movt-threeB-secondo-lh
              }
            >>
            <<
              \keepWithTag #'midi {
                \rest-duration-one
                \rest-duration-two
                \extra-rest-before-three
                \movt-three-dynamics-pedal
                \rest-duration-three
                \keepWithTag #'secondo \movt-threeB-dynamics-pedal
              }
            >>
            <<
              \keepWithTag #'midi {
                \rest-duration-one
                \rest-duration-two
                \extra-rest-before-three
                \movt-three-secondo-dynamics
                \rest-duration-three
                \movt-threeB-secondo-dynamics
              }
            >>
            <<
              \keepWithTag #'midi {
                \rest-duration-one
                \rest-duration-two
                \extra-rest-before-three
                \movt-three-secondo-single-staff-dynamics
                \rest-duration-three
              }
            >>
          >>
        }
      >>
    >>
    % \layout {} % uncomment to see the output of midi as score
    \midi { }
  }

  \score {
    \header {
      title = "I"
      instrument = ##f
      arranger = ##f
    }
    \new StaffGroup <<
      \new PianoStaff \with {
        instrumentName = #"Piano I/II"
      } <<
        \new Staff = "up" \with {
        } {
          \keepWithTag \currentTag \movt-one-rh
        }
        \new Dynamics = "dynamics" \with {
          \override VerticalAxisGroup.staff-affinity = #UP
          \override VerticalAxisGroup.nonstaff-relatedstaff-spacing = #'(
            (padding . 0.8)
          )
          \override VerticalAxisGroup.nonstaff-unrelatedstaff-spacing = #'(
            (padding . 0.8)
          )
        } { \movt-one-dynamics }
        \new Staff = "down" {
          <<
            { \keepWithTag \currentTag \movt-one-lh }
            { \keepWithTag \currentTag \movt-one-dynamics-pedal }
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
      title = "II"
      instrument = ##f
      arranger = ##f
    }
    \new StaffGroup <<
      \new PianoStaff \with {
        instrumentName = #"Piano I/II"
        \override StaffGrouper.staff-staff-spacing = #'(
          (basic-distance . 10)
          (padding . 5)
        )
      } <<
        \new Staff = "rh" { \keepWithTag \currentTag \movt-two-rh }
        \new Dynamics = "dynamics" \with {
          \override VerticalAxisGroup.staff-affinity = #UP
          \override VerticalAxisGroup.nonstaff-relatedstaff-spacing = #'(
            (padding . 1.5)
          )
          \override VerticalAxisGroup.nonstaff-unrelatedstaff-spacing = #'(
            (padding . 1.5)
          )
        } { \keepWithTag \currentTag \movt-two-dynamics }
        \new Staff = "lh" {
          <<
            { \keepWithTag \currentTag \movt-two-lh }
            { \keepWithTag \currentTag \movt-two-dynamics-pedal }
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
      title = "III"
      instrument = ##f
      arranger = ##f
    }
    \new StaffGroup <<
      \new PianoStaff \with {
        instrumentName = #"Piano II"
      } <<
        \new Staff = "up" { \keepWithTag \currentTag \movt-three-secondo-rh }
        \new Dynamics = "secondo-dynamics" \with {
          \override VerticalAxisGroup.staff-affinity = #UP
          \override VerticalAxisGroup.nonstaff-relatedstaff-spacing = #'(
            (padding . 1.0)
          )
          \override VerticalAxisGroup.nonstaff-unrelatedstaff-spacing = #'(
            (padding . 1.0)
          )
        } { <<
          { \movt-three-secondo-single-staff-dynamics }
          { \movt-three-secondo-dynamics }
        >> }
        \new Staff = "down" { \keepWithTag \currentTag \movt-three-secondo-lh }
      >>
    >>
    \layout {
      \context {
        \PianoStaff
        \accepts Dynamics
      }
    }
  }
  \score {
    \header {
      title = ##f
      instrument = ##f
      arranger = ##f
    }
    \new StaffGroup <<
      \new PianoStaff \with {
        instrumentName = #"Piano I"
      } <<
        \new Staff = "primo-rh" { \keepWithTag \currentTag \movt-three-primo-rh }
        \new Dynamics = "primo-dynamics" \movt-three-primo-dynamics
        \new Staff = "primo-lh" \with {
        } { \keepWithTag \currentTag \movt-three-primo-lh }
        \new Dynamics = "primo-single-staff-dynamics" \with {
          \override VerticalAxisGroup.staff-affinity = #UP
          \override VerticalAxisGroup.nonstaff-relatedstaff-spacing = #'(
            (padding . 1)
          )
        } { \movt-three-primo-single-staff-dynamics }
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
    \header {
      title = ##f
      instrument = ##f
      arranger = ##f
    }
    \new StaffGroup <<
      \new PianoStaff \with {
        instrumentName = #"Piano I"
        \override StaffGrouper.staff-staff-spacing = #'(
          (basic-distance . 7)
          (padding . 1.5))
        \override StaffGrouper.staffgroup-staff-spacing = #'(
          (basic-distance . 10)
          (padding . 2.5))
      } <<
        \new Staff = "up" { \keepWithTag \currentTag \movt-threeB-primo-rh }
        \new Dynamics = "primo-dynamics" \with {
          \override VerticalAxisGroup.staff-affinity = #UP
          \override VerticalAxisGroup.nonstaff-relatedstaff-spacing = #'(
            (basic-distance . 0.7)
            (padding . 1.5)
          )
          \override VerticalAxisGroup.nonstaff-unrelatedstaff-spacing = #'(
            (basic-distance . 0.7)
            (padding . 1.5)
          )
        } \movt-threeB-primo-dynamics
        \new Staff = "down" { \keepWithTag \currentTag \movt-threeB-primo-lh }
      >>
      \new PianoStaff \with {
        instrumentName = #"Piano II"
        \override StaffGrouper.staff-staff-spacing = #'(
          (basic-distance . 7)
          (padding . 2))
      } <<
        \new Staff = "up" { \keepWithTag \currentTag \movt-threeB-secondo-rh }
        \new Dynamics = "secondo-dynamics" \movt-threeB-secondo-dynamics
        \new Staff = "down" { \keepWithTag \currentTag \movt-threeB-secondo-lh }
      >>
    >>
    \layout { }
  }
}
