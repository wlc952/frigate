# syntax=docker/dockerfile:1.6

# https://askubuntu.com/questions/972516/debian-frontend-environment-variable
ARG DEBIAN_FRONTEND=noninteractive

# Frigate final container
FROM deps AS sophgo-frigate
ARG TARGETARCH

WORKDIR /opt/frigate/
COPY --from=rootfs / /

RUN curl -L -o sophon_arm-3.7.0-py3-none-any.whl https://github.com/wlc952/frigate_in_sophgo_bm1684x/raw/main/sophon_arm-3.7.0-py3-none-any.whl

RUN pip3 install sophon_arm-3.7.0-py3-none-any.whl

RUN rm sophon_arm-3.7.0-py3-none-any.whl