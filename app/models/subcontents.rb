class Subcontents < ActiveRecord::Base

extend FriendlyId
friendly_id :name, use: :slugged

belongs_to :content

end
