# 文件说明
## 1. 文件类型
重构上游项目 [v2fly/domain-list-community](https://github.com/v2fly/domain-list-community)，生成供下游项目 [DustinWin/ruleset_geodata](https://github.com/DustinWin/ruleset_geodata) 使用的 DOMAIN 数据源文件
## 2. 数据去重
① 去除 `domain` 类型中冗余的子域名，如：
```
domain:test.cn
domain:cn
domain:123.example.com
domain:abc.example.com
domain:example.com
```
去除冗余子域名后，仅保留：
```
domain:cn
domain:example.com
```
② 去除 `domain` 类型中已存在，`full` 类型中冗余的域名，如：
```
full:test.cn
domain:cn
full:123.example.com
full:test.abc.example.com
domain:example.com
```
去除 `full` 类型中冗余的域名后，仅保留：
```
domain:cn
domain:example.com
```
## 3. 数据源
① 每天凌晨 2 点（北京时间 UTC+8）自动构建  
② **`fakeip-filter.txt`** 源采用 [ShellCrash/public/fake_ip_filter.list](https://github.com/juewuy/ShellCrash/blob/dev/public/fake_ip_filter.list)  
③ **`fakeip-filter-lite.txt`** 源采用 [ShellCrash/public/fake_ip_filter.list](https://github.com/juewuy/ShellCrash/blob/dev/public/fake_ip_filter.list)，仅保留主要域名（推荐搭配 [AdGuard Home](https://github.com/AdguardTeam/AdGuardHome) 且 DNS 配置 mix 混合模式时使用）  
④ **`private.txt`** 源采用 [v2fly/domain-list-community/private](https://github.com/v2fly/domain-list-community/blob/master/data/private) 和 [blackmatrix7/ios_rule_script/Lan](https://github.com/blackmatrix7/ios_rule_script/tree/master/rule/Clash/Lan)（仅域名）组合，并添加主流 [Dashboard 在线面板](https://github.com/DustinWin/proxy-tools/releases/tag/Dashboard)域名（`yacd.haishan.me`、`yacd.metacubex.one`、`d.metacubex.one`、`metacubex.github.io`、`metacubexd.pages.dev` 和 `board.zash.run.place`）  
⑤ **`ads.txt`** 源采用 [privacy-protection-tools/anti-AD](https://github.com/privacy-protection-tools/anti-AD)  
⑥ **`trackerslist.txt`** 源采用 [XIU2/TrackersListCollection](https://github.com/XIU2/TrackersListCollection/blob/master/all.txt)（仅域名）和 [ngosang/trackerslist](https://github.com/ngosang/trackerslist/blob/master/trackers_all.txt) 组合  
⑦ **`applications.list`** 源采用 [blackmatrix7/ios_rule_script/Download](https://github.com/blackmatrix7/ios_rule_script/tree/master/rule/Clash/Download) 和 [Loyalsoldier/clash-rules/applications.txt](https://github.com/Loyalsoldier/clash-rules/blob/release/applications.txt) 组合  
⑧ **`microsoft-cn.txt`** 源采用 [v2fly/domain-list-community/microsoft@cn](https://github.com/v2fly/domain-list-community/blob/master/data/microsoft)  
⑨ **`apple-cn.txt`** 源采用 [v2fly/domain-list-community/apple@cn](https://github.com/v2fly/domain-list-community/blob/master/data/apple) 和 [felixonmars/dnsmasq-china-list/apple.china.conf](https://github.com/felixonmars/dnsmasq-china-list/blob/master/apple.china.conf) 组合  
⑩ **`google-cn.txt`** 源采用 [v2fly/domain-list-community/google@cn](https://github.com/v2fly/domain-list-community/blob/master/data/google) 和 [felixonmars/dnsmasq-china-list/google.china.conf](https://github.com/felixonmars/dnsmasq-china-list/blob/master/google.china.conf) 组合  
⑪ **`games-cn.txt`** 源采用 [v2fly/domain-list-community/category-game-accelerator-cn](https://github.com/v2fly/domain-list-community/blob/master/data/category-game-accelerator-cn)、[v2fly/domain-list-community/category-game-platforms-download@cn](https://github.com/v2fly/domain-list-community/blob/master/data/category-game-platforms-download)、[v2fly/domain-list-community/category-games-cn](https://github.com/v2fly/domain-list-community/blob/master/data/category-games-cn)、[blackmatrix7/ios_rule_script/SteamCN](https://github.com/blackmatrix7/ios_rule_script/tree/master/rule/Clash/SteamCN) 和 [blackmatrix7/ios_rule_script/GameDownloadCN](https://github.com/blackmatrix7/ios_rule_script/tree/master/rule/Clash/Game/GameDownloadCN) 组合  
⑫ **`netflix.txt`** 源采用 [v2fly/domain-list-community/netflix](https://github.com/v2fly/domain-list-community/blob/master/data/netflix) 和 [blackmatrix7/ios_rule_script/Netflix](https://github.com/blackmatrix7/ios_rule_script/tree/master/rule/Clash/Netflix)（仅域名）组合  
⑬ **`disney.txt`** 源采用 [v2fly/domain-list-community/disney](https://github.com/v2fly/domain-list-community/blob/master/data/disney) 和 [blackmatrix7/ios_rule_script/Disney](https://github.com/blackmatrix7/ios_rule_script/tree/master/rule/Clash/Disney) 组合  
⑭ **`max.txt`** 源采用 [v2fly/domain-list-community/hbo](https://github.com/v2fly/domain-list-community/blob/master/data/hbo) 和 [blackmatrix7/ios_rule_script/HBO](https://github.com/blackmatrix7/ios_rule_script/tree/master/rule/Clash/HBO) 组合  
⑮ **`primevideo.txt`** 源采用 [v2fly/domain-list-community/primevideo](https://github.com/v2fly/domain-list-community/blob/master/data/primevideo) 和 [blackmatrix7/ios_rule_script/PrimeVideo](https://github.com/blackmatrix7/ios_rule_script/tree/master/rule/Clash/PrimeVideo) 组合  
⑯ **`appletv.txt`** 源采用 [v2fly/domain-list-community/apple-tvplus](https://github.com/v2fly/domain-list-community/blob/master/data/apple-tvplus) 和 [blackmatrix7/ios_rule_script/AppleTV](https://github.com/blackmatrix7/ios_rule_script/tree/master/rule/Clash/AppleTV) 组合  
⑰ **`youtube.txt`** 源采用 [v2fly/domain-list-community/youtube](https://github.com/v2fly/domain-list-community/blob/master/data/youtube) 和 [blackmatrix7/ios_rule_script/YouTube](https://github.com/blackmatrix7/ios_rule_script/tree/master/rule/Clash/YouTube) 组合  
⑱ **`tiktok.txt`** 源采用 [v2fly/domain-list-community/tiktok](https://github.com/v2fly/domain-list-community/blob/master/data/tiktok) 和 [blackmatrix7/ios_rule_script/TikTok](https://github.com/blackmatrix7/ios_rule_script/tree/master/rule/Clash/TikTok) 组合  
⑲ **`bilibili.txt`** 源采用 [v2fly/domain-list-community/bilibili](https://github.com/v2fly/domain-list-community/blob/master/data/bilibili) 和 [blackmatrix7/ios_rule_script/BiliBili](https://github.com/blackmatrix7/ios_rule_script/tree/master/rule/Clash/BiliBili) 组合  
⑳ **`spotify.txt`** 源采用 [v2fly/domain-list-community/spotify](https://github.com/v2fly/domain-list-community/blob/master/data/spotify) 和 [blackmatrix7/ios_rule_script/Spotify](https://github.com/blackmatrix7/ios_rule_script/tree/master/rule/Clash/Spotify) 组合  
㉑ **`media.txt`** 源采用 [blackmatrix7/ios_rule_script/GlobalMedia](https://github.com/blackmatrix7/ios_rule_script/tree/master/rule/Clash/GlobalMedia)  
㉒ **`games.txt`** 源采用 [v2fly/domain-list-community/category-game-platforms-download](https://github.com/v2fly/domain-list-community/blob/master/data/category-game-platforms-download)、[v2fly/domain-list-community/category-games-!cn](https://github.com/v2fly/domain-list-community/blob/master/data/category-games-!cn)、[blackmatrix7/ios_rule_script/Game](https://github.com/blackmatrix7/ios_rule_script/tree/master/rule/Clash/Game) 和 [blackmatrix7/ios_rule_script/Game/GameDownload](https://github.com/blackmatrix7/ios_rule_script/tree/master/rule/Clash/Game/GameDownload) 组合（删除了 `games-cn`）  
㉓ **`ai.txt`** 源采用 [v2fly/domain-list-community/category-ai-!cn](https://github.com/v2fly/domain-list-community/blob/master/data/category-ai-!cn) 和 [ACL4SSR/ACL4SSR/AI.list](https://github.com/ACL4SSR/ACL4SSR/blob/master/Clash/Ruleset/AI.list) 组合  
㉔ **`networktest.txt`** 源采用 [v2fly/domain-list-community/category-speedtest](https://github.com/v2fly/domain-list-community/blob/master/data/category-speedtest)、[blackmatrix7/ios_rule_script/Speedtest](https://github.com/blackmatrix7/ios_rule_script/tree/master/rule/Clash/Speedtest) 和 IPv6 测试域名关键字（`keyword`，包括：`ipv6-test`、`test-ipv6`、`ipv6test` 和 `testipv6`）组合  
㉕ **`tld-proxy`** 源采用 [v2fly/domain-list-community/tld-!cn](https://github.com/v2fly/domain-list-community/blob/master/data/tld-!cn)  
㉖ **`proxy.txt`** 源采用 [v2fly/domain-list-community/geolocation-!cn](https://github.com/v2fly/domain-list-community/blob/master/data/geolocation-!cn)（删除了带有 `@cn` 和 `@ads` 的域名，并新增了 [v2fly/domain-list-community/cn](https://github.com/v2fly/domain-list-community/blob/master/data/cn) 中带有 `@!cn` 的域名）、[gfwlist](https://github.com/gfwlist/gfwlist) 和 [blackmatrix7/ios_rule_script/Global](https://github.com/blackmatrix7/ios_rule_script/tree/master/rule/Clash/Global) 组合  
㉗ **`cn.txt`** 源采用 [v2fly/domain-list-community/cn](https://github.com/v2fly/domain-list-community/blob/master/data/cn)（删除了带有 `@!cn` 和 `@ads` 的域名，并新增了 [v2fly/domain-list-community/geolocation-!cn](https://github.com/v2fly/domain-list-community/blob/master/data/geolocation-!cn) 中带有 `@cn` 的域名）、[blackmatrix7/ios_rule_script/China](https://github.com/blackmatrix7/ios_rule_script/tree/master/rule/Clash/China) 和 [felixonmars/dnsmasq-china-list/accelerated-domains.china.conf](https://github.com/felixonmars/dnsmasq-china-list/blob/master/accelerated-domains.china.conf) 组合  
㉘ **`cn-lite.txt`** 源采用 [v2fly/domain-list-community/cn](https://github.com/v2fly/domain-list-community/blob/master/data/cn)（删除了带有 `@!cn` 和 `@ads` 的域名，并新增了 [v2fly/domain-list-community/geolocation-!cn](https://github.com/v2fly/domain-list-community/blob/master/data/geolocation-!cn) 中带有 `@cn` 的域名）和 [blackmatrix7/ios_rule_script/China](https://github.com/blackmatrix7/ios_rule_script/tree/master/rule/Clash/China) 组合