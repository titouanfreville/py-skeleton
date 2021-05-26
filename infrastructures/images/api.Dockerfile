FROM python:3.9-slim

ENV WORKDIR /home/todo
WORKDIR ${WORKDIR}

RUN apt-get update && apt-get install -y --no-install-recommends gcc

COPY setup.py ${WORKDIR}/setup.py

RUN pip install .

COPY .env ${WORKDIR}/.env
COPY config.ini ${WORKDIR}/config.ini
COPY main.py ${WORKDIR}/main.py

ENTRYPOINT [ "python" ]
CMD [ "main.py" ]