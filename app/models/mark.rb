# -*- coding: utf-8 -*-
# Model punktów użytkownika
class Mark < ActiveRecord::Base
  belongs_to :user
  belongs_to :point_kind

  # Validations
  validate :point_kind, :presence => true
  validate :user, :presence => true

  after_initialize :init

  def init
    self.point_sum  ||= 0
  end

end
