module CustomHelpers
  URL = 'http://images.alexandracarr.co.uk.s3-website-eu-west-1.amazonaws.com/'

  def ext_image(name)
    image_tag URL + name
  end
end
