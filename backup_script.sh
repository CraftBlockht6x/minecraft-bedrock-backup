#!/bin/bash
# 备份代码
# 已阅读并同意代码使用条款（同意为true，不同意为false，默认为false）
# 请阅读以下条款后再运行此脚本：https://github.com/CraftBlockht6x/minecraft-bedrock-backup/blob/main/LICENSE.md
AGREEMENT=false

# 检查AGREEMENT是否为true或false
if [ "$AGREEMENT" != "true" ] && [ "$AGREEMENT" != "false" ]; then
    echo "[Back-up program] [ERROR] AGREEMENT must be set to 'true' or 'false'."
    echo "[Back-up program] [ERROR] You have not agreed to the code terms of use, if you do, set AGREEMENT=true to continue."
    exit 1
fi
if [ "$AGREEMENT" = false ]; then
    echo "[Back-up program] [ERROR] You have not agreed to the code terms of use, if you do, set AGREEMENT=true to continue."
    exit 1
fi

# 服务器存档目录路径
WORLD_DIR="worlds/Bedrock level"
# 备份目录路径
BACKUP_DIR="backup"

# 获取当前日期，用于备份文件的命名
DATE=$(date +%Y%m%d_%H%M%S)
# 创建备份文件名
BACKUP_NAME="world_backup_$DATE"

# 创建备份目录如果它不存在
mkdir -p "$BACKUP_DIR"

# 检查备份目录是否成功创建
if [ ! -d "$BACKUP_DIR" ]; then
    echo "[Back-up program] [INFO] Failed to create backup directory: $BACKUP_DIR"
    exit 1
fi

# 检查备份名称是否与现有文件冲突
if [ -e "$BACKUP_DIR/$BACKUP_NAME" ]; then
    echo "[Back-up program] [ERROR] Backup name conflicts with existing file: $BACKUP_DIR/$BACKUP_NAME"
    exit 1
fi

# 创建备份目录
mkdir -p "$BACKUP_DIR/$BACKUP_NAME"

# 复制world文件夹内的所有文件到备份位置
echo "[Back-up program] [INFO] Creating backup..."
cp -r "$WORLD_DIR"/* "$BACKUP_DIR/$BACKUP_NAME"

# 输出备份完成信息
echo "[Back-up program] [INFO] Backup completed: $BACKUP_DIR/$BACKUP_NAME"

# 保留的备份次数
KEEP_BACKUPS=5

# 获取备份目录中所有的备份文件列表
backups=($BACKUP_DIR/world_backup_*)

# 如果备份文件数量超过设定的保留次数，则删除最旧的备份
if [ ${#backups[@]} -gt $KEEP_BACKUPS ]; then
    echo "[Back-up program] [INFO] Deleting old backups..."
    old_backup=${backups[0]}
    rm -rf "$old_backup"
    echo "[Back-up program] [INFO] Deleted: $old_backup"
fi
