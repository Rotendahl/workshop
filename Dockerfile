FROM python:3.8

WORKDIR /app

COPY pyproject.toml  pyproject.toml
COPY poetry.lock poetry.lock

ENV POETRY_VIRTUALENVS_CREATE false

RUN pip install --upgrade pip \
    && pip install poetry \
    && poetry install

EXPOSE 8888

COPY . /app


CMD jupyter notebook --ip 0.0.0.0 --no-browser --allow-root