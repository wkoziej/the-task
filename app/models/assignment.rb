# Przypisanie uzytkownika do roli (i vice versa)
class Assignment < ActiveRecord::Base
  belongs_to :user
  belongs_to :role
end
