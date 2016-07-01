class HomeController < ApplicationController
  before_filter :not_available_for_user, :only => [:about, :login, :signup]
  def about
  end

  def login
  	@user = User.new
  end

  def signup
  	@user = User.new
  end
end
