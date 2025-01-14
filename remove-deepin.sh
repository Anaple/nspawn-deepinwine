#!/bin/bash
# 维护：Yuchen Deng [Zz] QQ群：19346666、111601117

# 确认管理员权限
if [[ $EUID != 0 ]]; then
    echo "请打开终端，在脚本前添加 sudo 执行，或者 sudo -s 获得管理员权限后再执行。"
    exit 1
fi

# 特殊处理
[ -f /var/lib/machines/deepin/var/lib/deepin/deepin_security_verify.whitelist ] && chattr -i /var/lib/machines/deepin/var/lib/deepin/deepin_security_verify.whitelist
rm -f /usr/share/debootstrap/scripts/apricot

# 移除旧版本可能遗留文件
if [[ ! -f /usr/local/bin/deepin-app-store && -f /bin/deepin-app-store ]]; then
    rm -f /bin/deepin-terminal
    rm -f /bin/deepin-app-store
    rm -f /bin/deepin-wemeet
    rm -f /bin/deepin-xunlei
    rm -f /bin/deepin-tenvideo
    rm -f /bin/deepin-powerword
    rm -f /bin/deepin-cbox
    rm -f /bin/deepin-feishu
    rm -f /bin/deepin-sunlogin
    rm -f /bin/deepin-foxwq
    rm -f /bin/deepin-baidunetdisk
    rm -f /bin/deepin-cstrike
    rm -f /bin/deepin-dingtalk*
    rm -f /bin/deepin-work-weixin
    rm -f /bin/deepin-wesing
    rm -f /bin/deepin-baoweiluobo
fi

# 开始移除
source `dirname ${BASH_SOURCE[0]}`/base-remove.sh deepin
rm -f /usr/local/bin/deepin-terminal
rm -f /usr/local/bin/deepin-app-store
rm -f /usr/local/bin/deepin-wemeet
rm -f /usr/local/bin/deepin-xunlei
rm -f /usr/local/bin/deepin-tenvideo
rm -f /usr/local/bin/deepin-powerword
rm -f /usr/local/bin/deepin-cbox
rm -f /usr/local/bin/deepin-feishu
rm -f /usr/local/bin/deepin-sunlogin
rm -f /usr/local/bin/deepin-foxwq
rm -f /usr/local/bin/deepin-baidunetdisk
rm -f /usr/local/bin/deepin-cstrike
rm -f /usr/local/bin/deepin-dingtalk*
rm -f /usr/local/bin/deepin-work-weixin
rm -f /usr/local/bin/deepin-wesing
rm -f /usr/local/bin/deepin-baoweiluobo
