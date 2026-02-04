import pytest_asyncio

from pathlib import Path
from httpx import AsyncClient, ASGITransport
from app.main import app
from sqlalchemy.ext.asyncio import create_async_engine
from app.database import Base
from app.conf import settings
from sqlalchemy import text

@pytest_asyncio.fixture(scope="session")
async def client():
    """Клиент для тестов"""
    async with AsyncClient(
            transport=ASGITransport(app=app),
            base_url="http://test"
    ) as client:
        yield client

@pytest_asyncio.fixture(scope="session", autouse=True)
async def setup_db():
    """Настройка тестовой БД"""

    assert settings.Mode == 'Test'

    engine = create_async_engine(settings.get_url_async_postgres)
    async with engine.begin() as conn:
        await conn.run_sync(Base.metadata.drop_all)
        await conn.run_sync(Base.metadata.create_all)

    sql_file = Path("app/sql/create_data.sql")

    if sql_file.exists():
        async with engine.begin() as conn:
            sql_content = sql_file.read_text(encoding='utf-8')

            statements = [
                stmt.strip() for stmt in sql_content.split(';')
                if stmt.strip() and not stmt.strip().startswith('--')
            ]

            for i, statement in enumerate(statements, 1):
                if statement:
                    await conn.execute(text(statement))
    else:
        print(f"⚠️  Файл {sql_file} не найден!")
    yield

    async with engine.begin() as conn:
        await conn.run_sync(Base.metadata.drop_all)
