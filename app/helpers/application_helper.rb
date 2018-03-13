module ApplicationHelper

    def navbar_options(current_user)
        if current_user.admin?
           (link_to "All Subjects", subjects_path) + " | " + (link_to "Manage Users", users_path)
        elsif current_user.teacher?
           (link_to "Your Subjects", root_path) + " | " + (link_to "All Subjects", subjects_path) + " | " + (link_to "Students", users_path)
        else
            link_to "Your Subjects", root_path
        end
        
    end
end
