class PropertyContractChannel < ApplicationCable::Channel
 def subscribed
    property_contract = PropertyContract.find(params[:id])
    stream_for property_contract
  end
end
