#!/usr/bin/env node
console.log(`
Yoyo-deepseek Agent is a product shell — it has no harness dependencies.

Do NOT expect this repo to replace DeepSeek Harness.

Correct flow:
  1. cd <deepseek-harness-checkout>
  2. pnpm install && pnpm run build   # only in the harness repo
  3. cd E:\\Dev\\Projects\\yoyo-deepseek-agent
  4. pnpm run install-profile
  5. cd <deepseek-harness-checkout>
  6. pnpm dsh --profile yoyo web

UI: http://127.0.0.1:3080/
`)
