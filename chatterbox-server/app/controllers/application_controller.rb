class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
   get '/messages' do
   Message.all.to_json
   end

   post '/messages' do
   Message.create(params).to_json
   Message.last.to_json
   end

   patch '/messages/:id' do
    update_message=Message.find_by_id(params[:id])
    update_message.update(body: params[:body])
    update_message.to_json
   end

   delete '/messages/:id' do
    Message.delete_by(params)
   end

  
end
