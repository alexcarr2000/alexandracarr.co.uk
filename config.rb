require 'yaml'
require 'lib/custom_helpers'
require 'lib/projects'

set :site_url, 'http://www.alexandracarr.co.uk'
set :title, 'Alexandra Carr'
set :description, 'Sculptor and Artist'

set :enviroment, :development

helpers CustomHelpers

activate :livereload,
         host: 'localhost',
         apply_js_live: false,
         apply_css_live: false,
         no_swf: true

set :image_dir, ''
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

if ARGV.first == 's3_sync'
  `middleman build`

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
end

galleries = Galleries.all
set :galleries, galleries

galleries.each.with_index do |gallery|
  title = gallery['title']
  count = gallery['items'].size
  path = title.downcase.gsub(' ', '-')
  gallery['path'] = path

  gallery['items'].each.with_index do |item, i|
    locals = item.merge(
      parent: title,
      parent_path: path,
      count: count,
      index: i
    )
    proxy "/gallery/#{path}/#{i}.html".downcase,
          '/templates/item.html',
          locals: locals,
          ignore: true
  end
end
