#!/usr/bin/env ruby

require 'mini_magick'

abort 'Pass files to resize as args' if ARGV.empty?
abort '`thumbnail_images` dir already exists.' if Dir.exist? 'thumbnail_images'
Dir.mkdir 'resized_images'

images = ARGV.select do |file|
  file.match(/\.(jpg|jpeg|png)\z/)
end

images.each do |path|
  puts path

  THUMB_SIZE = 100

  file = MiniMagick::Image.open path
  file.combine_options do |c|
    c.auto_orient
    c.thumbnail "x#{THUMB_SIZE * 2}"
    c.resize "#{THUMB_SIZE * 2}x<"
    c.resize '50%'
    c.gravity 'center'
    c.crop "#{THUMB_SIZE}x#{THUMB_SIZE}+0+0"
  end

  image.write 'thumbnail_images/' + File.basename(path)
end
