\version "2.20.0"
\include "articulate.ly"
#(set-global-staff-size 17.5)

\include "definitions.ly"
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
        \new Staff = "up" {
          \set Staff.midiInstrument = #"acoustic grand"
          \set Staff.midiMinimumVolume = #0.2
          \set Staff.midiMaximumVolume = #0.5
          \articulate <<
            <<
              { \keepWithTag #'midi \movt-one-rh }
              { \keepWithTag #'midi \movt-one-dynamics-pedal }
            >>
          >>
          \articulate <<
            { \keepWithTag #'midi \movt-two-rh }
            { \keepWithTag #'midi \movt-two-dynamics-pedal }
          >>
          \extra-rest-before-three
          \rest-duration-three
          \articulate <<
            { \keepWithTag #'midi \movt-three-primo-rh }
            { \keepWithTag #'midi \movt-three-dynamics-pedal }
          >>
          \articulate <<
            { \keepWithTag #'midi \movt-threeB-primo-rh }
            { \keepWithTag #'primo \movt-threeB-dynamics-pedal }
          >>
        }
        \new Dynamics = "dynamics" <<
          \keepWithTag #'midi
          \movt-one-dynamics
          \movt-two-dynamics
          \extra-rest-before-three
          <<
            { \movt-three-primo-dynamics }
            { \movt-three-primo-single-staff-dynamics }
          >>
        >>
        \new Staff = "down" {
          \set Staff.midiInstrument = #"acoustic grand"
          \set Staff.midiMinimumVolume = #0.2
          \set Staff.midiMaximumVolume = #0.5
          \articulate <<
            <<
              { \keepWithTag #'midi \movt-one-lh }
              { \keepWithTag #'midi \movt-one-dynamics-pedal }
            >>
          >>
          \articulate <<
            <<
              { \keepWithTag #'midi \movt-two-lh }
              { \keepWithTag #'midi \movt-two-dynamics-pedal }
            >>
          >>
          \extra-rest-before-three
          \rest-duration-three
          \articulate <<
            { \keepWithTag #'midi \movt-three-primo-lh }
            { \keepWithTag #'midi \movt-three-dynamics-pedal }
          >>
          \articulate <<
            { \keepWithTag #'midi \movt-threeB-primo-lh }
            { \keepWithTag #'primo \movt-threeB-dynamics-pedal }
          >>
        }
      >>
      \new PianoStaff <<
        \new Staff = "up" {
          \set Staff.midiInstrument = #"acoustic grand"
          \set Staff.midiMinimumVolume = #0.2
          \set Staff.midiMaximumVolume = #0.5
          \keepWithTag #'midi
          \rest-duration-one
          \rest-duration-two
          \extra-rest-before-three
          \articulate <<
            { \keepWithTag #'midi \movt-three-secondo-rh }
            { \keepWithTag #'midi \movt-three-dynamics-pedal }
          >>
          \rest-duration-three
          \articulate <<
            { \keepWithTag #'midi \movt-threeB-secondo-rh }
            { \keepWithTag #'secondo \movt-threeB-dynamics-pedal }
          >>
        }
        \new Dynamics = "dynamics" <<
          \keepWithTag #'midi
          \rest-duration-one
          \rest-duration-two
          \extra-rest-before-three
          << 
            { \movt-three-secondo-dynamics }
            { \movt-three-secondo-single-staff-dynamics }
          >>
          \rest-duration-three
          \movt-threeB-secondo-dynamics
        >>
        \new Staff = "down" {
          \set Staff.midiInstrument = #"acoustic grand"
          \set Staff.midiMinimumVolume = #0.2
          \set Staff.midiMaximumVolume = #0.5
          \keepWithTag #'midi
          \rest-duration-one
          \rest-duration-two
          \extra-rest-before-three
          \articulate <<
            { \keepWithTag #'midi \movt-three-secondo-lh }
            { \keepWithTag #'midi \movt-three-dynamics-pedal }
          >>
          \rest-duration-three
          \articulate <<
            { \keepWithTag #'midi \movt-threeB-secondo-lh }
            { \keepWithTag #'secondo \movt-threeB-dynamics-pedal }
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
        \new Staff = "up" \with {
        } {
          \keepWithTag #'print \movt-one-rh
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
            { \keepWithTag #'print \movt-one-lh }
            { \keepWithTag #'print \movt-one-dynamics-pedal }
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
        \new Dynamics = "dynamics" \with {
          \override VerticalAxisGroup.staff-affinity = #UP
          \override VerticalAxisGroup.nonstaff-relatedstaff-spacing = #'(
            (padding . 1.5)
          )
          \override VerticalAxisGroup.nonstaff-unrelatedstaff-spacing = #'(
            (padding . 1.5)
          )
        } { \movt-two-dynamics }
        \new Staff = "lh" {
          <<
            { \keepWithTag #'print \movt-two-lh }
            { \keepWithTag #'print \movt-two-dynamics-pedal }
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
        \new Staff = "up" { \keepWithTag #'print \movt-three-secondo-rh }
        \new Dynamics = "secondo-dynamics" \movt-three-secondo-dynamics
        \new Staff = "down" { \keepWithTag #'print \movt-three-secondo-lh }
        \new Dynamics = "secondo-single-staff-dynamics" \with {
          \override VerticalAxisGroup.staff-affinity = #UP
          \override VerticalAxisGroup.nonstaff-relatedstaff-spacing = #'(
            (padding . 1)
          )
        } { \movt-three-secondo-single-staff-dynamics }
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
        \new Staff = "primo-lh" \with {
        } { \keepWithTag #'print \movt-three-primo-lh }
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
    \new StaffGroup <<
      \new PianoStaff \with {
        instrumentName = #"Piano I"
        \override StaffGrouper.staff-staff-spacing = #'(
          (basic-distance . 7)
          (padding . 2))
        \override StaffGrouper.staffgroup-staff-spacing = #'(
          (basic-distance . 10)
          (padding . 3))
      } <<
        \new Staff = "up" { \keepWithTag #'print \movt-threeB-primo-rh }
        \new Dynamics = "primo-dynamics" \movt-threeB-primo-dynamics
        \new Staff = "down" { \keepWithTag #'print \movt-threeB-primo-lh }
      >>
      \new PianoStaff \with {
        instrumentName = #"Piano II"
        \override StaffGrouper.staff-staff-spacing = #'(
          (basic-distance . 7)
          (padding . 2))
      } <<
        \new Staff = "up" { \keepWithTag #'print \movt-threeB-secondo-rh }
        \new Dynamics = "secondo-dynamics" \movt-threeB-secondo-dynamics
        \new Staff = "down" { \keepWithTag #'print \movt-threeB-secondo-lh }
      >>
    >>
    \layout { }
  }
}
