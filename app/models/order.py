from app.database import Base
from sqlalchemy.orm import Mapped, validates, relationship,mapped_column
from app.models.common import intpk, create_at
from enum import Enum
from sqlalchemy import ForeignKey


class OrderStatus(str, Enum):
    PENDING = 'ожидает'
    COMPLETED = 'выполнен'
    CANCELLED = 'отменен'


class OrderModel(Base):
    __tablename__ = 'orders'

    __table_args__ = {
        'comment': 'Заказы'
    }

    id: Mapped[intpk]
    status: Mapped[OrderStatus] = mapped_column(
        default=OrderStatus.PENDING,
        comment='Статус заказа: pending - ожидает, completed - выполнен, cancelled - отменен'
    )
    customer_id: Mapped[int] = mapped_column(
        ForeignKey('customers.id'),
        comment='идентификатор клиента'
    )
    create_at: Mapped[create_at]
    customer: Mapped["CustomerModel"] = relationship("CustomerModel", back_populates="orders")
    products: Mapped[list["ProductModel"]] = relationship(
        "ProductModel",
        secondary="orders_products",
        back_populates="orders",
        viewonly=True,
    )
    order_products: Mapped[list["OrderProductModel"]] = relationship(
        back_populates="order",
        cascade="all, delete-orphan",
        single_parent=True,
    )

    @validates('status')
    def validate_status(self, key, status):
        allowed = {'pending', 'completed', 'cancelled'}
        if status not in allowed:
            raise ValueError(f"Статус не может быть {allowed}")
        return status
