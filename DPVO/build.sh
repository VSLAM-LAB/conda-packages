
set -e

pip install ./DPViewer --no-deps --no-build-isolation --use-pep517

sed -i 's/^\([[:space:]]*\)#\([[:space:]]*osp\.join(os\.environ\["PREFIX"\], '\''include\/eigen3'\''),*\)/\1\2/' setup.py
pip install . --no-deps --no-build-isolation
