class CustomFormsController < ApplicationController
  before_action :set_custom_form, only: [:edit, :update, :destroy]
  before_action :fill_form, only: [:new, :edit]

  # GET /custom_forms
  def index
    @custom_forms = CustomForm.all
  end

  # GET /custom_forms/new
  def new
    @custom_form = CustomForm.new
  end

  # GET /custom_forms/1/edit
  def edit
    @custom_fields = CustomFormField.where("custom_form_id = ?", @custom_form.id)
  end

  # POST /custom_forms
  def create
    @custom_form = CustomForm.new(custom_form_params)

    if @custom_form.save
      redirect_to @custom_form, notice: 'Custom form was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /custom_forms/1
  def update
    if @custom_form.update(custom_form_params)
      redirect_to @custom_form, notice: 'Custom form was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /custom_forms/1
  def destroy
    @custom_form.destroy
    redirect_to custom_forms_url, notice: 'Custom form was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_custom_form
      @custom_form = CustomForm.find(params[:id])
    end
    
    def fill_form
        @subCategory = SubCategory.all
    end

    # Only allow a trusted parameter "white list" through.
    def custom_form_params
      params.require(:custom_form).permit(:sub_category_id)
    end
end
