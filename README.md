# Windows Terminal Configuration

This is my personal configuration files for
[Windows Terminal](https://docs.microsoft.com/en-us/windows/terminal/).


## Usage

Run `./apply_config.sh`.

Or if you want to do things manually, copy `settings.json` to
`%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe
\LocalState\settings.json` per the instructions in [the
documentation](https://docs.microsoft.com/en-us/windows/terminal/install#settings-json-file).


## Development

Development requires Python 3.8 or higher, and only because we run
[pre-commit](https://pre-commit.com/).

1.  Clone the repo.
2.  Create a virtual environment: `python -m venv .venv`
3.  Activate it: `. .venv/bin/activate`
4.  Install requirements: `pip install -U pip setuptools wheel -r requirements.txt`
5.  Install pre-commit hooks: `pre-commit install`
6.  Make your changes.
