# 概要
nbmd氏が作成したPAYDAY2日本語化MODのファイル群を保存、それをもとにBLT2.x系への対応及び、内部コードの整理等を行っています。  
nbmd氏から削除依頼または公開上で問題が発生した場合は削除いたします。  
現在未完成(80%)  

# フォルダ説明
**Original版**  
`lua-original/~` -> 元のluacファイルを逆コンパイルしたものを保管しています。`jp_m.lua`, `jp_mn.lua`, `jp_p.lua`, `jp_tg.lua`の4種類があります。  
`mod-original.txt` -> 元のmod.txt(BLT1.x系列)です。  
```完全な構造:
lua-original/
 -jp_m.lua
 -jp_mn.lua
 -jp_p.lua
 -jp_tg.lua
mod-original.txt
```


**Unofficial版**  
`lua/~` -> `lua-original/~`を元に加筆、修正を行っております。ファイルは全て`<元のファイル名>_unofficial.lua`となります。  
`JPLocalize.lua` -> `mod.txt`に起動オプションをつけたファイルになります。  
`mod.txt` -> `mod-original.txt`を元にBLT2.xに対応させたものになります。  
```完全な構造:
lua/
 -jp_m_unofficial.lua
 -jp_mn_unofficial.lua
 -jp_p_unofficial.lua
 -jp_tg_unofficial.lua
JPLocalize.lua
mod.txt
```

# Thanks
nbmd氏 - PAYDAY2日本語化MODの作成、及び公開。  
hinata氏 - luacファイルの逆コンパイル、アドバイス等。  
PAYDAY2の翻訳を手伝っている方々、その他、PAYDAY2日本語化MODコミュニティーの方々。  