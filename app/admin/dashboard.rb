ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
    
    @events = Event.all

    columns do
      column do
        panel "Recent Events" do
          table_for Event.all.order('id desc').limit(10) do
            column("User") { |event| link_to event.user.email }
            column("Event") { |event| link_to event.event_name, admin_user_event_path(event.user, event) }
            column("Guest Count") { |event| event.guests.all.count }
          end # table_for
        end # panel
      end # column
      
      column do
        panel "Event Stats" do
          ul do
            li { Event.where(:created_at => (Date.today)).count }
          end
        end
      end
      
    end # columns
    
  end # content
end
