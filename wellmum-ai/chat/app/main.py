import os
from fastapi import FastAPI

app = FastAPI(title="Chat API", version="1.0.0")

@app.get("/healthz")
def healthz():
    """Health check endpoint"""
    return {"status": "ok", "service": "chat"}

@app.get("/")
def root():
    """Root endpoint"""
    return {"service": "chat", "status": "running", "version": "1.0.0"}
