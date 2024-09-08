.PHONY: clean coverage help pre-commit-install pre-commit-checks commit

VENV_DIR = venv
PYTHON = python3
all: venv

.DEFAULT_GOAL := help

define PRINT_HELP_PYSCRIPT
import re, sys

for line in sys.stdin:
	match = re.match(r'^([a-zA-Z_-]+):.*?## (.*)$$', line)
	if match:
		target, help = match.groups()
		print("%-20s %s" % (target, help))
endef
export PRINT_HELP_PYSCRIPT

BROWSER := python -c "$$BROWSER_PYSCRIPT"

help:
	@python -c "$$PRINT_HELP_PYSCRIPT" < $(MAKEFILE_LIST)


# Target to create the virtual environment only if it doesn't already exist
venv: $(VENV_DIR)/bin/activate

# Create the virtual environment
$(VENV_DIR)/bin/activate:
	@echo "Creating virtual environment..."
	$(PYTHON) -m venv $(VENV_DIR)
	@echo "Virtual environment created."

# Install dependencies
install: venv requirements/requirements_prod.txt requirements/requirements_dev.txt
	@echo "Installing dependencies..."
	$(VENV_DIR)/bin/pip install -r requirements/requirements_prod.txt
	$(VENV_DIR)/bin/pip install -r requirements/requirements_dev.txt
	@echo "Dependencies installed."

.PHONY: run
run:
	@echo "Activating the venv..."
	$(VENV_DIR)/bin/python dashboard_generator_vizro/main.py


clean:
	rm -rf  $(VENV_DIR)
	rm -rf  .mypy_cache
	rm -rf  .ruff_cache
	rm -rf  .pytest_cache
	rm -rf  	dist
	rm -rf  ./**/__pycache__



pre-commit-install: ## install pre-commit hooks
	pre-commit install


pre-commit-checks: pre-commit-install ## check style
	pre-commit run --all-files

test: ## run tests quickly with the default Python
	pytest

commit: # make commitizen commit
	cz commit

#create-venv:
#	python3 -m venv venv
#
#activate-venv: create-venv
#	. venv/bin/activate
#
#install: activate-venv ## install the package to the active Python's site-packages
#	pip install -r requirements/requirements_prod.txt
#
#install-dev: activate-venv ## install the package to the active Python's site-packages
#	pip install -r requirements/requirements_prod.txt
#	pip install -r requirements/requirements_dev.txt
