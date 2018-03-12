class UserPolicy
    attr_reader :current_user, :model
  
    def initialize(current_user, model)
      @current_user = current_user
      @user = model
    end

    #Add class Scope to show teacher only student users
  
    def index?
      current_user.admin? || current_user.teacher?
    end

    def show?
      current_user.admin? || current_user.teacher?
    end
  
    def update?
      current_user.admin?
    end
  
    def destroy?
      return false if current_user == user
      current_user.admin?
    end
  
  end