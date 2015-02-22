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
  set :enviroment, :production
end

activate :directory_indexes
# page 'feed.xml', layout: false
