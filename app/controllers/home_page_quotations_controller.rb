class HomePageQuotationsController < ApplicationController
  before_action :set_home_page_quotation

  def edit;end

  def update
    if @home_page_quotation.update(home_page_quotation_params)
      redirect_to admin_dashboard_path
    else
      render :edit
    end
  end

  private

  def set_home_page_quotation
    @home_page_quotation = HomePageQuotation.find(params[:id])
    authorize @home_page_quotation
  end

  def home_page_quotation_params
    params.require(:home_page_quotation).permit(:quotation, :caption)
  end
end
