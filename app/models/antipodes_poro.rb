class AntipodesPoro
  attr_reader :name, :type, :summary, :temp, :id

  def initialize(name,type,summary,temp)
    @id = 1
    @name = name
    @type = type
    @summary = summary
    @temp = temp
  end
end
