class MessagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :index
  # before_action :find_message, only: %i[update destroy show edit]
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    @property_contract = PropertyContract.find(params[:property_contract_id])
    @message = Message.new(message_params)
    @message.property_contract = PropertyContract.first
    @message.property_contract = @property_contract
    @message.user = current_user
    if @message.save!
      PropertyContractChannel.broadcast_to(
  @property_contract,
  render_to_string(partial: "message", locals: { message: @message })
)
      redirect_to property_path(@property_contract.property, anchor: "message-#{@message.id}")
    else
      render "properties/show"
    end
  end

  # def destroy
  #   @message.destroy
  #   redirect_to messages_path
  # end

  private

  def message_params
    params.require(:message).permit(:content, :file)
  end

  def find_message
    @message = Message.find(params[:id])
  end
end
