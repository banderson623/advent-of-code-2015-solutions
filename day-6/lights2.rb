#!/usr/bin/env ruby

commands = STDIN.read

lights = []

# Initialize the lights
1000.times do |row|
  lights[row] = []
  1000.times do |col|
    lights[row][col] = 0
  end
end

INTERPOLATER = 100
def show(lights)
  lights.each_with_index do |row,i|
    if i % INTERPOLATER == 0
      print "\n"
      row.each_with_index do |col,j|
        if j % INTERPOLATER == 0
          print lights[i][j].to_s.ljust(5)
        end
      end
    end
  end
  print "\n"
end

def count(lights)
  sum = 0
  lights.each_with_index do |row,i|
    row.each_with_index do |col,j|
      sum += lights[i][j]
    end
  end
  sum
end

# http://rubular.com/r/zSH6q2DyWd
PARSER = /(on|off|toggle) (\d+),(\d+) \w+ (\d+),(\d+)/

commands.split("\n").each do |command_line|

  _, action, x1, y1, x2, y2 = PARSER.match(command_line).to_a

  # puts "action: #{command_line}"

  change = case action
  when 'on'
    1
  when 'toggle'
    2
  when 'off'
    -1
  end

  ((x1).to_i..(x2.to_i)).each do |row|
    ((y1).to_i..(y2.to_i)).each do |col|
      lights[row][col] += change
      lights[row][col] = 0 if lights[row][col] < 0
    end
  end
  # show(lights)
  # exit if change == 2
end

puts "sum of brightness #{count(lights)}"

