%%
%% This is file `gbt-7714-2015-numerical.bst',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% gbt-7714-2015.dtx  (with options: `numerical')
%% 
%% Copyright (C) 2016-2016 by Zeping Lee <zepinglee AT gmail.com>
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either
%% version 1.2 of this license or (at your option) any later
%% version. The latest version of this license is in:
%% 
%%     http://www.latex-project.org/lppl.txt
%% 
%% and version 1.2 or later is part of all distributions of
%% LaTeX version 1999/12/01 or later.
%% 
%% This BibTeX style file is derived from `plainnat.bst' by Patrick W Daly,
%% which was designed for use with the `natbib.sty' package.
%% 
ENTRY
  { address
    author
    booktitle
    chapter
    citedate
    doi
    eid
    edition
    editor
    editdate
    howpublished
    institution
    isbn
    issn
    journal
    key
    language
    mark
    media
    month
    note
    number
    organization
    pages
    publisher
    school
    series
    title
    translator
    type
    url
    volume
    year
  }
  { lang }
  { label extra.label sort.label short.list }

INTEGERS { output.state before.all mid.sentence after.sentence after.block }
INTEGERS { lang.zh lang.ja lang.en lang.ru lang.default }

FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
  #4 'lang.zh :=
  #5 'lang.ja :=
  #1 'lang.en :=
  #3 'lang.ru :=
  #0 'lang.default :=
}

STRINGS { s t }

FUNCTION {debug}
{ 's :=
  duplicate$
  "DEBUG: " s * " -> `" *
  swap$ * "'" *
  top$
}

FUNCTION {debug.int}
{ 's :=
  duplicate$ int.to.str$
  "DEBUG: " s * " == " *
  swap$ *
  top$
}

FUNCTION {output.nonnull}
{ 's :=
  output.state mid.sentence =
    { ", " * write$ }
    { output.state after.block =
        { add.period$ write$
          newline$
          "\newblock " write$
        }
        { output.state before.all =
            'write$
            { add.period$ " " * write$ }
          if$
        }
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}

FUNCTION {output.after}
{ 't :=
  duplicate$ empty$
    'pop$
    { 's :=
      output.state mid.sentence =
        { t * write$ }
        { output.state after.block =
            { t * write$
              newline$
              "\newblock " write$
            }
            { output.state before.all =
                'write$
                { t * write$ }
              if$
            }
          if$
          mid.sentence 'output.state :=
        }
      if$
      s
    }
  if$
}

FUNCTION {punct.colon}
{ ": "
}

FUNCTION {punct.slash}
{ "//"
}

FUNCTION {punct.space}
{ " "
}

FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}

FUNCTION {fin.entry}
{ add.period$
  write$
  newline$
}

FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { after.block 'output.state := }
  if$
}

FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
        'skip$
        { after.sentence 'output.state := }
      if$
    }
  if$
}

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}

FUNCTION {new.block.checka}
{ empty$
    'skip$
    'new.block
  if$
}

FUNCTION {new.block.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.block
  if$
}

FUNCTION {new.sentence.checka}
{ empty$
    'skip$
    'new.sentence
  if$
}

FUNCTION {new.sentence.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.sentence
  if$
}

FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

FUNCTION {emphasize}
{ duplicate$ empty$
    { pop$ "" }
    { "\emph{" swap$ * "}" * }
  if$
}

FUNCTION {is.in.chinese}
{ lang lang.zh =
}

FUNCTION {format.et.al}
{ is.in.chinese
    { "等"}
    { "et~al." }
  if$
}

FUNCTION {format.anonymous}
{ is.in.chinese
    { "佚名"}
    { "Anon, " year * }
  if$
}

INTEGERS { nameptr namesleft numnames }

