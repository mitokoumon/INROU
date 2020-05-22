class ReceiversController < ApplicationController
  before_action :authenticate_user!

  def create
    receiver = Receivers.new(receiver_params)
    receiver.user_id = current_user.id
    if receiver.save
      redirect_to users_receivers_path
    else
      @receiver = Receiver.new
      @receivers = current_user.receivers
      # redirect_back(fallback_location: root_path)
      render 'index'
    end
  end

  def index
    @receiver = Receiver.new
    @receivers = current_user.receivers
  end

  def edit
    @receiver = Receiver.find(params[:id])
  end

  def update
    @receiver = Receiver.find(params[:id])
    if @receiver.update(receiver_params)
      redirect_to users_receivers_path
    else
      redirect_to edit_users_receiver_path, flash: { error: @receiver.errors.full_messages }
    end
  end

  def destroy
    registrated_receiver = Receiver.find(params[:id])
    if registrated_receiver.destroy
      redirect_to users_receivers_path
    else
      @receiver = Receiver.new
      @receivers = current_user.receivers
      render 'index'
    end
  end

  private
  def receiver_params
    params.require(:receiver).permit(:post_code, :address, :name)
  end
end