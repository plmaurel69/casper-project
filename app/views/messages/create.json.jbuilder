if @message.persisted?
  json.form json.partial!('messages/form.html.erb', contract: @property_contract)
  # json.inserted_item json.partial!('messages/message.html.erb', message: @message, current_user: current_user)
else
  json.form json.partial!('messages/message.html.erb', message: @message, current_user: current_user)
end
