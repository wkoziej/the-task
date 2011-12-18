class Mark < ActiveRecord::Base
  belongs_to :user
  belongs_to :pointKind

  # Validations
  validate :pointKind, :presence => true
  validate :user, :presence => true

end
