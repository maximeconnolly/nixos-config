let
  user1 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPI/f2Tw4aaANyVNE3v/55gil/H6PRDMsg/PNNJDxabW mconnolly@nixos";
in
{
  "test-secret.age".publicKeys = [ user1 ];
}
