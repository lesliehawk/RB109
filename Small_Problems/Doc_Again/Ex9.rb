# Down the Rabbit Hole

# Sometimes, the documentation is going to leave you
# scratching your head.

# In a very early assignment at Launch School, you are
# tasked with writing a program that loads some text
# messages from a YAML file.

# We do this with YAML::load_file:

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

# Find the documentation for YAML::load_file.

# ruby-docs Core >> Search: yaml >> nothing

# ruby-docs Std-lib >> yaml >> YAML

# "Yaml Ain't Markup Language" ;)

# This module provides a Ruby interface for data
# serialization in YAML format.

# The YAML module is an alias of Psych,
# the YAML engine for Ruby.

# Nothing on ::load_file

# Std-lib >> psych >> :: load_file

# load_file(filename, fallback: false)
# Load the document contained in filename.
# Returns the yaml contained in filename as a Ruby object,
# or if the file is empty,
# it returns the specified fallback return value,
# which defaults to false.

# Useful info about YAML all found in Psych class.
