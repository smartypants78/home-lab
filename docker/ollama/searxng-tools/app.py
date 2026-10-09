from fastapi import FastAPI
import requests

app = FastAPI(
    title="SearXNG Search Tools",
    version="1.0.0"
)

@app.get(
    "/search",
    operation_id="web_search",
    summary="Search the web using SearXNG"
)
def search(query: str):
    response = requests.get(
        "http://searxng:8080/search",
        params={
            "q": query,
            "format": "json"
        },
        timeout=30
    )

    result = response.json()

    return {
        "query": query,
        "results": [
            {
                "title": item.get("title"),
                "url": item.get("url"),
                "content": item.get("content")
            }
            for item in result.get("results", [])[:5]
        ]
    }