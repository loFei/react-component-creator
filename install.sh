#!/bin/bash
\cp -rf ./createReactComponent ~/
cd ~/
HOME=`echo $(pwd)`
echo "" >> ~/.bash_profile
echo "# createReactComponent" >> ~/.bash_profile
echo "alias crc=${HOME}/createReactComponent/createReactComponent.sh" >> ~/.bash_profile
echo "" >> ~/.bash_profile

# 如果使用是zsh或者其他shell请手动更新配置文件
source ~/.bash_profile

echo "安装完成. 创建react组件方法: crc 组件名"