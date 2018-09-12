class PagesController < ApplicationController
skip_authorization_check :only => :dashboard
  def dashboard
    @users = User.order(:name)
  end
end
