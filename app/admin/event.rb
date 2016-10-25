ActiveAdmin.register Event do
  belongs_to :user
  

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  controller do
    def find_resource
      scoped_collection.where(path: params[:id]).first!
    end
  end
  
  # around_filter do |controller, action|
  #   Event.class_eval do
  #     alias :__active_admin_to_param :to_param
  #     def to_param() id.to_s end
  #   end

  #   begin
  #     action.call
  #   ensure
  #     Event.class_eval do
  #       alias :to_param :__active_admin_to_param
  #     end
  #   end
  # end
  
  index do
    selectable_column
    column "User", :user_id
    column :event_name
    column :event_type
    column :event_date
    column :event_rsvp_date
    column :path
    column :created_at
    column :updated_at
    actions
  end

    
  show do
    panel "Guests" do
      table_for event.guests do
        column :id
        column :first_name
        column :last_name
        column :guest_status
        column :phone
        column :email
        column :created_at
        column :updated_at
        column "Actions" do
          puts event.id
          event.guests.each do |g|
            puts g.id
          end
          link_to "view", admin_event_guest_path(event.id, :id)
        end
      end
    end
    
    active_admin_comments
  end
  
  sidebar "Details", only: :show do
    attributes_table_for event do
      row :event_name
      row :event_type
      row :event_date
      row :path
      
      ul do
        li link_to "Guests", admin_event_guests_path(event.id)
      end
    end
  end

end
