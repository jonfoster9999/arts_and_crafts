class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  has_many :supplies
  belongs_to :user
end
