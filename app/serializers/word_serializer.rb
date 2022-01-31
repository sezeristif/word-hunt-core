class WordSerializer < ActiveModel::Serializer
  attributes :id, :tr, :en

  def tr
    object.tr.capitalize
  end

  def en
    object.en.capitalize
  end
end
