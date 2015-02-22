# Variables

set :site_url, 'http://www.alexandracarr.co.uk'
set :title, 'Alexandra Carr'
set :description, 'Sculptor and Artist'

# Config

set :enviroment, :development

require './helpers.rb'
helpers CustomHelpers

activate :livereload,
         host: 'localhost',
         apply_js_live: false,
         apply_css_live: false,
         no_swf: true

set :css_dir, 'css'
set :js_dir, 'js'
set :partials_dir, 'partials'

set :relative_links, true
activate :relative_assets

set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true,
               smartypants: true

configure :build do
  activate :minify_css
  activate :gzip
  set :enviroment, :production
end

activate :directory_indexes
# page 'feed.xml', layout: false

require 'yaml'
aws = YAML.load_file 'aws.yml'

activate :s3_sync do |s3|
  s3.bucket                = 'www.alexandracarr.co.uk'
  s3.region                = 'eu-west-1'
  s3.aws_access_key_id     = aws['key']
  s3.aws_secret_access_key = aws['secret']
  s3.delete                = true
  s3.after_build           = false
  s3.prefer_gzip           = true
end
