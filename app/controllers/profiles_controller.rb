class ProfilesController < ApplicationController

    before_action :authenticate_user!

    def show

        if user_signed_in?
            @usuario = current_user
 
            @membros = Membro.where(user_id: current_user.id)
            @projetos = []
            @membros.each do |membro|
                projeto = Projeto.find(membro.projeto_id)
                @projetos.push(projeto)
            end
            
        else
            redirect_to new_user_session_path
        end

    end
end
