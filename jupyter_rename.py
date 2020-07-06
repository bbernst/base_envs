import json
import fire


def rename(name: str):
    RELATIVE_PATH = f'Envs/{name}/share/jupyter/kernels/python3/kernel.json'
    with open(RELATIVE_PATH) as f:
        data = json.load(f)
    print(data)
    data['display_name'] = f'Python 3 ({name})'

    with open(RELATIVE_PATH, 'w') as f:
        json.dump(data, f)
    print(data)


if __name__ == "__main__":
    fire.Fire(rename)
