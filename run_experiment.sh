#!/bin/bash
# ============================================================
# Tiny Zero 训练启动脚本
# 使用方法: ./run_experiment.sh
# ============================================================

# ------------------------------------------------------------
# 1. 用户配置区域 (User Configuration)
#    请根据你的实际环境修改以下变量
# ------------------------------------------------------------

# [路径配置] - 建议使用绝对路径，防止出错
export BASE_MODEL="/root/storage/taosiyuan.tsy/huggingface/models/Qwen3-0dot6B"     # 替换为你的模型路径或 HuggingFace ID
export DATA_DIR="/root/storage/taosiyuan.tsy/repos/TinyZero/data/countdown"     # 替换为你的数据集路径

# [实验名称]
export EXPERIMENT_NAME="countdown-qwen3-0.6b"

# [硬件资源配置]
export N_GPUS=1
export ROLLOUT_TP_SIZE=1

# [后端配置]
export VLLM_ATTENTION_BACKEND="XFORMERS"

# [目标脚本路径]
TARGET_SCRIPT="./scripts/train_tiny_zero.sh"

# ------------------------------------------------------------
# 2. 执行检查与启动 (Execution Logic)
# ------------------------------------------------------------

# 遇到错误立即停止
set -e

echo "========================================================"
echo ">>> 🚀 准备启动实验: ${EXPERIMENT_NAME}"
echo "========================================================"
echo "    基础模型: ${BASE_MODEL}"
echo "    数据路径: ${DATA_DIR}"
echo "    GPU 数量: ${N_GPUS}"
echo "    后端加速: ${VLLM_ATTENTION_BACKEND}"
echo "========================================================"

# 检查目标脚本是否存在
if [ ! -f "$TARGET_SCRIPT" ]; then
    echo "❌ 错误: 找不到训练脚本: $TARGET_SCRIPT"
    echo "   请确保你在正确的目录下运行此脚本 (通常是项目根目录)。"
    exit 1
fi

# 执行训练
echo ">>> 正在运行 $TARGET_SCRIPT ..."
bash "$TARGET_SCRIPT"