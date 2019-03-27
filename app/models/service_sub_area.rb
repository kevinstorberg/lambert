class ServiceSubArea < ApplicationRecord

  belongs_to :service_area

  validates_presence_of :description, :headline, :title
end
