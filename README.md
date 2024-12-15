# Minecraft Bedrock Server Backup & Restore Scripts

[![GitHub License](https://img.shields.io/badge/license-MIT-lightblue.svg)](https://opensource.org/licenses/MIT)

## 简介

作为一位热情的Minecraft服务器服主，保障玩家数据的安全至关重要。本项目提供了两套自动化脚本，用于备份和回档您的Minecraft Bedrock服务器。这些脚本旨在提高效率，减少人为错误，确保服务器数据的安全性。

## 功能

- **一键备份**：将服务器的`worlds`目录至`backup`目录。
- **快速回档**：允许从多个备份中选择一个时间点，将服务器状态回溯至那时。
- **条款同意**：在脚本执行前，要求用户确认已阅读并同意代码使用条款。
- **自动删除旧备份**：自动保留最新几个备份，同时清除更早的备份以节省空间。

![283ad8d25c864e7787c37dffb14960b8.jpg](https://img-blog.csdnimg.cn/283ad8d25c864e7787c37dffb14960b8.jpg)

## 运行条件

- 服务器运行Minecraft Bedrock版本。
- 服务器在Linux环境下运行。
- 服务器具备执行脚本和管理服务的足够权限。

## 安装指南

1. **下载脚本**：访问[GitHub](https://github.com/craftblockht6x/minecraft-bedrock-backup)下载备份与回档脚本。
2. **上传脚本**：使用FTP或SSH将脚本上传至服务器。
3. **赋予权限**：执行`chmod +x backup_script.sh restore_script.sh`，赋予脚本执行权限。

![8e564dcbc0ff4498a01f780ae433cba6.jpg](https://img-blog.csdnimg.cn/8e564dcbc0ff4498a01f780ae433cba6.jpg)

## 使用方法

### 备份脚本

- 同意条款：在`backup_script.sh`中，将`AGREEMENT`设为`true`。
- 运行脚本：通过SSH连接服务器，执行`./backup_script.sh`。

### 回档脚本

- 同意条款：在`restore_script.sh`中，将`AGREEMENT`设为`true`。
- 选择备份：确定要回档至的备份文件夹名称。
- 运行脚本：通过SSH连接服务器，执行`./restore_script.sh world_backup_YYYYMMDD_HHMMSS`。

![bcb4a3376ae84d2f9038758d872c83c5.jpg](https://img-blog.csdnimg.cn/bcb4a3376ae84d2f9038758d872c83c5.jpg)

## 注意事项

- 定期检查脚本运行状态，确保一切按计划进行。
- 确保脚本具有适当的权限，以便访问和修改服务器目录。
- 在执行回档前，确认服务器已停止，避免数据损坏。
- 执行脚本前，请确保已阅读并同意代码使用条款。
- 定期检查备份文件，确保在需要时能够成功回档。

## 使用条款

通过使用这些脚本，即表示您同意并遵守[使用条款](https://github.com/craftblockht6x/minecraft-bedrock-backup/blob/main/LICENSE.md)。

## 贡献

我们欢迎任何形式的贡献，包括问题报告、功能请求、文档更新或代码提交。请在提交贡献之前，阅读我们的[贡献指南](https://github.com/craftblockht6x/minecraft-bedrock-backup/blob/main/CONTRIBUTING.md)。

## 联系

如有任何疑问或需要帮助，请联系我们或在[问题跟踪器](https://github.com/craftblockht6x/minecraft-bedrock-backup/issues)中提出问题。
