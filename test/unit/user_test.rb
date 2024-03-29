# -*- coding: utf-8 -*-
require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "point operations" do
    user = users(:one)
    publicKind = point_kinds(:public)
    assert (user.point_sum('not existing') == 0), "User posiada niezerową liczbę punktów nieistniejącego rodzaju"
    assert (user.point_sum(publicKind) == 1), "User posiada inną niż 1 liczbę punktów 'publicznych' "
    mark = Mark.find_by_user_id_and_point_kind_id(user, publicKind)
    mark.point_sum += 10
    mark.save
    assert (user.point_sum(publicKind) == 11), "User posiada inną niż 11 liczbę punktów 'publicznych' "
  end

end
