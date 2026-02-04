from datetime import datetime
from typing import Annotated
from pydantic import BaseModel, Field


class CreateProductInOrderSchema(BaseModel):
    order_id: Annotated[int, Field(description="Идентификатор заказа")]
    product_id: Annotated[int, Field(description="Идентификатор продукта")]
    count: Annotated[int, Field(description="Количество продукта", ge=1)]

class ProductInOrderSchema(BaseModel):
    order_id: int
    product_id: int
    create_at : datetime
