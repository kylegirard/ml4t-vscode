rm -rf ./workingg
rm -rf ./.devcontainer

git clone ssh://git@github.com:22/microsoft/vscode-dev-containers.git ./working

# copy fresh instance from vscode-dev-containers repo
cp -r ./working/containers/python-3-anaconda/.devcontainer ./

rm -rf ./working