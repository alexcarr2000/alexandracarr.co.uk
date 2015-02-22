# alexandracarr.co.uk

Artist's website.

What                                                  | For
----------------------------------------------------- | ---
[Middleman](middleman)                                | site compilation
[Middleman::S3Sync](s3sync)                           | deployment
[Sass](sass)                                          | styling
[AWS](aws)                                            | hosting
[ImageMagick](imagemagick) & [MiniMagick](minimagick) | image resizing

[middleman]: https://github.com/middleman/middleman
[sass]: https://github.com/sass/sass
[imagemagick]: http://www.imagemagick.org/
[minimagick]: https://github.com/minimagick/minimagick
[aws]: http://aws.amazon.com/
[s3sync]: https://github.com/fredjean/middleman-s3_sync

## Use

`bundle` to install deps.

Copy `aws.example.yml` to `aws.yml` and fill in the details *in that file*.

`middleman server` to preview.

`middleman build && middleman s3_sync` to deploy.
