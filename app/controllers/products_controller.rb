class ProductsController < InheritedResources::Base
  def index
    @products = Product.order(:created_at).page(params[:page])
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :stock)
  end
end
