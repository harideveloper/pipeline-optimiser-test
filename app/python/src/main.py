from fastapi import FastAPI
from movies import get_movies

app = FastAPI()

@app.get("/movies")
def read_movies():
    return get_movies()
