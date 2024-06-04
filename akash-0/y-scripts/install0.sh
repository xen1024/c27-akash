install_bore () {
  apt install -y curl
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh && source $HOME/.cargo/env && rustc --version
  cargo install bore-cli
}

install_bore
