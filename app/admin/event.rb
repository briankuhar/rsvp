ActiveAdmin.register Event do
  
  permit_params :id,
                :user_id,
                :event_name,
                :event_type,
                :event_date,
                :event_rsvp_date,
                :created_at,
                :updated_at,
                :path
                
  index do
    selectable_column
    id_column
    column :user_id
    column :event_name
    column :created_at
    column :updated_at
    actions
  end
  
end