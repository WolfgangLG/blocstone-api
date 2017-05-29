class GlassdoorEmployer < ActiveRecord::Base

  validates :employer_id, :uniqueness => true

end
