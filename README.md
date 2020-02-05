# Face Recognition Vendor Test (FRVT) Validation Packages
This repository contains validation packages for all FRVT Ongoing evaluation tracks.
We recommend developers clone the entire repository and run validation from within
the folder that corresponds to the evaluation of interest.  The ./common directory
contains files that are shared across all validation packages.

## Installation with docker
Install the environment (Centos) and build the null implementation (11, 1N, morph, quality) with `docker-compose build`

## Run validation for each null implementation

For each null implementation, validation can be run as

```
docker-compose run 11 ./run_validate_11.sh
docker-compose run 1N ./run_validate_1N.sh
docker-compose run morph ./run_validate_morph.sh
docker-compose run quality ./run_validate_quality.sh
```

It will generate the report in artifacts directory

