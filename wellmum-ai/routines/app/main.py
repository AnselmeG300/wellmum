import os
from fastapi import FastAPI

app = FastAPI(title="Routines API", version="1.0.0")


@app.get("/healthz")
def healthz():
    """Health check endpoint"""
    return {"status": "ok", "service": "routines"}

@app.get("/")
def root():
    """Root endpoint"""
    return {"service": "routines", "status": "running", "version": "1.0.0"}
