#Jean-Yves Denoncourt 9977949 29-novembre-2020

class AccueilController < ApplicationController
    before_action :authenticate_user!, :except => [:accueil]

    layout "public/base"

    def accueil 
        @recettes = Recette.all
    end


     #--------------------------------------------------------------------------------

     def detailPublic
        @User = current_user
        @recettes = Recette.find(params[:id])    
        render 'accueil/recetteDetail' 
    end

    #--------------------------------------------------------------------------------

    def mesrecettes 
        #transferer le id de current_user dans le controller
        @recettes = current_user.recettes
        render 'mesRecettes/mesRecettes'
    end

    #--------------------------------------------------------------------------------

    

end