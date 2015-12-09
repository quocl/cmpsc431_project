class SuppliersController < ApplicationController

  def new
	@users = User.all
	@supplier = Supplier.new
	@addresses = nil
  end


  # GET /supplieres/1/edit
  def edit
  	@supplier = Supplier.find(params[:id])
  	@users = User.all
  	@addresses = nil
  end

  # POST /suppliers
  # POST /suppliers.json
  def create
    @supplier = Supplier.new(supplier_params)
    respond_to do |format|
      if @supplier.save
        format.html { redirect_to profile_url, notice: 'Supplier was successfully registered.' }
        format.json { render :show, status: :created, location: profile_url }
      else
        @addresses = nil
        format.html { render :new }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supplieres/1
  # PATCH/PUT /supplieres/1.json
  def update
  	@supplier = Supplier.find(params[:id])
    respond_to do |format|
      if @supplier.update(supplier_params)
        format.html { redirect_to profile_url, notice: 'Supplier was successfully updated.' }
        format.json { render :show, status: :ok, location: profile_url }
      else
        @addresses = nil
        format.html { render :edit }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supplieres/1
  # DELETE /supplieres/1.json
  def destroy
  	@supplier = Supplier.find(params[:id])
    @supplier.destroy
    respond_to do |format|
      format.html { redirect_to profile_url, notice: 'Supplier was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_address
    @addresses = User.find(params[:usr_id]).addresses
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supplier_params
      params.require(:supplier).permit(:user_id, :name, :address_id, :point_of_contact, :phone_number, :company_category, :revenue)
  	end

end
