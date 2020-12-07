#Jean-Yves Denoncourt 9977949   29-Novembre-2020

class Admin::RecetteController < AdminController
   
    layout "adminSection/base"

    def admin
    end

#===================================================================================

    def recettes_user
        @users = User.joins("INNER JOIN recettes ON recettes.user_id = users.id").distinct 
    end

#===================================================================================

    def recettes_admin
        @recettes = Recette.all
    end

#===================================================================================

    def detail_admin
       @recette = Recette.find(params[:id])
    end

#===================================================================================

    def addRecette
        @recette = Recette.new
    end

    
    def create
        
        @recette = Recette.new(titre: params[:recette][:titre], etapes: params[:recette][:etapes], user: @current_user)
        
        #ajout ingredient ici
        
        respond_to do |format|    
            if @recette.save # Si la sauvegarde se passe bien, on redirige vers l'action /admin/recettes pour rafraichir le formulaire
              format.html {redirect_to '/admin/recettes'}
            else
              format.html {render '/admin/addRecette' } # Si une erreur arrive, on l'affiche sur le formulaire d'origine
            end
            # Si utilisation en javascript
            format.json { render :json => @post.to_json }
            format.xml { render :xml => @post.as_json.to_xml }
          end

    end  

#===================================================================================

    def editRecette
        @recette = Recette.find(params[:id])

    end


    def edit
        @recette = Recette.find(params[:id])
        @recette.update(titre: params[:recette][:titre], etapes: params[:recette][:etapes])

        #ajout ingredient ici
        
        respond_to do |format|    
            if @recette.save # Si la sauvegarde se passe bien, on redirige vers l'action /admin/recettes pour rafraichir le formulaire
              format.html {redirect_to '/admin/recettes'}
            else
              format.html {render '/admin/editRecette' } # Si une erreur arrive, on l'affiche sur le formulaire d'origine
            end
            # Si utilisation en javascript
            format.json { render :json => @post.to_json }
            format.xml { render :xml => @post.as_json.to_xml }
          end

    end


end