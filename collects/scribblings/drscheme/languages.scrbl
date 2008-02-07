#lang scribble/doc
@(require "common.ss")

@title[#:tag "languages" #:style 'toc]{Languages}

This chapter describes some of the languages that are available for
use within DrScheme. The list here is potentially incomplete, because
new languages can be added through DrScheme plug-ins.

@local-table-of-contents[]

@; ----------------------------------------

@section[#:tag "module"]{Modules}

The @as-index{@drlang{Module} language} is really a kind of
meta-language, where the program itself specifies its language,
usually through a @hash-lang[] line.

More generally, when using @drlang{Module}, the @tech{definitions
window} must contain a module in some form. Besides @hash-lang[], a
Scheme module can be written as @scheme[(module ...)]. In any case,
aside from comments, the @tech{definitions window} must contain
exactly one module.

@; ----------------------------------------

@section[#:tag "legacy"]{Legacy Languages}

DrScheme supports several historically useful variants of Scheme
without a @hash-lang[] prefix:

@itemize{

 @item{The @as-index{@drlang{Standard (R5RS)} language} contains those
  primitives and syntax defined in the R@superscript{5}RS Scheme
  standard. See the @schememodname[r5rs] library for details.}

 @item{The @as-index{@drlang{PLT Textual (MzScheme)} language} starts
  with the same bindings as the @exec{mzscheme} executable in
  interactive mode, which means the exports of the
  @schememodname[scheme/init] library. It also evaluates a program in
  the same way as @scheme[load], instead of as a module.}

 @item{The @as-index{@drlang{PLT Graphical (MrEd)} language} starts
  with the same bindings as the @exec{mred} executable in interactive
  mode, which means the exports of the @schememodname[scheme/gui/init]
  library. Like @drlang{PLT Textual (MzScheme)}, it evaluates a
  program in the same way as @scheme[load], instead of as a module.}

 @item{The @as-index{@defterm{PLT Pretty Big} language} provides a
  language roughly compatible with a language in earlier versions of
  DrScheme. It evaluates a program in the same way as @scheme[load],
  and it starts by importing the following modules:
  @schememodname[mzscheme], @schememodname[scheme/gui/base],
  @schememodname[mzlib/class], @schememodname[mzlib/etc],
  @schememodname[mzlib/file], @schememodname[mzlib/list],
  @schememodname[mzlib/unit], @schememodname[mzlib/include],
  @schememodname[mzlib/defmacro], @schememodname[mzlib/pretty],
  @schememodname[mzlib/string], @schememodname[mzlib/thread],
  @schememodname[mzlib/math], @schememodname[mzlib/match], and
  @schememodname[mzlib/shared].}

 @item{The @as-index{@drlang{Swindle} language} starts with the same
  bindings as @schememodname[swindle], and evaluates the program like
  @scheme[load].}

}

@; ----------------------------------------

@section[#:tag "htdp-langs"]{@|HtDP| Teaching Languages}

Five of DrScheme's languages are specifically designed for teaching:

@itemize{

 @item{The @as-index{@drlang{Beginning Student} language} is a small
       version of Scheme that is tailored for beginning computer
       science students.}
       
 @item{The @as-index{@drlang{Beginning Student with List
       Abbreviations} languages} is an extension to Beginning Student
       that prints lists with @scheme[list] instead of @scheme[cons],
       and accepts @scheme[quasiquote]d input.}

 @item{The @as-index{@drlang{Intermediate Student} language} adds
       local bindings and higher-order functions.}

 @item{The @as-index{@drlang{Intermediate Student with Lambda}
       language} adds anonymous functions.}

 @item{The @as-index{@drlang{Advanced Student} language} adds mutable
       state.}

}

The teaching languages different from conventional Scheme in a number
of ways:

@itemize{

 @item{@defterm{Case-sensitive identifiers and symbols} --- In a
       case-sensitive language, the variable names @scheme[x] and
       @scheme[X] are distinct, and the symbols @scheme['x] and
       @scheme['X] are also distinct. In a case-insensitive language,
       @scheme[x] and @scheme[X] are equivalent and @scheme['x] and
       @scheme['X] represent the same value. The teaching languages
       are case-sensitive by default, and other languages are usually
       case-insensitive. Case-sensitivity can be adjusted through the
       detail section of the language-selection dialog.}
        
 @item{@defterm{All numbers are exact unless @schememetafont{#i} is
       specified} --- In the @drlang{Beginning Student} through
       @drlang{Intermediate Student with Lambda languages}, numbers
       containing a decimal point are interpreted as exact
       numbers. This interpretation allows students to use familiar
       decimal notation without inadvertently triggering inexact
       arithmetic. Exact numbers with decimal representations are also
       printed in decimal. Inexact inputs and results are explicitly
       marked with @schememetafont{#i}.}

 @item{@defterm{Procedures must take at least one argument} --- In the
       @drlang{Beginning Student} through @drlang{Intermediate
       Student} languages, defined procedures must consume at least
       one argument. Since the languages have no side-effects,
       zero-argument functions are not useful, and rejecting such
       function definitions helps detect confusing syntactic
       mistakes.}

 @item{@defterm{Identifier required at function call position} --- In
       the @drlang{Beginning Student} through @drlang{Intermediate
       Student} languages, procedure calls must be of the form
       @scheme[(_identifier ...)]. This restriction helps detect
       confusing misuses of parentheses, such as @scheme[(1)] or
       @scheme[((+ 3 4))], which is a common mistake among beginners
       who are used to the optional parentheses of algebra.}

 @item{@defterm{Top-level required at function call position} --- In
       the @drlang{Beginning Student} languages, procedure calls must
       be of the form @scheme[(_top-level-identifier ...)], and the
       number of actual arguments must match the number of formal
       arguments if @scheme[_top-level-identifier] is
       @scheme[define]d. This restriction helps detect confusing
       misuses of parentheses, such as @scheme[(x)] where @scheme[x]
       is a function argument. DrScheme can detect such mistakes
       syntactically because Beginning Student does not support
       higher-order procedures.}

 @item{@defterm{Primitive and defined functions allowed only in
       function call position} --- In @drlang{Beginning Student}
       languages, the name of a primitive operator or of a defined
       function can be used only after the open-parenthesis of a
       function call (except where teachpack extensions allow
       otherwise, as in the @scheme[convert-gui] teachpack). Incorrect
       uses of primitives trigger a syntax error. Incorrect uses of
       defined names trigger a run-time error.  DrScheme can detect
       such mistakes because Beginning Student does not support
       higher-order procedures.}

 @item{@defterm{@scheme[lambda] allowed only in definitions} --- In
       the Beginning Student through Intermediate Student languages,
       @scheme[lambda] (or @scheme[case-lambda]) may appear only in a
       definition, and only as the value of the defined variable.}

 @item{@defterm{Free variables are not allowed} --- In the
       @drlang{Beginning Student} through @drlang{Advanced Student}
       languages, every variable referenced in the definitions window
       must be defined, pre-defined, or the name of a local function
       argument.}

 @item{@defterm{@scheme[quote] works only on symbols,
       @scheme[quasiquote] disallowed} --- In the @drlang{Beginning
       Student} language, @scheme[quote] and @schemevalfont{'} can
       specify only symbols. This restriction avoids the need to
       explain to beginners why @scheme[1] and @scheme['1] are
       equivalent in standard Scheme. In addition,
       @scheme[quasiquote], @litchar{`}, @scheme[unquote],
       @litchar{,}, @scheme[unquote-splicing], and @litchar[",@"] are
       disallowed.}

 @item{@defterm{Unmatched @scheme[cond]/@scheme[case] is an error} ---
       In the @drlang{Beginning Student} through @drlang{Advanced
       Student} languages, falling through a @scheme[cond] or
       @scheme[case] expression without matching a clause signals a
       run-time error. This convention helps detect syntactic and
       logical errors in programs.}

 @item{@defterm{Conditional values must be @scheme[true] or
       @scheme[false]} --- In the @drlang{Beginning Student} through
       @drlang{Advanced Student} languages, an expression whose value
       is treated as a boolean must return an actual boolean,
       @scheme[true] or @scheme[false]. This restriction, which
       applies to @scheme[if], @scheme[cond], @scheme[and],
       @scheme[or], @scheme[nand], and @scheme[nor] expressions, helps
       detect errors where a boolean function application is omitted.}

 @item{@defterm{@scheme[+], @scheme[*], and @scheme[/] take at least
       two arguments} --- In the @drlang{Beginning Student} through
       @drlang{Advanced Student} languages, mathematical operators
       that are infix in algebra notation require at least two
       arguments in DrScheme. This restriction helps detect missing
       arguments to an operator.}

 @item{@defterm{@scheme[and], @scheme[or], @scheme[nand], and
       @scheme[nor] require at least 2 expressions} --- In the
       @drlang{Beginning Student} through @drlang{Advanced Student}
       languages, the boolean combination forms require at least two
       sub-expressions.  This restriction helps detect missing or
       ill-formed sub-expressions in a boolean expression.}

 @item{@defterm{@scheme[set!] disallowed on arguments} --- In the
       @drlang{Advanced Student} language, @scheme[set!] cannot be
       used to mutate variables bound by @scheme[lambda]. This
       restriction ensures that the substitution model of function
       application is consistent with DrScheme's evaluation.}

 @item{@defterm{Improper lists disallowed} --- A @defterm{proper list}
       is either an empty list or a list created by @scheme[cons]ing
       onto a proper list. In the @drlang{Beginning Student} through
       @drlang{Advanced Student} languages, @scheme[cons] constructs
       only @defterm{proper lists}, signaling an error if the second
       argument is not a proper list. Since beginning students do not
       need improper lists, this restriction help detect logical
       errors in recursive functions.}

 @item{@defterm{Dot is disallowed} --- In the @drlang{Beginning
       Student} through @drlang{Advanced Student} languages, a
       delimited period @litchar{.} is disallowed, (e.g., as an
       improper-list constructor in a quoted form, or for defining
       multi-arity procedures).}

 @item{@defterm{Syntactic form names disallowed as variable names} ---
       In the @drlang{Beginning Student} through @drlang{Advanced
       Student} languages, all syntactic form names are keywords that
       cannot be used as variable names.}

 @item{@defterm{Re-definitions are disallowed} --- In the
       @drlang{Beginning Student} through @drlang{Advanced Student}
       languages, top-level names can never be re-defined.}

 @item{@defterm{Function definitions are allowed only in the
       definitions window} --- In the @drlang{Beginning Student}
       languages, function definitions are not allowed in the
       interactions window.}

}

The teaching languages also deviate from traditional Scheme in
printing values. Different printing formats can be selected for any
language through the detail section of language-selection dialog.

@itemize{

 @item{@defterm{Constructor-style output} --- See
       @secref["printing:cons"].}

 @item{@defterm{Quasiquote-style output} --- See
       @secref["printing:quasi"].}
     
   @item{@defterm{Rational number printing} -- In the teaching
     languages, all numbers that have a finite decimal expansion are
     printed in decimal form. For those numbers that do not have a
     finite decimal expansion (such as @scheme[4/3]) DrScheme offers a
     choice. It either prints them as mixed fractions or as repeating
     decimals, where the repeating portion of the decimal expansion is
     shown with an overbar. In addition, DrScheme only shows the first
     25 digits of the number's decimal expansion. If there are more
     digits, the number appears with an ellipses at the end. Click the
     ellipses to see the next 25 digits of the expansion.

     This setting controls only the initial display of a number.
     Right-clicking or Control-clicking (Mac OS X) on the number lets
     you change from the fraction representation to the decimal
     representation.}

 @item{@defterm{@scheme[write] output} --- Prints values with
        @scheme[write].}

 @item{@defterm{Show sharing in values} --- Prints interaction results
       using the @scheme[shared] syntax, which exposes shared
       structure within a value. For example, the list created by
       @scheme[(let ([lt (list 0)]) (list lt lt))] prints as

@schemeblock[
(shared ((-1- (list 0))) (list -1- -1-))
]

       instead of

@schemeblock[
(list (list 0) (list 0))
]
}

}

@; ----------------------------------------

@section[#:tag "profj"]{ProfessorJ}

...

@; ----------------------------------------

@section[#:tag "experimental-langs"]{Other Experimental Languages}

...