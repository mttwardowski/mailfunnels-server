class BroadcastController < ShopifyApp::AuthenticatedController


  # Page Render Function
  # --------------------
  # Renders the Broadcasts page
  #
  #
  def broadcasts

    # Get the current App
    @app = MailfunnelsUtil.get_app

    # Get the Current User
    @user = User.find(@app.user.id)

    unless @user
      redirect_to '/error_page'
    end


    # Get all lists For App
    @lists = EmailList.where(app_id: @app.id)

    # Get all Email Templates For App
    @templates = EmailTemplate.where(app_id: @app.id)

    # Get all Broadcasts For App
    @broadcasts = BatchEmailJob.where(app_id: @app.id)

    # Initialize Global Variable
    @total_subs = 0

  end


  # Page Render Function
  # --------------------
  # Renders the broadcast info page
  #
  # Parameters
  # ----------
  # id: ID of the batch email job to show info for
  #
  def broadcast_info

    # Get the current App
    @app = MailfunnelsUtil.get_app

    # Get the Batch Email Job
    @broadcast = BatchEmailJob.find(params[:id])

  end




  # USED WITH AJAX
  # --------------
  # Creates a new Broadcast Instance
  #
  # PARAMETERS
  # ----------
  # app_id: ID of the current App
  # name: Name of the Broadcast
  # Description: Description of the Broadcast
  # email_template_id: ID of the Email Template to send to subscribers
  # email_list_id: ID of the email list to send batch email to
  #
  def ajax_new_broadcast

    # Create new Batch Email
    batch = BatchEmailJob.create(app_id: params[:app_id],
                         email_template_id: params[:email_template_id],
                         name: params[:name],
                         description: params[:description])
    puts "========"
    puts batch.id
    puts "========"

    # batch = BatchEmailJob.new
    #
    # # Update the Attributes for the Batch Email Job
    # batch.app_id = params[:app_id]
    # batch.email_template_id = params[:email_template_id]
    # batch.name = params[:name]
    # batch.description = params[:description]
    #
    # # Save Broadcast
    # batch.save

    # Create new Broadcast List Instance
    params[:email_list_id].each do |listid|
      # list = BroadcastList.new

      BroadcastList.create(app_id: params[:app_id],
                           batch_email_job_id: batch.id,
                           email_list_id: listid
      )

      # # Update with attributes
      # list.app_id = params[:app_id]
      # list.batch_email_job_id = batch.id
      # list.email_list_id = listid
      #
      # # Save Broadcast List
      # list.save
    end


    response = {
        success: true,
        message: 'Broadcast Created',
        broadcast_id: batch.id
    }

    render json: response

  end


end