FUNCTION {format.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > nameptr #4 < and }
    { s nameptr "{vv~}{ll}{ f{ }}{ jj}" format.name$ 't :=
      nameptr #1 >
        { namesleft #1 >
            { ", " * t * }
            { t "others" =
                { ", " * format.et.al * }
                { ", " * t * }
              if$
            }
          if$
          nameptr #3 = namesleft #1 > and
            { ", " * format.et.al * }
            'skip$
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {format.key}
{ empty$
    { key field.or.null }
    { "" }
  if$
}

FUNCTION {format.authors}
{ author empty$
    { "" }
    { author format.names }
  if$
}

FUNCTION {format.editors}
{ editor empty$
    { "" }
    { editor format.names
    }
  if$
}

FUNCTION {format.translators}
{ translator empty$
    { "" }
    { translator format.names
      is.in.chinese
        { ",译" * }
        'skip$
      if$
    }
  if$
}

FUNCTION {format.isbn}
{ isbn empty$
    { "" }
    { new.block "ISBN " isbn * }
  if$
}

FUNCTION {format.issn}
{ issn empty$
    { "" }
    { new.block "ISSN " issn * }
  if$
}

FUNCTION {format.url}
{ url empty$
    { "" }
    { new.block "\url{" url * "}" * }
  if$
}

FUNCTION {format.doi}
{ doi empty$
    { "" }
    { new.block "\doi{" doi * "}" * }
  if$
}

FUNCTION {format.title}
{ title empty$
    { "" }
    { title "t" change.case$ }
  if$
}

FUNCTION {format.mark}
{ mark empty$
    'skip$
    { pop$ mark }
  if$
  "[" swap$ *
  media empty$
    { url empty$
        'skip$
        { "/OL" * }
      if$
    }
    { "/" * media * }
  if$
  "]" *
}

FUNCTION {format.full.names}
{'s :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      "{vv~}{ll}" format.name$ 't :=
      nameptr #1 >
        {
          namesleft #1 >
            { ", " * t * }
            {
              numnames #2 >
                { "," * }
                'skip$
              if$
              t "others" =
                { " et~al." * }
                { " and " * t * }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {author.editor.full}
{ author empty$
    { editor empty$
        { "" }
        { editor format.full.names }
      if$
    }
    { author format.full.names }
  if$
}

FUNCTION {author.full}
{ author empty$
    { "" }
    { author format.full.names }
  if$
}

FUNCTION {editor.full}
{ editor empty$
    { "" }
    { editor format.full.names }
  if$
}

FUNCTION {make.full.names}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.full
    { type$ "proceedings" =
        'editor.full
        'author.full
      if$
    }
  if$
}

FUNCTION {output.bibitem}
{ newline$
  "\bibitem[" write$
  label write$
  ")" make.full.names duplicate$ short.list =
     { pop$ }
     { * }
   if$
  "]{" * write$
  cite$ write$
  "}" write$
  newline$
  ""
  before.all 'output.state :=
}


FUNCTION {n.dashify}
{ 't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "-" =
        { t #1 #2 substring$ "--" = not
            { "--" *
              t #2 global.max$ substring$ 't :=
            }
            {   { t #1 #1 substring$ "-" = }
                { "-" *
                  t #2 global.max$ substring$ 't :=
                }
              while$
            }
          if$
        }
        { t #1 #1 substring$ *
          t #2 global.max$ substring$ 't :=
        }
      if$
    }
  while$
}

FUNCTION {format.date}
{ year duplicate$ empty$
    { "empty year in " cite$ * warning$
       pop$ "" }
    'skip$
  if$
  month empty$
    'skip$
    { month
      " " * swap$ *
    }
  if$
  extra.label *
}

FUNCTION {format.editdate}
{ editdate empty$
    { "" }
    { "(" citedate * ")" * }
  if$
}

FUNCTION {format.citedate}
{ citedate empty$
    { "" }
    { "[" citedate * "]" * }
  if$
}

FUNCTION {format.btitle}
{ title emphasize
}

FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$ * *
}

FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}

FUNCTION {is.digit}
{ duplicate$ empty$
    { pop$ #0 }
    { chr.to.int$
      duplicate$ "0" chr.to.int$ <
      { pop$ #0 }
      { "9" chr.to.int$ >
          { #0 }
          { #1 }
        if$
      }
    if$
    }
  if$
}

INTEGERS { charptr stringlength }

FUNCTION {is.number}
{ 's :=
  s empty$
    { #0 }
    { s text.length$ 'charptr :=
        { charptr #0 >
          s charptr #1 substring$ is.digit
          and
        }
        { charptr #1 - 'charptr := }
      while$
      charptr not
    }
  if$
}

FUNCTION {format.bvolume}
{ volume empty$
    { "" }
    { volume is.number
        { is.in.chinese
            { "第" volume * "卷" * }
            { "volume" volume tie.or.space.connect }
          if$
        }
        { volume }
      if$
    }
  if$
}

FUNCTION {format.number}
{ number empty$
    { "" }
    { number is.number
        { is.in.chinese
            { "第" volume * "册" * }
            { "number" number tie.or.space.connect }
          if$
        }
        { number }
      if$
    }
  if$
}

FUNCTION {format.number.series}
{ volume empty$
    { number empty$
        { series field.or.null }
        { output.state mid.sentence =
            { "number" }
            { "Number" }
          if$
          number tie.or.space.connect
          series empty$
            { "there's a number but no series in " cite$ * warning$ }
            { " in " * series * }
          if$
        }
      if$
    }
    { "" }
  if$
}

FUNCTION {format.series.volume.title}
{ series empty$
    { title
      volume empty$
        'skip$
        { ": " * format.bvolume * }
      if$
    }
    { series
      volume empty$
        { number empty$
          'skip$
          { ": " * format.number * }
        if$ }
        { volume empty$
          'skip$
          { ": " * format.bvolume * }
        if$
        }
      if$
      "\hspace{1em}" * title *
    }
  if$
}

FUNCTION {num.to.ordinal}
{ duplicate$ text.length$ 'charptr :=
  duplicate$ charptr #1 substring$ 's :=
  s "1" =
    { "st" * }
    { s "2" =
        { "nd" * }
        { s "3" =
            { "rd" * }
            { "th" * }
          if$
        }
      if$
    }
  if$
}

FUNCTION {format.edition}
{ edition empty$
    { "" }
    { edition is.number
        { is.in.chinese
            { edition "版" * }
            { edition num.to.ordinal " ed." * }
          if$
        }
        { edition "t" change.case$
          edition "Revised" =
            { "Rev. ed." }
            { edition "Revised edition" =
                { "Rev. ed." }
                'skip$
              if$
            }
          if$
         }
      if$
    }
  if$
}

FUNCTION {format.address}
{ address empty$
    { url empty$
        { is.in.chinese
            { "[出版地不详]" }
            { "[S.l.]" }
          if$
        }
        { "" }
      if$
    }
    { address }
  if$
}

FUNCTION {format.publisher}
{ publisher empty$
    { url empty$
        { is.in.chinese
            { "[出版者不详]" }
            { "[s.n.]" }
          if$
        }
        { "" }
      if$
    }
    { publisher }
  if$
}

INTEGERS { multiresult }

FUNCTION {multi.page.check}
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and
    }
    { t #1 #1 substring$
      duplicate$ "-" =
      swap$ duplicate$ "," =
      swap$ "+" =
      or or
        { #1 'multiresult := }
        { t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  multiresult
}

FUNCTION {format.pages}
{ pages empty$
    { "" }
    { pages }
  if$
}

FUNCTION {format.eid}
{ eid empty$
    { "" }
    { "art." eid tie.or.space.connect }
  if$
}

FUNCTION {format.vol.num.pages}
{ volume field.or.null
  number empty$
    'skip$
    { "\penalty0 (" number * ")" * *
      volume empty$
        { "there's a number but no volume in " cite$ * warning$ }
        'skip$
      if$
    }
  if$
  pages empty$
    'skip$
    { duplicate$ empty$
        { pop$ format.pages }
        { ":\penalty0 " * pages n.dashify * }
      if$
    }
  if$
}

FUNCTION {format.vol.num.eid}
{ volume field.or.null
  number empty$
    'skip$
    { "\penalty0 (" number * ")" * *
      volume empty$
        { "there's a number but no volume in " cite$ * warning$ }
        'skip$
      if$
    }
  if$
  eid empty$
    'skip$
    { duplicate$ empty$
        { pop$ format.eid }
        { ":\penalty0 " * eid * }
      if$
    }
  if$
}

FUNCTION {format.chapter.pages}
{ chapter empty$
    'format.pages
    { type empty$
        { "chapter" }
        { type "l" change.case$ }
      if$
      chapter tie.or.space.connect
      pages empty$
        'skip$
        { ", " * format.pages * }
      if$
    }
  if$
}

FUNCTION {format.in.ed.booktitle}
{ booktitle empty$
    { "" }
    { editor empty$
        { "In " booktitle emphasize * }
        { "In " format.editors * ", " * booktitle emphasize * }
      if$
    }
  if$
}

FUNCTION {empty.misc.check}
{ author empty$ title empty$ howpublished empty$
  month empty$ year empty$ note empty$
  and and and and and
  key empty$ not and
    { "all relevant fields are empty in " cite$ * warning$ }
    'skip$
  if$
}

FUNCTION {format.thesis.type}
{ type empty$
    'skip$
    { pop$
      type "t" change.case$
    }
  if$
}

FUNCTION {format.tr.number}
{ type empty$
    { "Technical Report" }
    'type
  if$
  number empty$
    { "t" change.case$ }
    { number tie.or.space.connect }
  if$
}

FUNCTION {format.article.crossref}
{ key empty$
    { journal empty$
        { "need key or journal for " cite$ * " to crossref " * crossref *
          warning$
          ""
        }
        { "In \emph{" journal * "}" * }
      if$
    }
    { "In " }
  if$
  " \citet{" * crossref * "}" *
}

FUNCTION {format.book.crossref}
{ volume empty$
    { "empty volume in " cite$ * "'s crossref of " * crossref * warning$
      "In "
    }
    { "Volume" volume tie.or.space.connect
      " of " *
    }
  if$
  editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
        { series empty$
            { "need editor, key, or series for " cite$ * " to crossref " *
              crossref * warning$
              "" *
            }
            { "\emph{" * series * "}" * }
          if$
        }
        'skip$
      if$
    }
    'skip$
  if$
  " \citet{" * crossref * "}" *
}

FUNCTION {format.incoll.inproc.crossref}
{ editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
        { booktitle empty$
            { "need editor, key, or booktitle for " cite$ * " to crossref " *
              crossref * warning$
              ""
            }
            { "In \emph{" booktitle * "}" * }
          if$
        }
        { "In " }
      if$
    }
    { "In " }
  if$
  " \citet{" * crossref * "}" *
}

FUNCTION {archive}
{ output.bibitem
  format.authors output
  author format.key output
  new.block
  format.series.volume.title "title" output.check
  "A" format.mark "" output.after
  new.block
  format.translators output
  new.block
  format.edition output
  new.sentence
  format.address output
  format.publisher punct.colon output.after
  format.date "year" output.check
  format.pages punct.colon output.after
  format.citedate "" output.after
  format.url output
  format.doi output
  fin.entry
}

FUNCTION {article}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  new.block
  format.title "title" output.check
  journal empty$
    { "M" format.mark "" output.after
      new.block
      format.translators output
      new.block
      format.editors punct.slash output.after
      new.block
      booktitle "booktitle" output.check
      new.block
      format.bvolume punct.colon output.after
      new.block
      format.edition output
      new.block
      format.address output
      format.publisher punct.colon output.after
      format.date "year" output.check
      format.pages punct.colon output.after
    }
    { "J" format.mark "" output.after
      new.block
      journal "journal" output.check
      new.block
      format.date "year" output.check
      format.vol.num.pages output
    }
  if$
  format.citedate "" output.after
  format.url output
  format.doi output
  fin.entry
}

FUNCTION {book}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check
      editor format.key output
    }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  new.block
  format.series.volume.title "title" output.check
  "M" format.mark "" output.after
  new.block
  format.translators output
  new.block
  format.edition output
  new.sentence
  format.address output
  format.publisher punct.colon output.after
  format.date "year" output.check
  format.pages punct.colon output.after
  format.citedate "" output.after
  format.url output
  format.doi output
  fin.entry
}

FUNCTION {collection}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check
      editor format.key output
    }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  new.block
  format.series.volume.title "title" output.check
  "G" format.mark "" output.after
  new.block
  format.translators output
  new.block
  format.edition output
  new.sentence
  format.address output
  format.publisher punct.colon output.after
  format.date "year" output.check
  format.pages punct.colon output.after
  format.citedate "" output.after
  format.url output
  format.doi output
  fin.entry
}

FUNCTION {database}
{ output.bibitem
  format.authors output
  author format.key output
  new.block
  format.series.volume.title "title" output.check
  "DB" format.mark "" output.after
  new.block
  format.date "year" output.check
  format.editdate "" output.after
  format.citedate "" output.after
  format.url output
  format.doi output
  fin.entry
}

FUNCTION {dataset}
{ output.bibitem
  format.authors output
  author format.key output
  new.block
  format.series.volume.title "title" output.check
  "DS" format.mark "" output.after
  new.block
  format.translators output
  new.block
  format.edition output
  new.sentence
  format.address output
  format.publisher punct.colon output.after
  format.date "year" output.check
  format.pages punct.colon output.after
  format.editdate "" output.after
  format.citedate "" output.after
  format.url output
  format.doi output
  fin.entry
}

FUNCTION {inbook} { book }

FUNCTION {incollection} { book }

FUNCTION {inproceedings}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  new.block
  format.title "title" output.check
  "C" format.mark "" output.after
  new.block
  format.translators output
  new.block
  editor empty$
    { organization }
    { format.editors }
  if$ punct.slash output.after
  new.block
  booktitle "booktitle" output.check
  new.block
  format.bvolume punct.colon output.after
  new.block
  format.edition output
  new.sentence
  format.address output
  publisher empty$
    { organization }
    { format.publisher }
  if$ punct.colon output.after
  format.date "year" output.check
  format.pages punct.colon output.after
  format.citedate "" output.after
  format.url output
  format.doi output
  fin.entry
}

FUNCTION {conference} { inproceedings }

FUNCTION {manual}
{ output.bibitem
  format.authors output
  author format.key output
  new.block
  format.series.volume.title "title" output.check
  organization address new.block.checkb
  organization output
  format.address output
  format.edition output
  format.date output
  format.url output
  new.block
  note output
  fin.entry
}

FUNCTION {map}
{ output.bibitem
  format.authors output
  author format.key output
  new.block
  format.series.volume.title "title" output.check
  "CM" format.mark "" output.after
  new.block
  format.translators output
  new.block
  format.edition output
  new.sentence
  format.address output
  format.publisher punct.colon output.after
  format.date "year" output.check
  format.pages punct.colon output.after
  format.citedate "" output.after
  format.url output
  format.doi output
  fin.entry
}

FUNCTION {mastersthesis}
{ output.bibitem
  format.authors output
  author format.key output
  new.block
  format.series.volume.title "title" output.check
  "D" format.mark "" output.after
  new.block
  format.translators output
  new.block
  format.edition output
  new.sentence
  format.address output
  school empty$
    { format.publisher }
    { school }
  if$ punct.colon output.after
  format.date "year" output.check
  format.pages punct.colon output.after
  format.citedate "" output.after
  format.url output
  format.doi output
  fin.entry
}

FUNCTION {misc}
{ output.bibitem
  format.authors output
  author format.key output
  new.block
  format.series.volume.title "title" output.check
  "M" format.mark "" output.after
  new.block
  format.translators output
  new.block
  format.edition output
  new.sentence
  format.address output
  format.publisher punct.colon output.after
  format.date "year" output.check
  format.pages punct.colon output.after
  format.citedate "" output.after
  format.url output
  format.doi output
  fin.entry
}

FUNCTION {newspaper}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  new.block
  format.title "title" output.check
  "N" format.mark "" output.after
  new.block
  journal "journal" output.check
  new.block
  format.date "year" output.check
  format.vol.num.pages output
  format.citedate "" output.after
  format.url output
  format.doi output
  fin.entry
}

FUNCTION {patent}
{ output.bibitem
  format.authors output
  author format.key output
  new.block
  format.title "title" output.check
  "P" format.mark "" output.after
  new.block
  format.date "year" output.check
  format.citedate "" output.after
  format.url output
  format.doi output
  fin.entry
}

FUNCTION {phdthesis} { mastersthesis }

FUNCTION {proceedings}
{ output.bibitem
  format.editors output
  editor format.key output
  new.block
  format.series.volume.title "title" output.check
  "C" format.mark "" output.after
  new.block
  format.translators output
  new.block
  format.edition output
  new.sentence
  format.address output
  publisher empty$
    { organization }
    { format.publisher }
  if$ punct.colon output.after
  format.date "year" output.check
  format.pages punct.colon output.after
  format.citedate "" output.after
  format.url output
  format.doi output
  fin.entry
}

FUNCTION {program}
{ output.bibitem
  format.authors output
  author format.key output
  new.block
  format.series.volume.title "title" output.check
  "CP" format.mark "" output.after
  new.block
  format.date "year" output.check
  format.editdate "" output.after
  format.citedate "" output.after
  format.url output
  format.doi output
  fin.entry
}

FUNCTION {standard}
{ output.bibitem
  format.authors output
  author format.key output
  new.block
  format.series.volume.title "title" output.check
  "S" format.mark "" output.after
  new.block
  format.translators output
  new.block
  format.edition output
  new.sentence
  format.address output
  format.publisher punct.colon output.after
  format.date "year" output.check
  format.pages punct.colon output.after
  format.citedate "" output.after
  format.url output
  format.doi output
  fin.entry
}

FUNCTION {techreport}
{ output.bibitem
  author empty$
    { institution output
      institution format.key output
    }
    { format.authors output
      author format.key output
    }
  if$
  new.block
  format.series.volume.title "title" output.check
  "R" format.mark "" output.after
  new.block
  format.translators output
  new.block
  format.edition output
  new.sentence
  format.address output
  format.publisher punct.colon output.after
  format.date "year" output.check
  format.pages punct.colon output.after
  format.editdate "" output.after
  format.citedate "" output.after
  format.url output
  format.doi output
  fin.entry
}

FUNCTION {unpublished}
{ output.bibitem
  format.authors "author" output.check
  author format.key output
  new.block
  format.title "title" output.check
  new.block
  note "note" output.check
  format.date output
  format.url output
  fin.entry
}

FUNCTION {default.type} { misc }

MACRO {jan} {"January"}

MACRO {feb} {"February"}

MACRO {mar} {"March"}

MACRO {apr} {"April"}

MACRO {may} {"May"}

MACRO {jun} {"June"}

MACRO {jul} {"July"}

MACRO {aug} {"August"}

MACRO {sep} {"September"}

MACRO {oct} {"October"}

MACRO {nov} {"November"}

MACRO {dec} {"December"}

MACRO {acmcs} {"ACM Computing Surveys"}

MACRO {acta} {"Acta Informatica"}

MACRO {cacm} {"Communications of the ACM"}

MACRO {ibmjrd} {"IBM Journal of Research and Development"}

MACRO {ibmsj} {"IBM Systems Journal"}

MACRO {ieeese} {"IEEE Transactions on Software Engineering"}

MACRO {ieeetc} {"IEEE Transactions on Computers"}

MACRO {ieeetcad}
 {"IEEE Transactions on Computer-Aided Design of Integrated Circuits"}

MACRO {ipl} {"Information Processing Letters"}

MACRO {jacm} {"Journal of the ACM"}

MACRO {jcss} {"Journal of Computer and System Sciences"}

MACRO {scp} {"Science of Computer Programming"}

MACRO {sicomp} {"SIAM Journal on Computing"}

MACRO {tocs} {"ACM Transactions on Computer Systems"}

MACRO {tods} {"ACM Transactions on Database Systems"}

MACRO {tog} {"ACM Transactions on Graphics"}

MACRO {toms} {"ACM Transactions on Mathematical Software"}

MACRO {toois} {"ACM Transactions on Office Information Systems"}

MACRO {toplas} {"ACM Transactions on Programming Languages and Systems"}

MACRO {tcs} {"Theoretical Computer Science"}

READ

EXECUTE {init.state.consts}

INTEGERS { ascii }

FUNCTION {char.lang}
{ chr.to.int$ 'ascii :=
  ascii #31 > ascii #128 < and
    { lang.en }
    { ascii #227 > ascii #234 < and
        { lang.zh }
        { ascii #227 =
            { lang.ja }
            { lang.default }
          if$
        }
      if$
    }
  if$
}

FUNCTION {set.language}
{ language empty$
    { lang.default 'lang :=
      author field.or.null title field.or.null * 's :=
      s empty$
        'skip$
        { #1 'charptr :=
          s text.length$ #1 + 'stringlength :=
            { charptr stringlength < }
            { s charptr #1 substring$ char.lang
              duplicate$ #3 >
                { charptr #2 + 'charptr := }
                'skip$
              if$
              duplicate$ lang >
                { 'lang := }
                'pop$
              if$
              charptr #1 + 'charptr :=
            }
          while$
        }
      if$
    }
    { language "en" =
        { lang.en }
        { language "zh" =
            { lang.zh }
            { language "ja" =
                { lang.ja }
                { lang.default }
              if$
            }
          if$
        }
      if$
      'lang :=
    }
  if$
}

FUNCTION {sortify}
{ purify$
  "l" change.case$
}

INTEGERS { len }

FUNCTION {chop.word}
{ 's :=
  'len :=
  s #1 len substring$ =
    { s len #1 + global.max$ substring$ }
    's
  if$
}

FUNCTION {format.lab.names}
{ 's :=
  s #1 "{vv~}{ll}" format.name$
  s num.names$ #1 >
    { ", " * format.et.al * }
    'skip$
  if$
}

FUNCTION {author.key.label}
{ author empty$
    { key empty$
        { cite$ #1 #3 substring$ }
        'key
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {author.editor.key.label}
{ author empty$
    { editor empty$
        { key empty$
            { cite$ #1 #3 substring$ }
            'key
          if$
        }
        { editor format.lab.names }
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {author.key.organization.label}
{ author empty$
    { key empty$
        { organization empty$
            { cite$ #1 #3 substring$ }
            { "The " #4 organization chop.word #3 text.prefix$ }
          if$
        }
        'key
      if$
    }
    { author format.lab.names }
  if$
}

FUNCTION {editor.key.organization.label}
{ editor empty$
    { key empty$
        { organization empty$
            { cite$ #1 #3 substring$ }
            { "The " #4 organization chop.word #3 text.prefix$ }
          if$
        }
        'key
      if$
    }
    { editor format.lab.names }
  if$
}

FUNCTION {calc.short.authors}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.key.label
    { type$ "proceedings" =
        'editor.key.organization.label
        { type$ "manual" =
            'author.key.organization.label
            'author.key.label
          if$
        }
      if$
    }
  if$
  'short.list :=
}

FUNCTION {calc.label}
{ calc.short.authors
  short.list
  "("
  *
  year duplicate$ empty$
  short.list key field.or.null = or
     { pop$ "" }
     'skip$
  if$
  *
  'label :=
}

INTEGERS { seq.num }

FUNCTION {init.seq}
{ #0 'seq.num :=}

EXECUTE {init.seq}

FUNCTION {int.to.fix}
{ "000000000" swap$ int.to.str$ *
  #-1 #10 substring$
}

FUNCTION {presort}
{ set.language
  calc.label
  label sortify
  "    "
  *
  seq.num #1 + 'seq.num :=
  seq.num  int.to.fix
  'sort.label :=
  sort.label *
  #1 entry.max$ substring$
  'sort.key$ :=
}

ITERATE {presort}

SORT

STRINGS { longest.label last.label next.extra }

INTEGERS { longest.label.width last.extra.num number.label }

FUNCTION {initialize.longest.label}
{ "" 'longest.label :=
  #0 int.to.chr$ 'last.label :=
  "" 'next.extra :=
  #0 'longest.label.width :=
  #0 'last.extra.num :=
  #0 'number.label :=
}

FUNCTION {forward.pass}
{ last.label label =
    { last.extra.num #1 + 'last.extra.num :=
      last.extra.num int.to.chr$ 'extra.label :=
    }
    { "a" chr.to.int$ 'last.extra.num :=
      "" 'extra.label :=
      label 'last.label :=
    }
  if$
  number.label #1 + 'number.label :=
}

FUNCTION {reverse.pass}
{ next.extra "b" =
    { "a" 'extra.label := }
    'skip$
  if$
  extra.label 'next.extra :=
  extra.label
  duplicate$ empty$
    'skip$
    { "{\natexlab{" swap$ * "}}" * }
  if$
  'extra.label :=
  label extra.label * 'label :=
}

EXECUTE {initialize.longest.label}

ITERATE {forward.pass}

REVERSE {reverse.pass}

FUNCTION {bib.sort.order}
{ sort.label  'sort.key$ :=
}

ITERATE {bib.sort.order}

SORT

FUNCTION {begin.bib}
{   preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
  "\begin{thebibliography}{" number.label int.to.str$ * "}" *
  write$ newline$
  "\providecommand{\natexlab}[1]{#1}"
  write$ newline$
  "\providecommand{\url}[1]{\texttt{#1}}"
  write$ newline$
  "\expandafter\ifx\csname urlstyle\endcsname\relax"
  write$ newline$
  "  \providecommand{\doi}[1]{DOI: #1}\else"
  write$ newline$
  "  \providecommand{\doi}{DOI: \begingroup \urlstyle{rm}\Url}\fi"
  write$ newline$
}

EXECUTE {begin.bib}

ITERATE {call.type$}

FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}

EXECUTE {end.bib}
