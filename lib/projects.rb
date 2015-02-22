module Galleries
  def all
    @projects ||= Dir.glob('projects/*.yml').map do |path|
      YAML.load_file path
    end
  end

  module_function :all
end
