#!/usr/bin/env ruby

require 'digest/md5'

MY_SECRET = 'ckczppom'
i_want = (ARGV[0] || '00000') #change to 6 for the second part of the question

number = 0;
begin
  number += 1
  # printing slows it down a lot
  # print '.' if number % 1000 == 0
end while Digest::MD5.hexdigest(MY_SECRET + number.to_s)[0,i_want.size] != i_want

puts "\nnumber: #{number} from my code #{MY_SECRET}"
puts "md5: #{Digest::MD5.hexdigest(MY_SECRET + number.to_s)}"
