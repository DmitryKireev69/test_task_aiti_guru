from fastapi import APIRouter, Depends, status, HTTPException
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select
from app.database import get_db_async_db
from app.schemas.product import CreateProductInOrderSchema, ProductInOrderSchema
from app.models import OrderModel, ProductModel, OrderProductModel

router = APIRouter(
    prefix="/products",
    tags=["Продукты"],
)

@router.post("",summary='Добавить продукт в заказ', status_code=status.HTTP_201_CREATED, response_model=ProductInOrderSchema)
async def create_product_in_order(data: CreateProductInOrderSchema, db: AsyncSession = Depends(get_db_async_db)):
    """Добавление продукта в заказ"""
    data_product = data.model_dump()
    order_id = data_product.get('order_id')
    product_id = data_product.get('product_id')
    count = data_product.get('count')

    result = await db.scalars(select(OrderModel).filter_by(id=order_id))
    order = result.one_or_none()

    if not order:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Заказ с ID {order_id} не найден!"
        )
    order_status = ''.join(order.status)
    if order.status != 'ожидает':
        raise HTTPException(
            status_code=status.HTTP_406_NOT_ACCEPTABLE,
            detail=f'Заказ с ID {order_id} в статусе {order_status}!'
        )

    res = await db.scalars(select(ProductModel).filter_by(id=product_id))
    product = res.one_or_none()
    if product is None:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Продукт с ID {product_id} не найден!"
        )

    result = await db.scalars(select(OrderProductModel).filter_by(product_id=product_id, order_id=order_id))
    order_product = result.one_or_none()
    if order_product:
        product.count += count
        await db.commit()
    else:
        order_product = OrderProductModel(order_id=order_id, product_id=product_id)
        db.add(order_product)
        await db.commit()
    return order_product
