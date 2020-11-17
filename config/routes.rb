#Jean-Yves Denoncourt 9977949   2020/11/13

Rails.application.routes.draw do
 
  devise_for :users
  root 'accueil#accueil'                                      #(ok) route acceuil_Controller (def) sur  acceuil (html.erb)
  
  get '/mesRecettes', to: 'accueil#mesRecettes'               #(ok) route acceuil_Controller (def) sur  mesRecettesAcceuil (html.erb)
  get '/mesRecettes/:id', to: 'accueil#recetteDetail'         #(ok) route acceuil_Controller (def) sur  mesRecettesAcceuil (html.erb)

  namespace :admin do
    get '/', to: 'users#admin'                                #(ok) route users_controller (def) sur admin (html.erb)
    get '/recettes', to: 'users#recettes_admin'               #() route users_controller (def) sur recettes_admin(html.erb)
    get '/recettes/:id', to: 'users#detail_admin'             #() route users_controller (def) sur detail_admin(html.erb)
  end
end