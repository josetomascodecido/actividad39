class PagesController < ApplicationController
load_and_authorize_resource
skip_authorization_check :only => :dashboard
  def dashboard
    @users = User.order(:name)
  end
end
