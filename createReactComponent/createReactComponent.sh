#!/bin/bash
# 组件类型
component_type=$1
# 组件名称
component_name=$2
# 组件说明
component_description=$3

# 拿到当前路径
curr_path=$(pwd)
# 模板路径
template_path=$(dirname $0)
cd ${template_path}
template_path=$(pwd)

# 参数校验
if [ "-f" != "${component_type}" -a "-l" != "${component_type}" ]; then
  echo "组件类型错误."
  echo "crc 组件类型(-f:有状态组件, -l:无状态组件) 组件名称 组件说明"
  exit
fi

if [ -z "${component_name}" ]; then
  echo "组件名称不能为空."
  echo "crc 组件类型(-f:有状态组件, -l:无状态组件) 组件名称 组件说明"
  exit
fi

if [ -d "${curr_path}/${component_name}" ]; then
  echo "组件创建失败,已存在${component_name}目录"
  exit
fi

# 组件名首字母转大写
f=`echo ${component_name} | cut -c 1`
f=`echo ${f} | tr '[:lower:]' '[:upper:]'`
name=`echo ${component_name} | cut -c 2-`
component_name=${f}${name}

# 复制组件模板
function copyTemplate() {
  echo "当前路径:${curr_path}"
  echo "模板路径:${template_path}"
  type=""
  case ${component_type} in
    "-f")
      type="StatefulComponent"
    ;;
    "-l")
      type="StatelessComponent"
    ;;
  esac
  cp ${template_path}/template/${type}/Template.jsx ${curr_path}/${component_name}/${component_name}.jsx \
  && cp ${template_path}/template/${type}/Template.scss ${curr_path}/${component_name}/${component_name}.scss
}

# 修改文件内容
function updateTemplate() {
  # 文件注释信息
  # name
  author=`echo $(whoami)`
  # date
  create_date=`date "+%Y-%m-%d %H:%M:%S"`
  # description
  description=''
  if [ -n "${component_description}" ]; then
    description=$component_description
  fi

  file_path=${curr_path}/${component_name}/${component_name}.jsx
  # 组件名
  sed -i "" "s/_COMPONENT_NAME_/${component_name}/g" ${file_path}
  # 组件注释
  sed -i "" "s/_NAME_/${author}/g" ${file_path}
  sed -i "" "s/_DATE_/${create_date}/g" ${file_path}
  if [ -n "${description}" ]; then
    sed -i "" "s/_DESCRIPTION_/${description}/g" ${file_path}
  else
    sed -i "" "s/_DESCRIPTION_//g" ${file_path}
  fi
}

# 复制模板
mkdir ${curr_path}/${component_name} \
&& copyTemplate \
&& updateTemplate \
&& echo "组件: ${component_name} 创建完成"
