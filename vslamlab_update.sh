
#!/bin/bash
set -e 
#sudo /sbin/swapoff -a && sudo /sbin/swapon -a

export CF_CUDA_ENABLED=True

PKG_NAMES=( 
  "orbslam2-vslamlab"   
  "orbslam3-vslamlab" 
  "okvis2-vslamlab" 
  "droidslam-vslamlab" 
  "dpvo-vslamlab" 
  "mast3rslam-vslamlab"
  "anyfeature-vslamlab" 
  "monogs-vslamlab" 
)

REPO_DIRS=( 
  "ORB-SLAM2-VSLAM-LAB" 
  "ORB-SLAM3-VSLAM-LAB"
  "OKVIS2-VSLAM-LAB" 
  "DROID-SLAM-VSLAM-LAB"
  "DPVO-VSLAM-LAB" 
  "MASt3R-SLAM-VSLAM-LAB" 
  "ANYFEATURE-VSLAM-LAB" 
  "MonoGS-VSLAM-LAB"
)

PKG_NAMES=( "${PKG_NAMES[-1]}" )
REPO_DIRS=( "${REPO_DIRS[-1]}" )

for i in "${!PKG_NAMES[@]}"; do
  CONDA_PKG_NAME="${PKG_NAMES[$i]}"
  BASELINE_REPO_DIR="${REPO_DIRS[$i]}"

  echo "###### Processing: ${BASELINE_REPO_DIR} -> ${CONDA_PKG_NAME} #############"
  
  cd "${BASELINE_REPO_DIR}"

  if [ -d "output" ]; then
    rm -rf output
  fi

  rattler-build build -m ../conda_build_config.yaml -c https://prefix.dev/conda-forge -c fontan 
  #rattler-build build -m ../conda_build_config.yaml -c fontan  -c https://prefix.dev/conda-forge 

  binstar upload -p "${CONDA_PKG_NAME}" output/linux-64/*.conda*
  
  cd ..
  sudo /sbin/swapoff -a && sudo /sbin/swapon -a
done