#!/usr/bin/env ruby

require 'mini_magick'

abort 'Pass files to resize as args' if ARGV.empty?
abort '`resized_images` dir already exists.' if Dir.exist? 'resized_images'
Dir.mkdir 'resized_images'

images = ARGV.select do |file|
  file.match(/\.(jpg|jpeg|png)\z/)
end

images.each do |path|
  puts path
  image = MiniMagic::Image.open path
  image.resize '580x1000' unless image.width < 580
  image.write 'resized_images/' + File.basename(path)
end
