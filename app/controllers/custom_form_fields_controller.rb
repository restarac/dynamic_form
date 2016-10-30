class CustomFormFieldsController < ApplicationController
  before_action :set_custom_form_field, only: [:edit, :update, :destroy]
  before_action :fill_form, only: [:new, :edit]

  # GET /custom_form_fields/new
  def new
    @custom_form_field = CustomFormField.new
    @custom_form_field.custom_form = CustomForm.find(params[:custom_form_id])
  end

  # GET /custom_form_fields/1/edit
  def edit
  end

  # POST /custom_form_fields
  def create
    @custom_form_field = CustomFormField.new(custom_form_field_params)
    @custom_form_field.custom_form = CustomForm.find(params[:custom_form_id])

    if @custom_form_field.save
      redirect_to new_custom_form_field_path(@custom_form_field.custom_form), notice: 'Custom form field was successfully created.'
    else
      fill_form
      render :new
    end
  end

  # PATCH/PUT /custom_form_fields/1
  def update
    if @custom_form_field.update(custom_form_field_params)
      redirect_to new_custom_form_field_path(@custom_form_field.custom_form), notice: 'Custom form field was successfully updated.'
    else
      fill_form
      render :edit
    end
  end

  # DELETE /custom_form_fields/1
  def destroy
    @custom_form_field.destroy
    redirect_to new_custom_form_field_path(@custom_form_field.custom_form), notice: 'Custom form field was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_custom_form_field
      @custom_form_field = CustomFormField.find(params[:id])
    end
    
    def fill_form
        @type_values = CustomFormField.subclasses.map {|i| [i, i]}
        @fields = CustomFormField.where(custom_form_id: params[:custom_form_id])
    end

    # Only allow a trusted parameter "white list" through.
    def custom_form_field_params
      params.require(@custom_form_field.class.name.underscore.to_sym).permit(:order, :title, :value, :type)
    end
end
