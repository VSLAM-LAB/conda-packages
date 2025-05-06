<p align="center">

<h1 align="center">
  <img src="docs/favicon_2.ico" alt="VSLAM-LAB Logo" width="30" 
       style="vertical-align: middle; position: relative; top: -10px; margin-right: 10px;">
  <span style="font-size: 2em; font-weight: bold;">Conda Packages</span>
</h1>

## Getting Started
```bash
pixi global install anaconda-client
```

```bash
pixi global install rattler-build
```

```bash
export CF_CUDA_ENABLED=True
```

```bash
rattler-build build -m ../conda_build_config.yaml -c conda-forge -c fontan 
```

```bash
binstar upload -p droidslam output/linux-64/*.conda*
```

```bash
binstar upload -p moderngl-window output/noarch/*.cond
```

