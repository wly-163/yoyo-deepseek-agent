# Syncing DeepSeek Harness into Yoyo

Yoyo is a product shell. Upstream is [deepseek-ai/deepseek-harness](https://github.com/deepseek-ai/deepseek-harness).

## Rules

1. Put Yoyo-only changes under `profiles/` and `packages/` in **this** repo.
2. Do not rename `@deepseek-ai/*` packages in the harness tree — that blocks merges.
3. Prefer `$DSH_HOME/settings.yaml` and credentials for gateway/model defaults.
4. After every upstream bump: `pnpm install` → `pnpm run build` → `pnpm dsh --profile yoyo web` smoke.

## Local upstream checkout

Set an environment variable (optional):

```powershell
$env:YOYO_UPSTREAM = "D:\软件安装包\deepseek-harness"
```

Then run:

```powershell
.\scripts\sync-upstream-checklist.ps1
```

## Recommended git remotes (harness clone)

Inside your harness checkout:

```sh
git remote -v
# origin  → your fork of deepseek-harness (optional)
# upstream → https://github.com/deepseek-ai/deepseek-harness.git
```

```sh
git fetch upstream
git merge upstream/master
```

## This repository (yoyo-agent)

```sh
git remote add origin https://github.com/wly-163/yoyo-agent.git
git push -u origin master
```

Create the empty GitHub repo under [wly-163](https://github.com/wly-163) first if it does not exist yet.
