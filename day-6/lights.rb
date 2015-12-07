#!/usr/bin/env ruby

commands = STDIN.read

lights = []

# Initialize the lights
1000.times do |row|
  lights[row] = []
  1000.times do |col|
    lights[row][col] = false
  end
end

INTERPOLATER = 50
def show(lights)
  lights.each_with_index do |row,i|
    if i % INTERPOLATER == 0
      print "\n"
      row.each_with_index do |col,j|
        if j % INTERPOLATER == 0
          print lights[i][j] ? '.':' '
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
      sum += lights[i][j] ? 1:0
    end
  end
  sum
end

# http://rubular.com/r/zSH6q2DyWd
PARSER = /(on|off|toggle) (\d+),(\d+) \w+ (\d+),(\d+)/

commands.split("\n").each do |command_line|

  _, action, x1, y1, x2, y2 = PARSER.match(command_line).to_a

  value = action == 'on' ? true : false

  ((x1).to_i..(x2.to_i)).each do |row|
    ((y1).to_i..(y2.to_i)).each do |col|

      if action == 'toggle'
        lights[row][col] = !lights[row][col]
      else
        lights[row][col] = value
      end
    end
  end
end

puts "lights on #{count(lights)}"

