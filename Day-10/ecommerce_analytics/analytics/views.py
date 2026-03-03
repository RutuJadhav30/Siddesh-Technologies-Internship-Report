from rest_framework.decorators import api_view
from rest_framework.response import Response
from .models import OrderItem
import numpy as np


@api_view(['GET'])
def dashboard_analytics(request):
    items = OrderItem.objects.all()

    revenues = []
    quantities = []

    for item in items:
        revenue = item.product.price * item.quantity
        revenues.append(revenue)
        quantities.append(item.quantity)

    total_revenue = float(np.sum(revenues)) if revenues else 0
    total_orders = items.count()
    average_order_value = float(np.mean(revenues)) if revenues else 0
    total_products_sold = int(np.sum(quantities)) if quantities else 0

    data = {
        "total_revenue": total_revenue,
        "total_orders": total_orders,
        "average_order_value": average_order_value,
        "total_products_sold": total_products_sold
    }

    return Response(data)