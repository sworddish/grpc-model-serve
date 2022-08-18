# gRPC Packaged template with Basic Image Classification

## About this Repository

This template was adpated from [Open Source Basic Image Classification model](https://github.com/modzy/packaged-basic-image-classification) by modzy with a few addon:

- Protobuf struct test 
  - oneof
- Image io test 
  - bytes VS base64 string
- Utils for image preprocessing
  - blur detection through fft

### gRPC and Modzy Container Specification

This is a gRPC + HTTP/2 implementation of the [Open Source Basic Image Classification model](https://github.com/modzy/packaged-basic-image-classification) and is derived from Modzy's [gRPC Python Model Template](https://github.com/modzy/grpc-model-template).

## Usage

All different methods of testing the gRPC template specification can be found in the [Usage section](https://github.com/modzy/grpc-model-template#Usage) of the gRPC Python Model Template.  

The following usage instructions demonstrate how to build the container image, run the container, open a shell inside the container, and run a test using the `grpc_model.src.model_client` module.

#### Build and run the container

From the parent directory of this repository, build the container image.

```docker build -t grpc-model-serve .```

Run the container interactively.

```docker run -it grpc-model-serve:latest```

or if you want mount local dir for development effciency

```docker run -it -d --mount type=bind,source=$(pwd),target=/opt/app grpc-model-serve:latest```

#### Run a test inside the container

Open a different terminal, use `docker ps` to extract your running container ID, and open up a shell inside the container.

```docker exec -it <container-id> bash```

In the shell, submit a test using python (installed inside the container) and the grpc_model.src.model_client module

```python -m grpc_model.src.model_server```

You can run some simple test 

``` python -m grpc_model.src.model_client_test```

## Additional Resources

### Managing Dependencies Via a Virtual Environment


### Initializing Pre-Commit Hooks

This repository uses pre-commit hooks in order to assist you in maintaining a uniform and idiomatic code style.
If this is your first time using pre-commit hooks you can install the framework [here](https://pre-commit.com/#installation).
Once pre-commit is installed, all you need to do is execute the following command from the repository root:
```
pre-commit install
```

If you want to execute the pre-commit hooks at a time other than during the actual git commit, you can run:
```
pre-commit run --all-files
```


### Exporting current dependencies when ready to release


### Compiling the protocol buffers (WARNING: only intended for template authors)

```
./scripts/compile_protocol_buffers.sh
```

