What are we doing here?

Context: https://github.com/microsoft/WSL2-Linux-Kernel/releases/tag/linux-msft-wsl-6.6.36.3

> We are very excited kernel module support is now available in WSL2! With this latest kernel update, a large set of loadable modules has been introduced, accompanied by an overall config file update. However, please be aware that when using a custom kernel, the default module support is disabled for now. If you’re using a custom kernel, we recommend you edit your kernel config file to build-in all of the modules that you need.

We are taking the default x86 `/arch/x86/configs/config-wsl` for a given branch and doing these things.

- Changing `=m` to `=y` as dynamic modules don't load in custom kernels.
- Making sure `CONFIG_NETFILTER_XT_MATCH_CONNMARK=y` `CONFIG_NETFILTER_XT_CONNMARK=y` are set for wireguard
- Making sure docker desktop requirements are configured to `=y` - https://github.com/microsoft/WSL/issues/11742#issuecomment-2272557613

That's it.

Config source - https://github.com/microsoft/WSL2-Linux-Kernel

```
https://raw.githubusercontent.com/microsoft/WSL2-Linux-Kernel/refs/heads/linux-msft-wsl-5.15.y/arch/x86/configs/config-wsl
https://raw.githubusercontent.com/microsoft/WSL2-Linux-Kernel/refs/heads/linux-msft-wsl-6.6.y/arch/x86/configs/config-wsl
```

Download base config

```
curl -sLo linux-msft-wsl-5.15.y-config-wsl https://raw.githubusercontent.com/microsoft/WSL2-Linux-Kernel/refs/heads/linux-msft-wsl-5.15.y/arch/x86/configs/config-wsl
curl -sLo linux-msft-wsl-6.6.y-config-wsl https://raw.githubusercontent.com/microsoft/WSL2-Linux-Kernel/refs/heads/linux-msft-wsl-6.6.y/arch/x86/configs/config-wsl
```

## info

https://learn.microsoft.com/en-us/community/content/wsl-user-msft-kernel-v6
