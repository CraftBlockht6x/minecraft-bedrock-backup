#!/bin/bash
# 回档代码
# 已阅读并同意代码使用条款（同意为true，不同意为false，默认为false）
# 请阅读以下条款后再运行此脚本：[条款链接]
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

# 备份目录路径
BACKUP_DIR="backup"
# 服务器存档目录路径
WORLD_DIR="worlds/Bedrock level"

# 检查是否传入了备份文件名作为参数
if [ "$#" -ne 1 ]; then
    echo "[Back-up program] [ERROR] The backup file directory is not configured"
    echo "[Back-up program] [INFO] Usage: $0 <backup_folder_name>"
    echo "[Back-up program] [INFO] Example: $0 world_backup_20230101_123456"
    exit 1
fi

# 传入的备份文件夹名
BACKUP_FOLDER_NAME=$1

# 检查备份文件夹是否存在
if [ ! -d "$BACKUP_DIR/$BACKUP_FOLDER_NAME" ]; then
    echo "[Back-up program] [ERROR] Backup folder does not exist: $BACKUP_DIR/$BACKUP_FOLDER_NAME"
    exit 1
fi

# 回档到指定的备份
echo "[Back-up program] [INFO] Restoring backup: $BACKUP_DIR/$BACKUP_FOLDER_NAME to $WORLD_DIR"
rm -rf "$WORLD_DIR"/*
cp -r "$BACKUP_DIR/$BACKUP_FOLDER_NAME"/* "$WORLD_DIR"

# 输出回档完成信息
echo "[Back-up program] [INFO] Restore completed: $BACKUP_DIR/$BACKUP_FOLDER_NAME"
