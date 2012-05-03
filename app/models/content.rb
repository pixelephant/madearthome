class Content < ActiveRecord::Base

translates :text

extend FriendlyId
friendly_id :name, :use => :slugged

has_many :subcontents

validates :name, :presence => true
validates :name, :uniqueness => true

end
