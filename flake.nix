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
          pkgs.air
          pkgs.git
          pkgs.go
          pkgs.lazygit
          pkgs.go-swag
          pkgs.swagger-cli
          pkgs.sqlite

          pkgs.nodejs_24
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
