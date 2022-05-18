# del previous dev container
rm -rf ./.devcontainer

# copy fresh instance from vscode-dev-containers repo
cp -r ../vscode-dev-containers/containers/python-3-anaconda/.devcontainer ./

