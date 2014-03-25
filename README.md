Instructions

Translations:
  YAML is a way of representing ruby objects like hashes and arrays in files.
  The following project uses the translations_*.yml files.

  The translations_en.yml file contains a list of all the translations needed for a site.
  Read this yaml in using ruby's inbuilt YAML parser, eg:
    YAML.load(File.read("my/file/path"))

  There are other translations files for other languages, but they are missing translations.
  Read in the other language files (it is Italian, de is German, fr is French and cy is Welsh) and output to the terminal all the translations that are needed for each language. (Don't try and translate anything! Just work out what's missing.)