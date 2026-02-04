from sqlalchemy import ForeignKey

from app.database import Base
from sqlalchemy.orm import Mapped, mapped_column, relationship
from app.models.common import intpk, str_250, create_at

class CategoryModel(Base):
    __tablename__ = 'categories'

    __table_args__ = {
        'comment': 'Категории товаров'
    }

    id: Mapped[intpk]
    name: Mapped[str_250] = mapped_column(comment='Название категории')
    parent_id: Mapped[int | None] = mapped_column(
        ForeignKey('categories.id'),
        comment='Идентификатор родительской категории'
    )
    create_at: Mapped[create_at]

    parent: Mapped["CategoryModel | None"] = relationship(
        "CategoryModel",
        back_populates="children",
        remote_side="CategoryModel.id"
    )
    children: Mapped[list["CategoryModel"]] = relationship(
        "CategoryModel",
         back_populates="parent"
    )
    products: Mapped[list['ProductModel']] = relationship("ProductModel", back_populates="category")
