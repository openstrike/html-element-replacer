# This might look like shell script, but it's actually -*- perl -*-
use lib qw(t/ t/m/);

use Test::More qw(no_plan);

use TestUtils;

use HTML::Element::Replacer;


sub tage {

  my $root = "t/html/replacer/replacer";

  my $tree = HTML::TreeBuilder->new_from_file("$root.initial")->guts;

  my @data = ( { brand => 'schlitz', age => 'young' },
               { brand => 'lowenbrau', age => 24 },
               { brand => 'miller', age=>17} );

  {
  my $R = HTML::Element::Replacer->new(tree => $tree,
                                       look_down => [ scla => 'mid']);
  for my $data (@data) {
      $R->push_clone->defmap(kmap => $data);
  }
}

  my $generated_html = $tree->as_HTML;

  is ($generated_html,
      HTML::TreeBuilder->new_from_file("$root.exp")->guts->as_HTML,
      'HTML');
}


tage();

