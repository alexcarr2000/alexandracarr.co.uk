module CustomHelpers
  def ext_image(name)
    image_tag(
      'http://alexandracarr.co.uk.s3-website-eu-west-1.amazonaws.com/images/' +
      name
    )
  end
end
