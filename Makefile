clean-pyc:
	find . -type f -name '*.pyc' -exec rm -f {} +
	find . -type f -name '*.pyo' -exec rm -f {} +
	find . -type f -name '*.~' -exec rm -f {} +
	find . -type d -name '__pycache__' -exec rm -rf {} +

pep8:
	flake8 src tests

pylint: pep8
	bash tools/scripts/ci.sh

test: # pylint
	py.test tests -sv

tag:
	@t=`python setup.py --version`;\
	echo v$$t; git tag v$$t
