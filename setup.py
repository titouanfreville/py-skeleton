from setuptools import find_packages, setup

setup(
    version="1.0.0",
    packages=find_packages(),
    include_package_data=True,
    zip_safe=False,
    install_requires=[
        "pydantic",
        "regex",
        "sqlalchemy",
        "sqlalchemy_utils",
        "stringcase",
    ],
    extras_require={
        "dev": [
            "black",
            "bandit",
            "coverage",
            "elmock",
            "faker",
            "flake8",
            "freezegun",
            "isort",
            "mypy",
            "pytest",
            "yoyo-migrations",
        ],
    },
)
