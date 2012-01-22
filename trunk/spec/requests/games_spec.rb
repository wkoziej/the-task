# -*- coding: utf-8 -*-
require 'spec_helper'

include Devise::TestHelpers

describe "Games views", :type => :request do

  let(:user) { Factory :user }
  before(:each) { sign_in user }

  describe 'GET /games' do
    it "shows game list" do
      visit '/games'
      page.should have_content('Zasadź kwiatka')
    end
  end

end
