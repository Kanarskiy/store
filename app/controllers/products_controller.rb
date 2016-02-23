class ProductsController < ApplicationController
    before_action :authenticate_customer!
    before_action :set_product, only: [:show, :edit, :update, :destroy]

    # GET /products
    # GET /products.json
    def index
        @products = Product.where('customer_id = ?', current_customer)
    end

    # GET /products/1
    # GET /products/1.json
    def show
    end

    # GET /products/new
    def new
        @customer = Customer.find(current_customer)
        @product = @customer.products.build
    end

    # GET /products/1/edit
    def edit
    end

    # POST /products
    # POST /products.json
    def create
        @customer = Customer.find(current_customer)
        @product = @customer.products.build(product_params)
        # @product = Product.new(product_params)

        respond_to do |format|
            if @product.save
                format.html { redirect_to customer_product_path(current_customer, @product), notice: 'Product was successfully created.' }
                format.json { render :show, status: :created, location: @product }
            else
                format.html { render :new }
                format.json { render json: @product.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /products/1
    # PATCH/PUT /products/1.json
    def update
        respond_to do |format|
            if @product.update(product_params)
                format.html { redirect_to customer_product_path(current_customer, @product), notice: 'Product was successfully updated.' }
                format.json { render :show, status: :ok, location: @product }
            else
                format.html { render :edit }
                format.json { render json: @product.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /products/1
    # DELETE /products/1.json
    def destroy
        @product.destroy
        respond_to do |format|
            format.html { redirect_to customer_products_path(current_customer), notice: 'Product was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
        @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
        params.require(:product).permit(:title, :description, :image, :price)
    end
end
