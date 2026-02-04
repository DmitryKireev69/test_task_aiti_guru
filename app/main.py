from fastapi import FastAPI
from app.routers import product
app = FastAPI(
    title='API для системы управления заказами'
)

app.include_router(product.router)

@app.get("/")
def root():
    return {"message": "Добро пожаловать"}
