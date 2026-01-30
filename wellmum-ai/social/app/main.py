import os
from fastapi import FastAPI

app = FastAPI(title="Social API", version="1.0.0")

@app.get("/healthz")
def healthz():
    """Health check endpoint"""
    return {"status": "ok", "service": "social"}

@app.get("/")
def root():
    """Root endpoint"""
    return {"service": "social", "status": "running", "version": "1.0.0"}
