rm -rf ./working
rm -rf ./.devcontainer

git clone git@github.com:microsoft/vscode-dev-containers.git ./working

# copy fresh instance from vscode-dev-containers repo
cp -r ./working/containers/python-3-anaconda/.devcontainer ./

rm -rf ./working