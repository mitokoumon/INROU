class ReceiversController < ApplicationController
  def create
    receiver = Receiver.new(receiver_params)
    receiver.user_id = current_user.id
    if receiver.save
      redirect_to users_receivers_path
    else
      receivers = current_user.receivers
      render 'index'
    end
  end

  def index
    @user = current_user
    @receiver = Receiver.new
    @receivers = Receiver.all
  end

  def edit
    @user = current_user
    @receiver = Receiver.find(params[:id])
  end

  def update
    @receiver = Receiver.find(params[:id])
    if @receiver.update(receiver_params)
      redirect_to users_receivers_path
    else
      render 'edit'
    end
  end

  def destroy
    @receiver = Receiver.find(params[:id])
    if @receiver.destroy
      redirect_to users_receivers_path
    else
      render 'index'
    end
  end

  private
  def receiver_params
    params.require(:receiver).permit(:post_code, :address, :name)
  end
end