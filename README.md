# Python Application

This Python image is a very thin wrapper around the default Python image (https://hub.docker.com/_/python/). The wrapping is done to make it work with the [Nerd CLI](https://www.nerdalize.com/docs/basics/installing-cli/). For a step-by-step guide on how to do this, see https://www.nerdalize.com/applications/python.

## How does it work?

Both images take the respective official Python image as a base.
To support both Python2 and Python3 we created two images. The image names are:
* nerdalize/pythonapp:v2
* nerdalize/pythonapp:v3

Upon execution the container will do a `pip install` if it finds the file `/input/requirements.txt` (note that `/input` is the folder that contains the contents of the input dataset).

It will then run the Python script in `/input` that was given as an argument via `nerd task create` (e.g. `nerd task create <workload-id> -- main.py` will run `/input/main.py`).

Any files written to the folder `/output` can as usual be downloaded after execution using `nerd dataset download <output-id>`.
