# runner
FROM python:3.13.0b1-alpine3.19

# copy all files from current directory
COPY . .

# grant the permission rights from The Emperor
RUN chmod 777 ./*.*

# run unittests

RUN python -m unittest test_*.py

ENTRYPOINT ./main.py