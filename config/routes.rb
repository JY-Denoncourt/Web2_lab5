#Jean-Yves Denoncourt 9977949   29-Novembre-2020

Rails.application.routes.draw do
 
  devise_for :users
  
  #section Public
  root 'accueil#accueil'                                      #(ok) route acceuil_Controller (def accueil)      sur acceuil.html.erb (/views/acceuil)
  get '/recettes/:id', to: 'accueil#detailPublic'             #(ok) route accueil_Controller (def detailPublic) sur recetteDetail.html.erb (/views/accueil)
  get '/mesrecettes', to: 'accueil#mesrecettes'               #(ok) route acceuil_Controller (def mesrecettes)  sur mesRecettes.html.erb (/views/mesRecettes)
      
  
  #section Admin
  namespace :admin do
    get '/', to: 'recette#admin'                                #(ok) route recette_controller (def admin)           sur admin.html.erb
    get '/userRecettes', to: 'recette#recettes_user'            #(ok) route recette_controller (def recettes_user)   sur recette_ser.html.erb
    get '/recettes', to: 'recette#recettes_admin'               #(ok) route recette_controller (def recette_admin)   sur recettes_admin.html.erb
    get '/recettes/:id', to: 'recette#detail_admin'             #(ok) route recette_controller (def recettes_detail) sur detail_admin.html.erb
    
    #CRUD  Edit et add
    get '/addRecette', to: 'recette#addRecette'                 #(ok) route recette_controller (def addRecette)  sur addRecette.html.erb
    post '/addRecette', to: 'recette#create'                    #(ok) route recette_controller (def addRecette)  sur addRecette.html.erb
    get '/editRecette/:id', to: 'recette#editRecette'           #(ok) route recette_controller (def editRecette) sur editRecette.html.erb
    post '/editRecette/:id', to: 'recette#edit'                 #(ok) route recette_controller (def editRecette) sur editRecette.html.erb

  end
end