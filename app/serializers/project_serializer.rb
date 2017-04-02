class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :description
  has_many :supplies
  has_many :reviews
  belongs_to :user
end
