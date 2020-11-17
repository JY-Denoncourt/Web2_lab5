#Jean-Yves Denoncourt 9977949   2020/11/13

class Admin::UsersController < AdminController
   
    
    def admin
    end

#===================================================================================


    def recettes_admin
        #@users = User.left_joins(:recettes).where.not(recettes: { id: nil } )
        @users = User.joins("INNER JOIN recettes ON recettes.user_id = users.id").distinct 
        
    end


#===================================================================================


    def detail_admin
       @recette = Recette.find(params[:id])
    end
end