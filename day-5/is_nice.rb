#!/usr/bin/env ruby

input_text = STDIN.read

nice_string_count = input_text.split("\n").reduce(0) do |nc,sentence|

  # It does not contain the strings ab, cd, pq, or xy
  is_nice = sentence !~ /ab|cd|pq|xy/

  # It contains at least three vowels
  is_nice &= sentence.split(//).count{|i| i =~ /[aeiou]/} > 2

  # It contains at least one letter that appears twice
  # woot, TIL: back references
  is_nice &= sentence =~ /(\w)\1/

  is_nice ? nc+1 : nc
end

puts "#{nice_string_count} nice strings"
