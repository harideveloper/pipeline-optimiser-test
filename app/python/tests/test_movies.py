from fastapi.testclient import TestClient
from src.main import app

client = TestClient(app)

def test_read_movies():
    response = client.get("/movies")
    assert response.status_code == 200
    data = response.json()
    assert isinstance(data, list)
    assert len(data) == 3
    assert data[0]["title"] == "The Matrix"
