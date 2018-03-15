--test require .lua
local ok, mode = pcall(require, 'libunicode')
if not ok then
    print("load libunicode.lua failed!")
    print("you should install libunicode.lua in:\n" .. package.path)
    return
end

local unicode = require("libunicode")

--test load .so
local ok, err = unicode.encode("a")
if not ok then
    if err == 'cannot load libunicode.so' then
        print(err .. ', you should install libunicode.so in:\n'
              .. package.cpath)
        return
    end
    print(err)
end

-- unicode to utf-8
local str = '\\u0041'
local res = unicode.decode(str, 0)
print(res)

-- support url-encode: '%u'
print(unicode.decode('%u0041'))

-- support mixing
print(unicode.decode('s\\u0065l\\u0065ct * fr%u006fm'))

-- A variety of encoding text
print(unicode.decode('%u0045%u006e%u0067%u006c%u0069%u0073%u0068'))
print(unicode.encode('English'))

print(unicode.decode('\\u6c49\\u5b57'))
print(unicode.encode('汉字'))
print(unicode.decode('\\u6f22\\u5b57'))
print(unicode.encode('漢字'))

print(unicode.decode('\\u0440\\u0443\\u0441\\u0441\\u043a\\u0438\\u0439\\u0020\\u0020\\u0442\\u0435\\u043a\\u0441\\u0442'))
print(unicode.encode('русский  текст'))
print(unicode.decode('\\u0628\\u0627\\u0644\\u0639\\u0631\\u0628\\u064a\\u0629'))
print(unicode.encode('بالعربية'))

print(unicode.decode('%u%u%u61g%ufffff%u28f'))
print(unicode.encode('￿'))
print(unicode.decode(unicode.encode('， 、 。 ？ ！ ； ： · “” ‘’ 「」 『』 （） － —— …… 《》 〈〉 【】 〖〗 〔〕 ～')))
print(unicode.decode(unicode.encode([[ā á ǎ à · ō ó ǒ ò · ē é ě è · ī í ǐ ì · ū ú ǔ ù · ü ǖ ǘ ǚ ǜ · ê ê̄ ế ê̌ ề · Ā Á Ǎ À · Ō Ó Ǒ Ò · Ē É Ě È]])))
print(unicode.decode(unicode.encode[[ㄅ ㄆ ㄇ ㄈ ㄉ ㄊ ㄋ ㄌ ㄍ ㄎ ㄏ ㄐ ㄑ ㄒ ㄓ ㄔ ㄕ ㄖ ㄗ ㄘ ㄙ ㄧ ㄨ ㄩ ㄚ ㄛ ㄜ ㄝ ㄞ ㄟ ㄠ ㄡ ㄢ ㄣ ㄤ ㄥ ㄦ· ˉ ˊ ˇ ˋ ˙
− ° ℃ ℉ ‰ ￥ ¥ € £ ¤ ￠ © ® ™ № · → ↑ ← ↓ ↖ ↗ ↘ ↙
① ② ③ ④ ⑤ ⑥ ⑦ ⑧ ⑨ ⑩ ⑪ ⑫ ⑬ ⑭ ⑮ ⑯ ⑰ ⑱ ⑲ ⑳ · ㈠ ㈡ ㈢ ㈣ ㈤ ㈥ ㈦ ㈧ ㈨ ㈩ · 〇 〡 〢 〣 〤 〥 〦 〧 〨 〩 Ⅰ Ⅱ Ⅲ Ⅳ Ⅴ Ⅵ Ⅶ Ⅷ Ⅸ Ⅹ Ⅺ Ⅻ Ⅼ Ⅽ Ⅾ Ⅿ
⒈ ⒉ ⒊ ⒋ ⒌ ⒍ ⒎ ⒏ ⒐ ⒑ ⒒ ⒓ ⒔ ⒕ ⒖ ⒗ ⒘ ⒙ ⒚ ⒛ · ⑴ ⑵ ⑶ ⑷ ⑸ ⑹ ⑺ ⑻ ⑼ ⑽ ⑾ ⑿ ⒀ ⒁ ⒂ ⒃ ⒄ ⒅ ⒆ ⒇
≠ ≤ ≥ < > ≡ ≈ ≅ ∝ ° ′ ″ ∴ ∵ · − × ÷ ± ⊥ ⊕ ⊗ ∗ · … ¼  ¾ ¹ ² ³ ° · ∂ ∫ ∑ ∞ ∏ √ ∇ · ← → ↔ ⇐ ⇒ ⇔ · ⌈ ⌉ ⌊ ⌋ · ¬ ∧ ∨ ∃ ∀ · ∈ ∉ ∋ ∅ ⊆ ⊇ ⊃ ⊂ ⊄ ∪ ∩ ℵ]]))
print(unicode.decode(unicode.encode([[ ހ ށ ނ ރ ބ ޅ ކ އ ވ މ ފ ދ ތ ލ ގ ޏ U+079x ސ ޑ ޒ ޓ ޔ ޕ ޖ ޗ ޘ ޙ ޚ ޛ ޜ ޝ ޞ ޟ U+07Ax ޠ ޡ ޢ ޣ ޤ ޥ ަ ާ ި ީ ު ޫ ެ ޭ ޮ ޯ ]])))

print(unicode.encode(""))
print(unicode.decode("%u0"))
