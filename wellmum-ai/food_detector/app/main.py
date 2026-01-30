import os
from fastapi import FastAPI

app = FastAPI(title="Food Detector API", version="1.0.0")


@app.get("/healthz")
def healthz():
    """Health check endpoint"""
    return {"status": "ok", "service": "food_detector"}

@app.get("/")
def root():
    """Root endpoint"""
    return {"service": "food_detector", "status": "running", "version": "1.0.0"}
