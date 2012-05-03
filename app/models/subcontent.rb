class Subcontent < ActiveRecord::Base

translates :text

extend FriendlyId
friendly_id :name, :use => :slugged

belongs_to :content

validates :name, :text, :presence => true
validates :name, :uniqueness => true

end
