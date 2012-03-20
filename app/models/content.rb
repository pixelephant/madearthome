class Content < ActiveRecord::Base

translates :text

extend FriendlyId
friendly_id :name, use: :slugged

has_many :subcontents

end
