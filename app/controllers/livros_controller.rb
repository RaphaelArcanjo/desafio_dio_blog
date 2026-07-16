class LivrosController < ApplicationController
  def index
    @livros = Livro.all
  end

  def show
    @livro = Livro.find(params[:id])
  end

  def new
    @livro = Livro.new
  end

  def edit
    @livro = Livro.find(params[:id])
    render :new
  end

  def create
    @livro = Livro.new(livros_params)

    respond_to do |format|
      if @livro.save
        format.html { redirect_to livros_url(@livro), notice: "Livro was successfully created." }
        format.json { render :show, status: :created, location: @livro }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @livro.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @livro = Livro.find(params[:id])
    
    respond_to do |format|
      if @livro.update(livros_params)
        format.html { redirect_to livros_url(@livro), notice: "Livro was successfully updated." }
        format.json { render :show, status: :ok, location: @livro }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @livro.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @livro = Livro.find(params[:id])
    @livro.destroy

    respond_to do |format|
      format.html { redirect_to livros_url, notice: "Livro was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_livro
      @livro = Livro.find(params[:id])
    end

    def livros_params
      params.require(:livro).permit(:id, :titulo, :descricao, :autor, :nota)
    end
end
