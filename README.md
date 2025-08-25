# CS2310 Notebook Environment

## Launch Binder

Click the badge below to launch:

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/dive4dec/cs2310nb/HEAD)

This Binder environment launches a Jupyter Notebook server using the custom Docker image `chungc/cs2310nb`.

## Installation

### Prerequisites

Before installing, ensure you have the following prerequisites installed:
- [Conda](https://conda.io/projects/conda/en/latest/user-guide/install/index.html) (Miniconda or Anaconda)
- Git and Make (can be installed in the base environment using):
  ```bash
  conda install -n base git make
  ```

### Installation Steps

1. Clone the repository (if not already done):
```bash
git clone https://github.com/dive4dec/cs2310nb.git
cd cs2310nb
```

2. Run the following command in the project directory:
```bash
make install
```

This will:
- Create or update the conda environment `cs2310nb`
- Copy necessary environment configuration files
- Set up environment variables for the notebook environment

### Using the Environment

To activate the environment:
```bash
conda activate cs2310nb
```

Once activated, you can start JupyterLab with:
```bash
jupyter lab
```

To deactivate the environment when you're done:
```bash
conda deactivate
```
