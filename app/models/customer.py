from app.database import Base
from sqlalchemy.orm import Mapped, mapped_column, relationship
from app.models.common  import intpk, str_250, str_500, create_at

class CustomerModel(Base):
    __tablename__ = 'customers'

    __table_args__ = {
        'comment': 'Клиенты'
    }

    id: Mapped[intpk]
    name: Mapped[str_250] = mapped_column(comment='ФИО или название организации')
    address: Mapped[str_500] = mapped_column(comment='Адрес клиента')
    create_at: Mapped[create_at]
    orders: Mapped["CustomerModel"] = relationship("OrderModel", back_populates="customer")
