{ config, pkgs, ... }:

{
  users.users.mlitwin.hashedPassword = "<hashed password goes here>";
  users.users.mlitwin.password = "<or plain text password goes here>"
}
