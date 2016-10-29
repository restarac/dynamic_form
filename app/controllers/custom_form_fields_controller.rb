class CustomFormFieldsController < ApplicationController
  before_action :set_custom_form_field, only: [:show, :edit, :update, :destroy]

  # GET /custom_form_fields
  def index
    @custom_form_fields = CustomFormField.all
  end

  # GET /custom_form_fields/1
  def show
  end

  # GET /custom_form_fields/new
  def new
    @custom_form_field = CustomFormField.new
  end

  # GET /custom_form_fields/1/edit
  def edit
  end

  # POST /custom_form_fields
  def create
    @custom_form_field = CustomFormField.new(custom_form_field_params)

    if @custom_form_field.save
      redirect_to @custom_form_field, notice: 'Custom form field was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /custom_form_fields/1
  def update
    if @custom_form_field.update(custom_form_field_params)
      redirect_to @custom_form_field, notice: 'Custom form field was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /custom_form_fields/1
  def destroy
    @custom_form_field.destroy
    redirect_to custom_form_fields_url, notice: 'Custom form field was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_custom_form_field
      @custom_form_field = CustomFormField.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def custom_form_field_params
      params.require(:custom_form_field).permit(:custom_form_id, :order, :title, :value, :type)
    end
end
