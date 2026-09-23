# Yoyo-deepseek Agent — product-shell design (v1)

## Goal

Own open-source identity (**Yoyo-deepseek Agent**, GitHub [wly-163](https://github.com/wly-163)) while continuing to sync DeepSeek Harness source updates.

## Approach

Thin product repository + unchanged upstream kernel + profile/settings for defaults.

## Non-goals (v1)

- Renaming `@deepseek-ai/*` packages
- Full Web UI reskin
- Publishing a separate npm CLI under a new scope

## Branding

- Public name: **Yoyo-deepseek Agent**
- GitHub user: **wly-163**
- Intended repo: `https://github.com/wly-163/yoyo-deepseek-agent`
- Profile id (technical): `yoyo` (used with `pnpm dsh --profile yoyo`)
- Provider id (technical): `yoyo`; UI displayName: `Yoyo-deepseek Agent`
- Do not use ANNTO as product brand copy; gateway hostnames may still appear as technical endpoints in config examples
