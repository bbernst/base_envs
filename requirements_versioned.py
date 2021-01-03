from pathlib import Path

import fire
import pandas as pd
from pip._internal.operations import freeze


def run(repo: str) -> None:
    PARENT_PATHS = {p.stem: p for p in Path(__file__).resolve().parents}
    BASE_ENV_PATH = PARENT_PATHS[repo]
    REQ_PATH = BASE_ENV_PATH / 'requirements.txt'
    REQ_V_PATH = BASE_ENV_PATH / 'requirements_versioned.txt'

    named_reqs = (
        pd.read_csv(REQ_PATH, names=['req_orig'])
        .assign(req=lambda d: d['req_orig'].str.split('[').str[0])
        # ^^ split on [ since some packages have [all] trailing the name
    )
    pip_freeze = (
        pd.DataFrame(freeze.freeze(), columns=['req_full'])
        .assign(req=lambda d: d['req_full'].str.split('==').str[0],
                ver=lambda d: d['req_full'].str.split('==').str[1]
                )
    )
    df = (
        pd.merge(named_reqs, pip_freeze, how='left', on='req')
        .loc[:, ['req_full']]
    )
    df.to_csv(REQ_V_PATH, index=False, header=False)


if __name__ == "__main__":
    fire.Fire(run)
