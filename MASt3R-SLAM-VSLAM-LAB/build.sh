
set -e

pip install thirdparty/mast3r/asmk --no-deps --no-build-isolation
pip install -e thirdparty/mast3r --no-build-isolation
cd ./thirdparty/in3d/thirdparty/pyimgui
python setup.py build_ext --inplace
cd ../../../../
pip install ./thirdparty/in3d/thirdparty/pyimgui --no-deps --no-build-isolation
pip install -e thirdparty/in3d  --no-build-isolation

pip install . --no-build-isolation

