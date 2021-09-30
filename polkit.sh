#!/bin/bash
# 维护：Yuchen Deng QQ群：19346666、111601117

# 确认管理员权限
if [ $UID != 0 -o "$SUDO_USER" == "root" ]; then
    echo "请先打开终端，执行 sudo -s 获得管理员权限后再运行本脚本。"
    exit 1
fi

# 允许无管理员权限启动
pkaction --version #大于105才适合rules，否则pkla
cat > /var/lib/polkit-1/localauthority/10-vendor.d/machines.pkla <<EOF
[Machines Rules]
Identity=unix-user:*
Action=org.freedesktop.machine1.*;org.freedesktop.systemd1.manage-units;org.freedesktop.systemd1.manage-unit-files
ResultAny=yes
ResultInactive=yes
ResultActive=yes
EOF
cat > /usr/share/polkit-1/rules.d/10-machines.rules <<EOF
polkit.addRule(function(action, subject) {
    if (action.id.startsWith("org.freedesktop.machine1.") ||
        ((action.id == "org.freedesktop.systemd1.manage-units" || action.id == "org.freedesktop.systemd1.manage-unit-files") && action.lookup("unit").startsWith("systemd-nspawn@"))) {
        return polkit.Result.YES;
    }
});

polkit.addRule(function(action, subject) {
    if ((action.id == "org.freedesktop.systemd1.manage-units" || action.id == "org.freedesktop.systemd1.manage-unit-files") &&
        /^systemd-nspawn\@.*\.service$/.test(action.lookup("unit"))) {
        return polkit.Result.YES;
    }
});
EOF