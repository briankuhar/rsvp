ActiveAdmin.register Guest do
  belongs_to :event
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


  index do
    selectable_column
    column :event_id
    column :party_id
    column :guest_status
    column :first_name
    column :last_name
    column :email
    column :phone
    actions
  end


end
