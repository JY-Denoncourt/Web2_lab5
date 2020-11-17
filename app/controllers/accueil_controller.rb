#Jean-Yves Denoncourt 9977949 2020/11/13

class AccueilController < ApplicationController
    def accueil 
    end

    #--------------------------------------------------------------------------------

    def mesRecettes 
        #transferer le id de current_user dans le controller
        @currentUser = current_user
        @mesRecettes = Recette.where(:user_id => @currentUser.id)     
    end

    #--------------------------------------------------------------------------------

    def recetteDetail
        @recette = Recette.find(params[:id])

        @ingredients = @recette.ingredients.collect do |ingredient|
            ingredient.nom
        end
        
        respond_to do |format|
            format.html { render 'accueil/recetteDetail' }
            format.json { render :json => @ingredients.to_json } 
            format.xml { render :xml =>  @recette.ingredients.as_json.to_xml }
        end   
    end

end