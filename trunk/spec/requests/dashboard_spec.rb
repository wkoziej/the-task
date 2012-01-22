require 'spec_helper'

describe "Start page", :type => :request do

  let(:user) { Factory :user }
  before(:each) { sign_in user }

  it "shows dashboard" do
    visit '/'
    page.should have_content('Tablica')
  end

end
