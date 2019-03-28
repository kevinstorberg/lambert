class ServiceArea < ApplicationRecord

  has_many :service_sub_areas

  validates_presence_of :description, :headline, :title

  accepts_nested_attributes_for :service_sub_areas, allow_destroy: true
end
