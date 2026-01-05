
set -e

pip install ./DPViewer --no-deps --no-build-isolation --use-pep517
pip install . --no-deps --no-build-isolation
