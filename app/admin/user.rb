ActiveAdmin.register User do
  permit_params :email, 
                :sign_in_count, 
                :current_sign_in_at, 
                :last_sign_in_at,
                :current_sign_in_ip,
                :last_sign_in_ip,
                :created_at,
                :updated_at
                
  index do
    id_column
    column :email
    column :sign_in_count
    column :last_sign_in_at
    column :current_sign_in_at
    column :created_at
    actions
  end
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


end