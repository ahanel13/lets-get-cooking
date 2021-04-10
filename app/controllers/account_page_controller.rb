class AccountPageController < ApplicationController
    before_action :authenticate_user!
    
    # GET /account or /account.json
    def index
    end

    
end
