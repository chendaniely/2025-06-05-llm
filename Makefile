
.PHONY: preview
preview:
	quarto preview

.PHONY: setup-python
setup-python:
	uv venv venv
	source venv/bin/activate && uv pip install -r requirements.txt

.PHONY: setup-r
setup-r:
	Rscript -e "if (!require(renv, quietly = TRUE)) install.packages('renv'); renv::restore()"

.PHONY: setup
setup:
	make setup-python
	make setup-r

.PHONY: clean
clean:
	rm -rf venv
	rm -rf renv/library
