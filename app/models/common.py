from datetime import datetime
from typing import Annotated
from sqlalchemy.orm import mapped_column
from sqlalchemy import String, func

intpk = Annotated[int, mapped_column(primary_key=True, index=True, comment="Уникальный идентификатор")]
str_250 = Annotated[str, String(250)]
str_500 = Annotated[str, String(500)]
create_at = Annotated[datetime, mapped_column(server_default=func.current_timestamp(), comment='Дата создания')]
