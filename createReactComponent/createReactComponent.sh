#!/bin/bash
if [ -z "$1" ]; then
  echo "参数错误. createReactComponent.sh 组件名"
  exit
fi

# 拿到当前路径
curr_path=$(pwd)
echo "当前路径:${curr_path}"

# 模板路径
template_path=$(dirname $0)
cd ${template_path}
template_path=$(pwd)
echo "模板路径:${template_path}"

# 组件名,先转小写再把首字母转大写
# component_name=`echo $1 | tr '[:upper:]' '[:lower:]'`
component_name=$1
f=`echo ${component_name} | cut -c 1`
f=`echo ${f} | tr '[:lower:]' '[:upper:]'`
name=`echo ${component_name} | cut -c 2-`
component_name=${f}${name}
# echo ${component_name}

# 复制模板
mkdir ${curr_path}/${component_name} \
&& cp ${template_path}/template/Template/Template.jsx ${curr_path}/${component_name}/${component_name}.jsx \
&& cp ${template_path}/template/Template/Template.scss ${curr_path}/${component_name}/${component_name}.scss \
&& sed -i "" "s/Template/${component_name}/g" ${curr_path}/${component_name}/${component_name}.jsx

echo "组件: ${component_name} 创建完成"
