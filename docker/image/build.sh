#!/bin/bash

echo "请先输入一个版本号："
read version

echo "您输入的版本号是： $version"
echo "登录aliyun镜像仓库"
docker login --username=252959493@qq.com registry.cn-shenzhen.aliyuncs.com

$build=$(pwd)
cd ../../
$root=$(pwd)
echo "安装依赖"
pnpm install

echo "client build"
cd $root/packages/certd-client
pnpm run build
echo "client build success"

echo "server build"
cd $root/packages/certd-server
pnpm run build
echo "server build success"

echo "rm node_modules"
rm ./node_modules -rf

echo "copy to workspace"
\cp ./* $build/workspace/certd-server -rf
\cp ../certd-client/dist/* $build/workspace/certd-server/public/ -rf

