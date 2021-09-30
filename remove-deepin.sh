#!/bin/bash
# 维护：Yuchen Deng QQ群：19346666、111601117

# 确认管理员权限
if [ $UID != 0 -o "$SUDO_USER" == "root" ]; then
    echo "请先打开终端，执行 sudo -s 获得管理员权限后再运行本脚本。"
    exit 1
fi

# 特殊处理
[ -f /var/lib/machines/deepin/var/lib/deepin/deepin_security_verify.whitelist ] && chattr -i /var/lib/machines/deepin/var/lib/deepin/deepin_security_verify.whitelist
rm -f /usr/share/debootstrap/scripts/apricot

# 开始移除
source `dirname ${BASH_SOURCE[0]}`/base-remove.sh deepin
