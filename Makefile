.PHONY: setup build activate install test style bumpver bumpver-minor

print:
	echo $(SHELL)

all: setup install test

setup:
	pip install uv
	uv venv

build:
	uv build

activate:
	. .venv/bin/activate

install:
	uv sync

test:
	uv run pytest -vrxP ./tests

style:
	uv run pre-commit run --all-files

bumpver:
	uv run python -m bumpver update -n --patch

bumpver-minor:
	uv run python -m bumpver update -n
