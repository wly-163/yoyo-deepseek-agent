# Yoyo

Personal open-source agent product shell by [wly-163](https://github.com/wly-163).

Yoyo is a **thin distribution layer** on top of [DeepSeek Harness](https://github.com/deepseek-ai/deepseek-harness):

- **Your brand and defaults** live in this repository (`profiles/yoyo`, docs, scripts).
- **The harness kernel** stays upstream and is synced on purpose — we do not fork-rename `@deepseek-ai/*` packages in v1.
- **Company or personal gateways** are configuration, not branding. Product copy says **Yoyo** only.

## Repository

- GitHub (intended): https://github.com/wly-163/yoyo-agent
- Author: https://github.com/wly-163

## Quick start

### 1. Get a DeepSeek Harness checkout

```sh
git clone https://github.com/deepseek-ai/deepseek-harness.git
cd deepseek-harness
pnpm install
pnpm run build
```

Or set `YOYO_UPSTREAM` to an existing buildable checkout (this machine often uses `D:\软件安装包\deepseek-harness`).

### 2. Install the Yoyo profile

From this repository (PowerShell):

```powershell
.\scripts\install-profile.ps1
```

This copies `profiles/yoyo` into `$DSH_HOME/profiles/yoyo` (default `~\.dsh\profiles\yoyo`).

### 3. Configure models (no secrets in git)

Copy the example settings fragment and merge into `$DSH_HOME/settings.yaml`, or edit Models in the Web UI:

- Example: [`docs/settings.yoyo.example.yaml`](docs/settings.yoyo.example.yaml)
- Put API keys only in `$DSH_HOME/.credentials.yaml` (never commit them)

### 4. Run

```sh
# from the harness checkout
pnpm dsh --profile yoyo web
```

Default UI: `http://127.0.0.1:3080/`

## Layout

```text
yoyo-agent/
├── profiles/yoyo/     # dsh profile (bundles + optional cordis.patch.yml)
├── packages/          # future Yoyo-owned plugins (empty in v1)
├── docs/              # sync guide + settings example
└── scripts/           # install profile / sync checklist
```

## Syncing upstream

See [docs/sync.md](docs/sync.md). Keep custom code in `profiles/` and `packages/`; avoid editing the harness tree for product defaults.

## License

[MIT](LICENSE). DeepSeek Harness remains copyright DeepSeek under MIT; Yoyo adds its own copyright for original files in this repository.

## Acknowledgments

Built on [DeepSeek Harness](https://github.com/deepseek-ai/deepseek-harness) and [Cordis](https://github.com/cordiverse/cordis).
