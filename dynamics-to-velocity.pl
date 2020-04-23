use strict;
  use MIDI::XML::MidiFile;
  use MIDI::XML::Track;
  use MIDI::XML::Parser;
  use XML::Parser;

  use MIDI::Opus;
  use MIDI::Track;
  use MIDI::Event;

  unless (@ARGV) {
  die "Usage: perl test.pl filename(s)\n";
  }

  my $one = "";
  
  foreach $one (@ARGV) {
          doFile($one)
  }
  
  sub doFile($)
  {
    my $file = shift;

    my $opus = MIDI::Opus->new({ 'from_file' => "$file.mid"});
#    $opus->write_to_file("$file.b.mid");
#    saveXml($opus, "$file.1.xml");
    my $midi=MIDI::XML::MidiFile->new({'from_opus' => $opus});    
    open XML,">","$file.1.xml";
    print XML "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"; 
    print XML join("\n",$midi->as_MidiXML());
    close XML;    
    print "$file.mid has ", scalar( $opus->tracks ) , " tracks\n";  
    my $tracks = $opus->tracks_r;
    doTracks($tracks);
    $opus->write_to_file("$file.p.mid");
#    saveXml($opus, "$file.2.xml");
  }
  
  sub saveXml($)
  {
          my $opus = shift;
          my $fname = shift;
          my $midi=MIDI::XML::MidiFile->new({'from_opus' => $opus});    
          open XML,">","$fname.xml";
          print XML "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"; 
          print XML join("\n",$midi->as_MidiXML());
          close XML;              
  }
  
  sub doTracks(@){
    my $tracks = shift;
    my $t;
    foreach $t (@$tracks) {
            doTrack($t)
    }
  }
  
  sub doTrack($){
          my $t = shift;
          doEvents($t->events_r);
  }
  
  sub doEvents($) {
          my $l = shift;
          my $i;
#         print scalar(@$l), " events\n";
          my $r;
          my $v = "99";
          foreach $r (@$l) {
                  if ((@$r[0] eq "control_change")
                        &
                       (@$r[3] eq "7"))
                       {
                               $v = @$r[4];
                               @$r[4] = "90";
                       }
                       elsif (@$r[0] eq "note_on")
                       {
                               @$r[4] = $v;
                       }
          }
  }

