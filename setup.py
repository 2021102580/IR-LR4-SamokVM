from setuptools import setup, find_packages

setup(
	name="math_utils",
	version="0.1.0",
	packages=find_packages("src"),
	package_dir={"": "src"},
	description="Simple statistics utilities",
	python_requires=">=3.10",
	install_requires=[],
)