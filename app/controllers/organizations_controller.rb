class OrganizationsController < ApplicationController
  before_action :find_organization_by_id, only: [:update, :edit, :show]

  def index
    @organizations = Organization.all
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)

    if @organization.valid?
      @organization.save
      redirect_to @organization
    else
      flash.now[:error] = 'Could not create organization'
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @organization.update(organization_params)
      redirect_to @organization
    else
      flash.now[:error] = 'Could not edit organization'
      render :edit
    end
  end

  private
    def organization_params
      params.require(:organization).permit(:name, :cnpj, :phone, :email, :service_kind, :about)
    end

    def find_organization_by_id
      @organization = Organization.find_by(id: params[:id])
    end
end
