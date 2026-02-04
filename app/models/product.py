from app.database import Base
from sqlalchemy.orm import Mapped, mapped_column, relationship, validates
from app.models.common import intpk, str_250, str_500, create_at
from decimal import Decimal
from sqlalchemy import Numeric, ForeignKey

class ProductModel(Base):
    __tablename__ = 'products'

    __table_args__ = {
        'comment': 'Продукты'
    }

    id: Mapped[intpk]
    name: Mapped[str_250] = mapped_column(comment='Название товара')
    title: Mapped[str_500 | None] = mapped_column(comment='Описание товара')
    count: Mapped[int] = mapped_column(comment='Количество товара')
    price: Mapped[Decimal] = mapped_column(Numeric(10,2), comment='Цена товара')
    category_id: Mapped[int] = mapped_column(ForeignKey('categories.id'), comment='Идентификатор категории')
    category: Mapped['CategoryModel'] = relationship('CategoryModel', back_populates='products')
    create_at: Mapped[create_at]
    orders: Mapped[list["OrderModel"]] = relationship(
        "OrderModel",
        secondary="orders_products",
        back_populates="products",
        viewonly=True,
    )
    order_products: Mapped[list["OrderProductModel"]] = relationship(
        back_populates="product",
        cascade="all, delete-orphan",
        single_parent=True,
    )

    @validates('count')
    def validate_count(self, key, count):
        if count < 0:
            raise ValueError(f"Количество не может быть меньше 0")
        return count

    @validates('price')
    def validate_price(self, key, price):
        if price < 0:
            raise ValueError(f"Цена не может быть отрицательной")
        return price
