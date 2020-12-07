#Jean-Yves Denoncourt 9977949   29-novembre 2020

class AdminController < ApplicationController
    before_action :authenticate_user!
    before_action :is_admin

    layout "adminSection/base"

    private
    def is_admin
        if ( !(current_user.is_admin) )    #ou if (!current_user.is_admin)
            redirect_to "/"
        end
    end
end