class Mark < ActiveRecord::Base
  belongs_to :user
  belongs_to :point_kind

  # Validations
  validate :point_kind, :presence => true
  validate :user, :presence => true

end
