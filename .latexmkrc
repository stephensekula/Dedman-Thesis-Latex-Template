# This shows how to use the glossary package
# (http://www.ctan.org/pkg/glossary) and the glossaries package
# (http://www.ctan.org/pkg/glossaries) with latexmk.  Note that there
# are important differences between these two packages, so you should
# take careful note of the comments below.



# 1. For glossaries using glossary package

add_cus_dep( 'glo', 'gls', 0, 'makeglo2gls' );
sub makeglo2gls {
    system("makeindex -s \"$_[0].ist\" -t \"$_[0].glg\" -o \"$_[0].gls\" \"$_[0].glo\"" );
}



# 2. For acronyms using glossary package:

#add_cus_dep( 'acr', 'acn', 0, 'makeacr2acn' );
add_cus_dep( 'acn', 'acr', 0, 'makeacn2acr' );
sub makeacr2acn {
    system( "makeindex -s \"$_[0].ist\" -t \"$_[0].alg\" -o \"$_[0].acn\" \"$_[0].acr\"" );
}


# ===> 3. If you use the package glossaries rather than the package
# glossary, you need to EXCHANGE acn and acr in the above.

# 4. If you use the glossaries package and have the makeglossaries
#    script installed, then you can do something simpler:

   add_cus_dep( 'glo', 'gls', 0, 'makeglossaries' );
   sub makeglossaries {
      my ($base_name, $path) = fileparse( $_[0] );
      pushd $path;
      my $return = system "makeglossaries $base_name";
      popd;
      return $return;
  }

# This code works around a problem with makeglossaries when the
# -output-directory option of latexmk is used.  When makeglossaries is
# called with a filename that has a directory in it, e.g.,
#
#             makeglossaries output/document
#
# the makeindex or xindy commmands look for a document.ist or
# document.xdy file that is created by the glossaries package.  The
# file is correctly created in the output/ directory, but the
# makeindex or xindy commands are called in way that they look for
# that file in the document directory, not in the output directory.
# So the above definition of a subroutine makeglossaries works around
# that.
#
# Note that the 3rd definition of a custom dependency, the one that
# invokes the makeglossaries script, has the advantage that it can
# change automatically to use the xindy program instead of makeindex,
# according to the setting by which the glossaries package is invoked
# in the document.  The first two solutions I gave for the custom
# dependency have the choice of makeindex hard-coded (which can be
# changed, of course).  Automatic switching would need a more
# complicated solution.
