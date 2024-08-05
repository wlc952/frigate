# syntax=docker/dockerfile:1.6

# https://askubuntu.com/questions/972516/debian-frontend-environment-variable
ARG DEBIAN_FRONTEND=noninteractive

FROM wheels as sophgo-wheels
COPY docker/main/requirements-wheels.txt /requirements-wheels.txt
COPY docker/sophgo/requirements-wheels-sophgo.txt /requirements-wheels-sophgo.txt
RUN sed -i "/https:\/\//d" /requirements-wheels.txt
RUN pip3 wheel --wheel-dir=/sophgo-wheels -c /requirements-wheels.txt -r /requirements-wheels-sophgo.txt

FROM deps AS sophgo-frigate
ARG TARGETARCH

RUN --mount=type=bind,from=sophgo-wheels,source=/sophgo-wheels,target=/deps/sophgo-wheels \
    pip3 install -U /deps/sophgo-wheels/*.whl

WORKDIR /opt/frigate/
COPY --from=rootfs / /
