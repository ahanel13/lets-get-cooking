class AccountPageController < ApplicationController
    before_action :authenticate_user!
    
    # GET /account or /account.json
    def index
    end

    # GET /account/recipes or /account.json
    def recipes
    end

    
end
