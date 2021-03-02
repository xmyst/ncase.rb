[![Gem Version](https://badge.fury.io/rb/ncase.svg)](https://badge.fury.io/rb/ncase)

# Installation

The usual

    gem install ncase

# bin/ncase

Enforces a chosen (or random) case on string(s) and writes them to the standard
output.

    % ncase --pascal-case this is a test string
    ThisIsATestString

    % ncase --lower-case ThisIsATestString
    this is a test string

    % ncase this is a test string
    ThiS IS A tesT stRINg

    % ncase --help
    Usage: ncase [OPTIONS] [TEXT]
    ...

# lib/ncase

Provides class {Ncase::Words} which implements efficient conversion of a string
into a multitude of case styles.

    require "ncase"

    w = Ncase::Words.new("this is a test string")
    p w.pascal_case       # => "ThisIsATestString"
    p w.inver_title_case  # => "tTHIS iS a tEST sTRING"
