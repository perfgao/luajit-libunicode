NAME
====
luajit-libunicode -- LuaJIT FFI binding for [libunicode](https://github.com/perfgao/libunicode).

INSTALL
=======
1. clone
```bash
$ git clone https://github.com/perfgao/luajit-unicode.git
$ cd luajit-unicode
```
2. install **libunicode.lua** module file
```
make install
```
3. If you haven't installed [**libunicode.so**](https://github.com/perfgao/libunicode) yet:
```bash
$ git submodule init
$ git submodule update
$ cd libunicode && make
```
  The *libunicode.so* will be generated in the *src* directory.

4. The *libunicode.so* shared object file is required to live in your lua_cpath, so you should symlink or copy the .so file to the appropriate location.

tips: view the lua_cpath
```
$ luajit -e "print(package.cpath)"
```

Synopsis
========
```
local libunicode = require("libunicode")

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
```

```
A
A
select * from
English
\u0045\u006e\u0067\u006c\u0069\u0073\u0068
汉字
\u6c49\u5b57
漢字
\u6f22\u5b57
русский  текст
\u0440\u0443\u0441\u0441\u043a\u0438\u0439\u0020\u0020\u0442\u0435\u043a\u0441\u0442
بالعربية
```
