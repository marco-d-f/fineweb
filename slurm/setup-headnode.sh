#!/bin/bash
set -e

USER_NAME="ubuntu"
USER_HOME="/home/${USER_NAME}"
REPO_URL="https://github.com/marco-d-f/fineweb.git"
PROJECT_DIR="${USER_HOME}/fineweb"

sudo -u ${USER_NAME} bash -c 'curl -LsSf https://astral.sh/uv/install.sh | sh'

UV_BIN="${USER_HOME}/.local/bin/uv"

# Clone repository if not already present
if [ ! -d "${PROJECT_DIR}" ]; then
  sudo -u ${USER_NAME} git clone "${REPO_URL}" "${PROJECT_DIR}"
fi

# Sync virtual environment
if [ -f "${PROJECT_DIR}/pyproject.toml" ]; then
  sudo -u ${USER_NAME} bash -c "cd ${PROJECT_DIR} && ${UV_BIN} sync"
fi

sudo -u ${USER_NAME} mkdir -p "${PROJECT_DIR}/logs"