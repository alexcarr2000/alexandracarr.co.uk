module Galleries
  def all
    @galleries ||= Dir.glob('galleries/*.yml').map do |path|
      YAML.load_file path
    end
  end

  module_function :all
end
