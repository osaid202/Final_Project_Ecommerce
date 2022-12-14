class ProductsController < InheritedResources::Base

  private

    def product_params
      params.require(:product).permit(:name, :price, :stock)
    end

end
