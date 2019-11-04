class AntipodesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :type, :summary, :temp
end
