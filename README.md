[![Gem Version](https://badge.fury.io/rb/ncase.svg)](https://badge.fury.io/rb/ncase)

# Installation

The usual.

    gem install ncase

# "Binary"

Enforces the chosen case style on string(s) and writes them to the standard
output.

    % ncase --pascal-case this is a test string
    ThisIsATestString

    % ncase --lower-case ThisIsATestString
    this is a test string

By default, enforces the random case.

    % ncase this is a test string
    ThiS IS A tesT stRINg

# Library

## Ncase

Module {Ncase} contains convenience methods for all supported case styles.

    require "ncase"

    p Ncase.pascal("this is a test string")  # => "ThisIsATestString"

## Ncase::Words

Class {Ncase::Words} implements efficient conversion of a string into different
case styles.

    require "ncase"

    w = Ncase::Words.new("this is a test string")
    p w.pascal_case       # => "ThisIsATestString"
    p w.inver_title_case  # => "tTHIS iS a tEST sTRING"
