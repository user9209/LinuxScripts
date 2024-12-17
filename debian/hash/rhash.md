# rhash

## Install rhash

```bash
apt install rhash
```

## Hash file

### V1
```bash
rhash --sha3-512 [filename]
```

### V2

```bash
cat [filename] | rhash --sha3-512 -
```

## Hash folder

```bash
rhash --sha3-512 -r [foldername]
```

## Hash file to binary

### V1

```bash
rhash -p "%@{sha3-512}" [filename]
```

### V2

```bash
cat [filename] | rhash -p "%@{sha3-512}" -
```

## Verify binary hash

Requires `rhash`, `xxd` and `bash` with `read`, `echo`, `cat`.

```bash
cat [filename-binary-hash] | { read -d '\0' hashV; echo -E -n "$(echo -E -n "$hashV" | xxd -p -c 5000 -) [filename-to-verify]"; } | rhash --sha3-512 -c -
```
