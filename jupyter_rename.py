import json
from pathlib import Path

import fire


def rename(repo: str, name: str) -> None:
    PARENT_PATHS = {p.stem: p for p in Path(__file__).resolve().parents}
    BASE_ENV_PATH = PARENT_PATHS[repo]
    JUPYTER_PATH = BASE_ENV_PATH / f'Envs/{name}/share/jupyter/kernels/python3/kernel.json'

    with open(JUPYTER_PATH) as f:
        data = json.load(f)

    data['display_name'] = f'Python 3 ({name})'

    with open(JUPYTER_PATH, 'w') as f:
        json.dump(data, f)


if __name__ == "__main__":
    fire.Fire(rename)
