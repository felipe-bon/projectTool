class TarefasController < ApplicationController


    def new

        # verificar se o current user que quer criar a tarefa tem cargo de SM

        user = current_user
        membroAtual = Membro.find_by(projeto_id:params[:projeto_id], user_id: user.id)
        
        if membroAtual.cargo  == "SM"

            @projeto_id = params[:projeto_id]
            @tarefa = Tarefa.new
            @membros = Membro.where(projeto_id: @projeto_id)
            @membrosUsers = []

            @membros.each do |membro|

                @membrosUsers.push(User.find(membro.user_id))

            end
        
        else
            @projeto = Projeto.find(params[:projeto_id])
            redirect_to @projeto, notice: 'Apenas o Scrum Master pode adicionar tarefas ao quadro scrum!'
        end
    end

    def show
        @projeto = Projeto.find(params[:projeto_id])
        @tarefa = (Tarefa.where(projeto_id: @projeto.id, id: params[:tarefa_id]))[0]
        resp = User.where(id: @tarefa.user_id)
        if resp.empty?
            @responsavel = ""
        else
            @responsavel = resp[0].nome
        end
    end

    def edit

        # verificar se o current user que quer editar a tarefa tem cargo de SM

        user = current_user
        membroAtual = Membro.find_by(projeto_id:params[:projeto_id], user_id: user.id)
        
        if membroAtual.cargo  == "SM"

            @projeto = Projeto.find(params[:projeto_id])
            @tarefa = Tarefa.find_by(id: params[:id], projeto_id: @projeto.id)

            @membros = Membro.where(projeto_id: @projeto.id)
            @membrosUsers = []

            @membros.each do |membro|

                @membrosUsers.push(User.find(membro.user_id))

            end

        else
            @projeto = Projeto.find(params[:projeto_id])
            redirect_to @projeto, notice: 'Apenas o Scrum Master pode editar tarefas do quadro scrum!'
        end

    end

    def update
        
        @projeto = Projeto.find(params[:projeto_id])
        @tarefa = Tarefa.find_by(id: params[:id], projeto_id: @projeto.id)


        if @tarefa.update(tarefa_params)
            redirect_to @projeto, notice: 'Tarefa atualizada!'
        else
            redirect_to @projeto, notice: 'Erro ao atualizar tarefa!'
        end
      end

    def avancar_etapa

        @projeto = Projeto.find(params[:projeto_id])
        @tarefa = Tarefa.find(params[:id])

        if @tarefa.avancar_etapa
            redirect_to @projeto, notice: 'Etapa da tarefa avançada com sucesso!'
        else
            redirect_to @projeto, alert: 'Erro ao avançar etapa da tarefa!'
        end
        
    end

    def create
        usuarioAtual = current_user
        @projeto = Projeto.find(params[:projeto_id]) # Alterado para encontrar o projeto corretamente
        
        # Verifica se o usuário atual é membro do projeto em que ele quer criar uma tarefa
        membro = Membro.where(user_id: usuarioAtual.id, projeto_id: @projeto.id)
      
        if membro.empty?
            redirect_to @projeto, notice: 'Você não tem permissão para essa ação!'
        else
    
            @tarefa = @projeto.tarefas.build(tarefa_params) 
      
            if @tarefa.save
                redirect_to @projeto, notice: 'Tarefa criada com sucesso!'
            else
                redirect_to @projeto, notice: 'Erro ao criar tarefa!'
            end
        end
    end
      
    private
      
    def tarefa_params
        params.permit(:id, :descricao_tarefa, :etapa, :prioridade, :user_id, :vencimento)
    end
      

end