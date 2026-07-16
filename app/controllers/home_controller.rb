class HomeController < ApplicationController
  def index
    @livros = Livro.all
  end
end
