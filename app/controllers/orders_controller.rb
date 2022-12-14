class OrdersController < InheritedResources::Base

  private

    def order_params
      params.require(:order).permit(:date, :price, :quantity, :customer_id)
    end

end
