#!/bin/bash

# 获取插件名称和版本

# 读取Makefile文件
MAKEFILE="./Makefile"

# 提取NAME, PKG_NAME和PKG_VERSION
NAME=$(grep -E '^NAME:=' $MAKEFILE | cut -d '=' -f 2)
PKG_NAME=$(grep -E '^PKG_NAME:=' $MAKEFILE | cut -d '=' -f 2)
PKG_VERSION=$(grep -E '^PKG_VERSION:=' $MAKEFILE | cut -d '=' -f 2)
echo "插件名称: $NAME"
echo "插件包名称: $PKG_NAME"
echo "插件版本: $PKG_VERSION"

# 替换PKG_NAME中的$(NAME)
PLUGIN_NAME=${PKG_NAME//\$(NAME)/$NAME}
echo "插件合并名称: $PLUGIN_NAME"

# 输出到$GITHUB_ENV
echo "PLUGIN_NAME=$PLUGIN_NAME" >> $GITHUB_ENV
echo "PLUGIN_VERSION=$PKG_VERSION" >> $GITHUB_ENV
