# Yoyo-deepseek Agent

由 [wly-163](https://github.com/wly-163) 维护的个人开源 Agent 产品。

**Yoyo-deepseek Agent** 是基于 [DeepSeek Harness](https://github.com/deepseek-ai/deepseek-harness) 的**薄产品壳**：

- **品牌与默认配置**放在本仓库（`profiles/yoyo`、文档、脚本）。
- **Harness 内核**继续走上游，刻意保持可同步；v1 **不会**把 `@deepseek-ai/*` 整包改名。
- **模型网关**只是配置，不是品牌。对外文案统一使用 **Yoyo-deepseek Agent**。

## 仓库

- GitHub：https://github.com/wly-163/yoyo-deepseek-agent
- 作者：https://github.com/wly-163

## 快速开始

> **重要：** 本仓库是**产品壳**，**不包含** Harness 运行时。  
> **不要**指望在本目录执行 `pnpm install` 就能装出 Agent —— 请到 DeepSeek Harness 源码目录安装依赖。  
> 本仓库常用脚本：`pnpm run install-profile`、`pnpm run hint`。

### 1. 准备 DeepSeek Harness 源码

```sh
git clone https://github.com/deepseek-ai/deepseek-harness.git
cd deepseek-harness
pnpm install
pnpm run build
```

也可以把环境变量 `YOYO_UPSTREAM` 指到本机已有可构建的 checkout（例如：`D:\软件安装包\deepseek-harness`）。

### 2. 安装 Yoyo-deepseek Agent 的 profile

在**本仓库**执行：

```powershell
cd E:\Dev\Projects\yoyo-deepseek-agent
pnpm run install-profile
# 或: .\scripts\install-profile.ps1
```

会把 `profiles/yoyo` 复制到 `$DSH_HOME/profiles/yoyo`（默认 `~\.dsh\profiles\yoyo`）。

### 3. 配置模型（密钥不要进 Git）

将示例配置合并进 `$DSH_HOME/settings.yaml`，或在 Web UI 的 Models 页修改：

- 示例：[`docs/settings.yoyo.example.yaml`](docs/settings.yoyo.example.yaml)
- API Key 只放在 `$DSH_HOME/.credentials.yaml`（**永远不要提交**）

### 4. 启动（始终在 Harness 源码目录）

```powershell
cd "D:\软件安装包\deepseek-harness"
pnpm dsh --profile yoyo web
```

默认界面：http://127.0.0.1:3080/

## 目录结构

```text
yoyo-deepseek-agent/
├── profiles/yoyo/     # dsh profile（bundles + 可选 cordis.patch.yml）
├── packages/          # 预留自有插件（v1 为空）
├── docs/              # 上游同步说明 + 配置示例
└── scripts/           # 安装 profile / 同步检查清单
```

## 同步上游

见 [docs/sync.md](docs/sync.md)。自有改动请放在 `profiles/` 与 `packages/`，不要为了改默认配置去改 Harness 内核树。

## 许可证

[MIT](LICENSE)。DeepSeek Harness 仍归 DeepSeek 所有（MIT）；本仓库对 **Yoyo-deepseek Agent** 原创文件另有版权声明。

## 致谢

基于 [DeepSeek Harness](https://github.com/deepseek-ai/deepseek-harness) 与 [Cordis](https://github.com/cordiverse/cordis) 构建。
