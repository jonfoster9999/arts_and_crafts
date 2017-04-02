class SupplySerializer < ActiveModel::Serializer
  attributes :id, :title, :price
  belongs_to :project
end
