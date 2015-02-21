set :enviroment, :development

activate :livereload,
         host: 'localhost',
         apply_js_live: false,
         apply_css_live: false,
         no_swf: true

set :site_url, 'http://www.alexandracarr.co.uk'
set :title, 'Alexandra Carr'
set :description, 'Sculptor and Artist'

set :css_dir, 'css'
set :js_dir, 'js'
set :images_dir, 'images'
set :partials_dir, 'partials'

set :relative_links, true

set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true,
               smartypants: true

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :relative_assets
  set :enviroment, :production
end

activate :directory_indexes
# page 'feed.xml', layout: false
