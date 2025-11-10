from typing import List
from pydantic import BaseModel

class Movie(BaseModel):
    title: str
    year: int

def get_movies() -> List[Movie]:
    return [
        Movie(title="The Matrix", year=1999),
        Movie(title="Inception", year=2010),
        Movie(title="Interstellar", year=2014),
    ]
