class UsuariosController < ApplicationController

  before_action :find_usuario, only: [:show, :edit, :update]

  def show
  end


  def find_usuario
    @usuario = Usuario.find(params[:id])
  end

end
