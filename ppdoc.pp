// vim: set filetype=pp2html : 
// Comment: ppdoc.pp: documentation and testfile for pp2html
//
// $Id: ppdoc.pp,v 1.6 2000/12/10 22:48:37 lorenz Exp $
// $Revision: 1.6 $
// $Date: 2000/12/10 22:48:37 $

// Some variabels:

$pp2html = pp2html
$pp2latex = pp2latex
$testfile = ppdoc.pp

=Introduction

This file \C<ppdoc.pp>  is a short introduction to \C<pp2html>
and serves also as a \X<test case> for
\C<pp2html> and \C<pp2latex>.

All features which have been implemented so far are presented in the
following. It is recommended to compare this file with the results
from \C<pp2html> and \C<pp2latex>.

==Features of pp2html

The most important \X<features> of \C<pp2html> are:

* Simple ASCII file in PerlPoint format as source

* Automated generation of table of contents and navigation

* Optional index generation

* Possibility for simple character formatting

* Optional frame sets

* Support for TreeApplet in table of contents

==Usage

To convert this file into \I<HTML> or \I<LaTeX> and \I<Postscript> type the
following commands:

<<EOC
  % pp2html @ex_std_norm.cfg ppdoc.pp

  % pp2latex @ltx.cfg ppdoc.pp > ppdoc.tex
  % latex ppdoc.tex
  % latex ppdoc.tex
  % dvips -o ppdoc.ps ppdoc.dvi
  % ghostview ppdoc.ps
EOC

The first command creates all HTML slides. Naming conventions are set up via
options in the \C<pp.cfg> configuration file.

The commands starting with \C<pp2latex> create a LaTeX file and from this a
Postscript file. Note that the \C<latex> command is called twice. This is necessary
in order to update all internal links and cross references before the final
document is created.


=Headers

Headers are introduced by \X<equal signs> (=) at the beginning of a line.
The number of equal signs determines the level of the header: \X{mode=index_only}<header, level of>

 =A Header of Level One

 ==Second Level Header

 ===Third Level Header

Each \X<header> \B<must> be followed by a blank line.

Here come some tests for index entries with german characters:
Index entries which start with a german \I<Umlaut> like \X<Übertrag>
or \X<ärgerlich> should be sorted to the corresponding non-umlaut characters
within the index.

It should also be possible to have multiple index entries with the same
name in different places. Here is another entry \X<line feed> ...


=Paragraphs

The following paragraph types are used by \C<pp2html>:

* Normal text paragraphs

* Block paragraphs

* Verbatim block (here documents)

* List paragraphs

* Shift paragraphs

* Table paragraphs

* Macro paragraphs (PerlPoint::Parser 0.21)

For a detailed description refer to the
documentation of the PerlPoint format.
PerlPoint::Parser, PerlPoint::Backend

\INCLUDE{type=PP file="doc/parser-paragraphs.pp"}


=Tags

There are three kinds of tags:

* General tags provided by PerlPoint::Parser

* Special purpose tags provided by PerlPoint::Parser

* Backend tags defined by \C<pp2html>

\INCLUDE{type=PP file="doc/parser-tags.pp" headlinebase=1}

==Backend Tags

The following list shows all tags which are provided by \C<pp2html> in addition
to the tags which are provided by the \C<PerlPoint::Parser> (like \\INCLUDE):

* BOXCOLOR

* BOXTEXT

* IMAGE

* PAGEREF

* SECTIONREF

* XREF

* A

* B

* C

* I

* U

* L

* U

* SUB

* SUP

* E

* F

* X

* LINE_BREAK

* BR

* HR


=Formatting

\C<pp2html> supports some simple \X<character formattings> as well as line breaks.

Special characters for HTML and LaTeX are escaped automatically. The following
characters should be printed correctly by \C<pp2html> and \C<latex>:

Special: \X<\>>, <, &, ~, $, %, ^, _, {, }

(greater than, less than, ampersand, tilde, dollar sign, percent sing, carret, underscore, curly braces)


==Character Formatting

\C<pp2html> supports the following character formattings:

* Bold

* Italic

* Code

* Understroke

* Subscript and Superscript


The \\B\< ... \> tag prints text in \B<bold>

The \\I\< ... \> tag prints text in \I<italics>

The \\C\< ... \> tag prints text in \C<typewriter>

The \\U\< ... \> tag prints text with \U<understroke>

The \\SUP\< ... \> tag creates \SUP<superscripts>

The \\SUB\< ... \> tag creates \SUB<subscripts>

==Color Tag

There is a \F{size="+2" color="#CC0000"}<special> 
tag \\F\{color=value size=value face=value\}\< .... text ...\>
which allows to change color and size and face of the text.



==Line Feeds

It is possible to force a \X<line feed> by using the tag \\LINE_BREAK or \\BR.
Here an example:

<<EOT
 This short sentence is \BR
 continued on the next line \LINE_BREAK
 ...
EOT

This short sentence is \BR
continued on the next line \LINE_BREAK
...

=Layout Examples

The following sections show some examples for the layout
possibilities of \C<pp2html>. You will see examples for

* Lists

* Tables

* Blocks

* Images


==Lists

First at all a bullet list: \A{name=bullets}

* Start each bullet item with an asterisk (*) at the beginning of a line.

* Each bullet must be followed by a blank line.

* Very long bullet items can be written
on several consecutive lines but note: the following lines
must not start with a blank!

* The list is closed when another paragraph type or list type follows.

