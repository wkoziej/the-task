require File.expand_path("spec/spec_helper.rb")

describe ChallengesController do
  render_views false

  
  context "with parent game" do
    
    before(:each) do
      @user = User.create!(:email => "aaa1@bbb1.com", :password => "secret")
      @game = Game.create!(:title => "Title", :creator => @user,  :description => "Desc");
    end

    describe "index" do
      #get :index, :game_id => @game.id
      #response.should render_template("index")
      #response.body.should == ""
    end
  
  end

  context "without parent game" do
  end
end


