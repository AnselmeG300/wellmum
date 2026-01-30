import os
from fastapi import FastAPI

app = FastAPI(title="Nutrition API", version="1.0.0")

@app.get("/healthz")
def healthz():
    """Health check endpoint"""
    return {"status": "ok", "service": "nutrition"}

@app.get("/")
def root():
    """Root endpoint"""
    return {"service": "nutrition", "status": "running", "version": "1.0.0"}
