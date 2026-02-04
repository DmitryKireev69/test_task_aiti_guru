from sqlalchemy import ForeignKey
from app.database import Base
from sqlalchemy.orm import Mapped, relationship, mapped_column
from app.models.common  import create_at

class OrderProductModel(Base):
    __tablename__ = 'orders_products'

    order_id: Mapped[int] = mapped_column(ForeignKey("orders.id"), primary_key=True)
    product_id: Mapped[int] = mapped_column(ForeignKey("products.id"), primary_key=True)
    create_at: Mapped[create_at]
    order: Mapped["OrderModel"] = relationship(back_populates="order_products")
    product: Mapped["ProductModel"] = relationship(back_populates="order_products")
