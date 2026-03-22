FROM monkcase/cai:ide-workspace-term-v0.0.1

ARG DOCKER_GID

USER root

RUN set -eux; \
    GROUP_NAME="$(getent group "${DOCKER_GID}" | cut -d: -f1 || true)"; \
    if [ -z "${GROUP_NAME}" ]; then \
        GROUP_NAME=dockerhost; \
        groupadd -g "${DOCKER_GID}" "${GROUP_NAME}"; \
    fi; \
    usermod -aG "${GROUP_NAME}" dev


USER dev

