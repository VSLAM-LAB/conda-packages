
set -e

pip install ./DPViewer --no-deps --no-build-isolation --use-pep517

sed -i 's/^\([[:space:]]*\)#\([[:space:]]*osp\.join(os\.environ\["PREFIX"\], '\''include\/eigen3'\''),*\)/\1\2/' setup.py
pip install . --no-deps --no-build-isolation


# pip install thirdparty/mast3r/asmk --no-deps --no-build-isolation
# pip install -e thirdparty/mast3r --no-build-isolation
# pip install ./thirdparty/in3d/thirdparty/pyimgui --no-deps --no-build-isolation
# pip install -e thirdparty/in3d  --no-build-isolation

# sed -i 's/^[[:space:]]*#\([[:space:]]*osp\.join(os\.environ\["PREFIX"\], '\''include\/eigen3'\''),*\)/\1/' setup.py
# pip install . --no-build-isolation

