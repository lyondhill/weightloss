class HomeController < ApplicationController
  def index
    if current_user
      @group_members = current_user.group.users.to_a.sort {|x,y| y.percent_lost <=> x.percent_lost}
    end
  end
end

