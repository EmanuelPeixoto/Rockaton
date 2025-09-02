{
  description = "Ambiente de desenvolvimento Go para Rockaton";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
      {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          pkgs.git
          pkgs.go
          pkgs.lazygit
        ];

        shellHook = ''
          echo "Bem-vindo ao Rockaton devshell!"
          echo "Go version: $(go version)"
          USER_SHELL=$(getent passwd $USER | cut -d: -f7)
          exec $USER_SHELL
        '';
      };
    };
}
