#!/usr/bin/env ruby

input_text = STDIN.read

# Ultra hack because I dislike #match returns nil
# also not horrible, nil's size is 0
class NilClass;def size;0;end;end

nice_string_count = input_text.split("\n").reduce(0) do |nc,sentence|

  # It contains a pair of any two letters that appears
  # at least twice in the string without overlapping
  is_nice = /((\w){2}).*(\1)/.match(sentence).size == 4

  # contains at least one letter which repeats with
  # exactly one letter between them
  is_nice &= sentence =~ /(\w).(\1)/

  # exit if is_nice
  is_nice ? nc+1 : nc
end

puts "#{nice_string_count} nice strings"
