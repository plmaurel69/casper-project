class MessagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :find_message, only: %i[update destroy show edit]

  def index
      @messages = Messsage.all
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(animal_params)
    @message.user = current_user
    @message.save!
    redirect_to messages_path
  end

  def edit
  end

  def update
    @message.update(message_params)
    redirect_to animals_path
  end

  def destroy
    @message.destroy
    redirect_to animals_path
  end

  def show
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def find_animal
    @message = Message.find(params[:id])
  end
end
