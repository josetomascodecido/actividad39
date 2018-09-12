class UserController < ApplicationController
  skip_authorization_check
  def update
    @user = User.find(params[:id])
    @user.role = params[:role]
    if @user.save
      redirect_to dashboard_path, notice: 'Cambio realizado con exito'
    else
      redirect_to dashboard_path, alert: 'No hemos podido procesar tu cambio'
    end
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to dashboard_path
  end
end
