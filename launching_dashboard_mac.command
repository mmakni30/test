#!/bin/bash
cd "$(dirname "$0")"
source venv/bin/activate  # Activate the virtual environment if it exists
python dashboard_generator_vizro/main.py