The above bullet list has been created by the following lines:

 * Start each bullet item with an asterisk (*) at the beginning of a line.

 * Each bullet must be followed by a blank line.

 * Very long bullet items can be written
 on several consecutive lines but note: the following lines
 must not start with a blank!

 * The list is closed when another paragraph type or list type follows.

Ordered lists are numbered \X<automatically>:

# List items start with a hash sign (#) in column one.

# Each item must be finished by a blank line.

This ordered list has been created by:

 # List items start with a hash sign (#) in column one.

 # Each item must be finished by a blank line.

And now an example for a definition list:

:\B<var>: this is a variable

:\I<const>:
this is a constant

The defining lines are:

 :\\B<var\>: this is a variable

 :\\I<const\>:
 this is a constant

\X<1 & 1> is an internet company.

==Shift Paragraphs

There are special \I<shift paragraphs> which start with a \> or < sign.
These paragraphs are special in that they do not contain a text body. They are
only used to increase or decrease the level of nesting for list items.

\B<Example:>

* This is a list item in a level 0 list

* This is item two of the top level list

>

* this is item 1 of a sub-list

* the sub-list has been started by a > shift paragraph

<

* now we are again on level 0

* last list item

got it?

\B<Syntax Example>:

  * item 1, level 0

  >

  * item on level 1

  <

  * back on level 0






==Block Handling

\I<Blocks> are pieces of text that should be layouted as pre-formatted text.
Line breaks and indentation should not be modified.

Blocks are typically used for showing examples and pieces of code. \C<pp2html>
places block text in a box with colored background. The foreground and background color can be
selected via the \C<--boxtext_color=color> and \C<--box_color=color> options or by using 
the \\BOXTEXT\<color\> and \\BOXCOLOR\<color\> tag.


Now follows a \I<verbatim> block. Note that the box color has been switched to green:
\BOXCOLOR<green>

 This is a verbatim \B<block>
 with tag - recognition; the text "block" should be printed \I<bold>

The effect can only be seen, however, when the \C<--boxtext_bold> option has been set to \C<OFF>.

$boxcolor="red"
\BOXCOLOR<white>
\BOXTEXT<blue>

<<EOT
   This block now is strictly verbatim. Note that the first
line has been indented by three blanks.
The ankle brackets <  > and the \B<> tag should not
be interpreted in a special meaning but printed as they
have been typed. This should also be true for the ampersand (&)
EOT

\BOXCOLOR<blue>
\BOXTEXT<white>

==Tables

A table paragraph is started with a \B<@> sign followed by a character which is to be
used as column separator.

@,
 Operating system , Supported
 Sun OS , yes
 Linux  , yes
 NT     , no

The above table was produced by

<<EOT
@,
 Operating system , Supported
 Sun OS , yes
 Linux  , yes
 NT     , no
EOT

There is also a \X<\\TABLE> tag which allows to set different parameters like
\I<border width> or \I<background color>. The following tables are created with this tag:

\TABLE{separator=";" bgcolor=yellow head_bgcolor="silver"}
pro ; contra
more flexibiliy ; more "line noise"
colored heading ; -

\END_TABLE

\TABLE{separator=";" border=4}
pro ; contra
more flexibiliy ; more "line noise"
colored heading ; -

\END_TABLE


==Images

It is possible to insert GIF or JPEG images into the text:

\IMAGE{src="../images/karawane-50.gif" height=50 width=150 alt="The camel is your friend" align=right}

The syntax is:

  \\IMAGE{src="../images/karawane-50.gif" alt="The camel is your friend" 
      height=50  width=200 align=right}

=Internal Links and References

In order to \X<use> internal \X<hyperlinks> and \X<cross references> 
it is necessary to place a \C<\X<label>> or \C<anchor> at the postition 
where the link should aim to.

On this page an \X<anchor> has been placed right here:
\A{name="anker_1"} Of course this anchor is not visible. Anchors are
stated in the form \\A\{name=anker_name\}.

There are three sorts of internal references:

* page references: \X<\\PAGEREF>

* chapter references: \X<\\SECTIONREF>

* cross references: \X<\\XREF>

Now here is a link to chapter \SECTIONREF{name=bullets}.

And this line shows a cross reference: see the \XREF{name=bullets}<list chapter>.

The description of bullet lists can be found in chapter \PAGEREF{name=bullets}.

\B<Note:> It is important that the \\X tag is the innermost tag in case of nested tags
(for example when the indexed word should also be printed in \I<italics>).

=Creating an Index

To put a word or a sentence into the \X<index> the text is enclosed by
the \\X\< ... \> tag. The \\X tag can have an optional parameter which prevents
the indexed text to be printed in the current text:

<<EOT
 \X{mode="index_only"}<Manual, read the fine> RFM bug
EOT

This can hence be used to include a notion which refers to the current chapter into
the index without printing this word explicitly in the current text.

\B<Note:> This is also useful if you want to have a word from a heading be included in the index.
The index tag is not allowed inside a heading. Therefore you must use an \I<index_only> entry right below
the heading.

The index is normally printed at the very end of a document. In \C<pp2latex>, however,
it is possible to place the index at any position using the \X<\\PRINT_INDEX> tag.

(not yet implemented)

=Table of Contents

The \X<table of contents> is normally printed at the beginning of the document. In \C<pp2latex>, however,
it is possible to print the table of contents at any position 
with the \X<\\PRINT_TOC> tag.

(not yet implemented)

// Some advanced features:

\INCLUDE{type=PP file="doc/parser-active-contents.pp"}

=Literatur, Links

This chapter presents some hints for further reading.

See for example:

  http://www.reportlab.com/demos/pythonpoint/pythonpoint.html

