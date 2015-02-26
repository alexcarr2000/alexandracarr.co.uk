#!/usr/bin/env ruby

require 'mini_magick'

abort 'Pass files to resize as args' if ARGV.empty?

images = ARGV.select do |file|
  file.match(/\.(jpg|jpeg|png)\z/)
end

THUMB_SIZE = 100

images.each do |path|
  puts path

  file = MiniMagick::Image.open path
  file.combine_options do |c|
    c.auto_orient
    c.thumbnail "x#{THUMB_SIZE * 2}"
    c.resize "#{THUMB_SIZE * 2}x<"
    c.resize '50%'
    c.gravity 'center'
    c.crop "#{THUMB_SIZE}x#{THUMB_SIZE}+0+0"
  end

  file.write path.split('.').insert(-2, '-thumb.').join
end
