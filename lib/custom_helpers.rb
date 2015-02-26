module CustomHelpers
  URL = 'http://images.alexandracarr.co.uk.s3-website-eu-west-1.amazonaws.com/'

  def ext_image(name)
    image_tag ext_image_url(name)
  end

  def ext_image_url(name)
    URL + name
  end
end
