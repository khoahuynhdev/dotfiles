return {
  cmd = "./node_modules/.bin/eslint",

  install_script = [[
  ! test -f package.json && npm init -y --scope=lspinstall || true
  npm install eslint
  ]]
}
