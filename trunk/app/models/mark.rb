class Mark < ActiveRecord::Base
  belongs_to :user
  belongs_to :pointKind
end
