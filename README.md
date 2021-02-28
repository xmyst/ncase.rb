# [ɪn'keɪs] — enforce a case style

## Contents

*   [Usage](#usage)
    -   [Synopsis](#synopsis)
    -   [Description](#description)
    -   [Options](#options)

## Usage

### Synopsis

    ncase [OPTIONS] [TEXT]

### Description

Enforces a chosen (random) case on string(s)
and writes them to the standard output.

### Options

`-c`, `--camel-case`
:   Enforce `camelCase`.

`-P`, `--pascal-case`
:   Enforce `PascalCase`.

`-k`, `--kebab-case`
 :   Enforce `kebab-case`.

`-K`, `--upper-kebab-case`
 :   Enforce `KEBAB-CASE`.

`-l`, `--lower-case`
 :   Enforce `lower case`.

`-U`, `--upper-case`
 :   Enforce `UPPER CASE`.

`-s`, `--snake-case`
 :   Enforce `snake_case`.

`-S`, `--upper-snake-case`
 :   Enforce `SNAKE_CASE`.

`-t`, `--title-case`
 :   Enforce `Title Case`.

`-T`, `--inver-title-case`
 :   Enforce `tITLE cASE`.

`-r`, `--random-case`
 :   Enforce `rAnDOm CaSe`[^1].

`TEXT`
 :   Text to process. If omitted, line by line process the standard input.

[^1]: Default.
