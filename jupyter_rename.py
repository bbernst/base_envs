import json
import fire
from pathlib import Path


def rename(name: str):
    PARENT_PATHS = {p.stem: p for p in Path(__file__).resolve().parents}
    BASE_ENV_PATH = PARENT_PATHS['base_envs']
    JUPYTER_PATH = BASE_ENV_PATH / f'Envs/{name}/share/jupyter/kernels/python3/kernel.json'

    with open(JUPYTER_PATH) as f:
        data = json.load(f)

    data['display_name'] = f'Python 3 ({name})'
    print(f"Jupyter Notebook display_name: {data['display_name']}")

    with open(JUPYTER_PATH, 'w') as f:
        json.dump(data, f)


if __name__ == "__main__":
    fire.Fire(rename)
