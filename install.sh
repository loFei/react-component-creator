#!/bin/bash
\cp -rf ./createReactComponent ~/

# 检测是否已经存在脚本
crc_alias=`echo $(grep "createReactComponent" ~/.bash_profile)`
if [ -z "${crc_alias}" ]; then
  echo '添加脚本别名'
  cd ~/
  HOME=`echo $(pwd)`
  echo "" >> ~/.bash_profile
  echo "# createReactComponent" >> ~/.bash_profile
  echo "alias crc=${HOME}/createReactComponent/createReactComponent.sh" >> ~/.bash_profile
  echo "" >> ~/.bash_profile
fi

# 如果使用是zsh或者其他shell请手动更新配置文件
source ~/.bash_profile
# source ~/.zshrc

echo "安装完成. 创建react组件方法: crc 组件名"