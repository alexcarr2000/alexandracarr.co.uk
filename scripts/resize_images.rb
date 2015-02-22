#!/usr/bin/env ruby

require 'mini_magick'

abort 'Pass files to resize as args' if ARGV.empty?
abort '`resized_images` dir already exists.' if Dir.exist? 'resized_images'
Dir.mkdir 'resized_images'

images = ARGV.select do |file|
  file.match(/\.(jpg|jpeg|png)\z/)
end

images.each do |file|
  puts file
  image = MiniMagic::Image.open file
  image.resize_to_fit! 580, 580 unless image.width < 580
  image.write 'resized_images/' + file
end
