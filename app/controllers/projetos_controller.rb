class ProjetosController < ApplicationController
  
  before_action :authenticate_user!

  

  def show

    usuario = current_user
    begin
      projeto = Projeto.find(params[:id])
      membro = Membro.where(projeto_id: projeto.id, user_id: usuario.id)
      
      if membro.empty?
        flash[:alert] = "Acesso negado! Você não tem permissão para acessar esta página."
        redirect_to root_path # ou para qualquer outra página que deseje
      else
        @membroUser = User.find(membro[0].user_id)
        @projeto = projeto
        membros = Membro.where(projeto_id: projeto.id)
        @membrosUsers = []

          membros.each do |membro|

            @membrosUsers.push(User.find(membro.user_id))

          end

      end
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, notice: 'Projeto não encontrado!'
    end

  end
  
  def new
    @projeto = Projeto.new
  end

  def entrar_projeto

    usuario = current_user
    cargo = params[:cargo]
    codigo_de_acesso = params[:codigo_de_acesso]
    
    projeto = Projeto.find_by(codigo_de_acesso: params[:codigo_de_acesso])
    
    if projeto.nil?
      redirect_to root_path, notice: 'Projeto não encontrado!'
    else
       
      verificaMembro = Membro.where(user_id: usuario.id, projeto_id: projeto.id)
      
      if !verificaMembro.empty?

        verificaMembro.update(cargo: params[:cargo])
        membro = verificaMembro[0]

      else

        membro = Membro.new(user_id: usuario.id, projeto_id: projeto.id, adm: false, cargo: params[:cargo])
      
      end

      if membro.save
        redirect_to projeto, notice: 'Agora você é membro deste projeto!'
      else
        redirect_to root_path, notice: 'Erro ao entrar no projeto!'
      end
    end
  end
  

  def create
    @projeto = current_user.projetos.build(nome: projeto_params[:nome])
    @projeto.codigo_de_acesso = gerarCodigoDeAcesso
    if @projeto.save
      # Define o usuário atual como administrador do projeto
      @projeto.membros.create(user: current_user, cargo: projeto_params[:cargo], adm: true)
      redirect_to @projeto, notice: 'Projeto criado com sucesso!'
    else
      render :new
    end
  end

  private

  def projeto_params
    params.require(:projeto).permit(:nome, :cargo)
  end

  def gerarCodigoDeAcesso
    SecureRandom.base64(6)
  end
end