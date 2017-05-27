class EmailJob < ApplicationRecord

  belongs_to :app, :class_name => 'App', :foreign_key => 'app_id'
  belongs_to :subscriber, :class_name => 'Subscriber', :foreign_key => 'subscriber_id'
  belongs_to :funnel, :class_name => 'Funnel', :foreign_key => 'funnel_id'
  belongs_to :node, :class_name => 'Node', :foreign_key => 'node_id'
  belongs_to :email_template, :class_name => 'EmailTemplate', :foreign_key => 'email_template_id'

end
