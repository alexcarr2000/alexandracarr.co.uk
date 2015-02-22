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

Copy `aws.example.yml` to `aws.yml` and fill in the details *in that file*.

`middleman server` to preview.

`middleman build && middleman s3_sync` to deploy.

## Notes

[AWS S3 static site hosting](http://docs.aws.amazon.com/AmazonS3/latest/dev/website-hosting-custom-domain-walkthrough.html)

[AWS S3 manipulation through fog](http://fog.io/storage/)
