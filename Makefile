
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

.PHONY: setup-quarto
setup-quarto:
	cd website && quarto add coatless-quarto/embedio

.PHONY: setup
setup:
	make setup-python
	make setup-r
	make setup-quarto

.PHONY: clean
clean:
	rm -rf venv
	rm -rf renv/library

.PHONY: publish
publish:
	quarto publish gh-pages website
