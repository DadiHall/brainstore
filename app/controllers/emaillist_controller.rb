class EmaillistController < ApplicationController
  def subscribe
    @list_id = ENV["MAILCHIMP_LIST_ID"]
    gibbon = Gibbon::Request.new

    gibbon.lists(@list_id).members.create(
      body: {
        email_address: params[:email][:address],
        status: "subscribed"
      }
    )

    respond_to do |format|
      format.json{render :json => {:message => "You have been Successfully added to the list! :)"}}
    end
  end
end