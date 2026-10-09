from fastapi import FastAPI
import requests

app = FastAPI(
    title="SearXNG Search Tools",
    version="1.0.0"
)

@app.get(
    "/search",
    operation_id="web_search",
    summary="Search the web"
)
def search(query: str):
    r = requests.get(
        "http://searxng:8080/search",
        params={
            "q": query,
            "format": "json"
        },
        timeout=30
    )

    data = r.json()

    return {
        "results": [
            {
                "title": r["title"],
                "url": r["url"],
                "content": r["content"]
            }
            for r in result["results"][:5]
        ]
    }