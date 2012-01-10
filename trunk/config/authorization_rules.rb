authorization do

  role :guest do
    has_permission_on :games, :to => [:index, :show]
    has_permission_on :rewards, :to => [:index, :show]
#    has_permission_on :comments, :to => [:edit, :update] do
#      if_attribute :user => is { user }
#    end
  end

  role :admin do
    has_permission_on [:games], :to => [:index, :show, :new, :create, :edit, :update, :destroy]
  end
  
  role :author do
    includes :guest
    has_permission_on :articles, :to => [:new, :create]
    has_permission_on :articles, :to => [:edit, :update] do
      if_attribute :user => is { user }
    end
  end

end
