class AntipodesPoro
  attr_reader :name, :type, :summary, :temp

  def initialize(name,type,summary,temp)
    @name = name
    @type = type
    @summary = summary
    @temp = temp
    binding.pry
  end
end
