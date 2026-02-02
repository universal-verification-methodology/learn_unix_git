# Arguments example

Practice **passing** and **using** positional parameters (`$1`, `$2`, ...) and providing defaults.

## Layout

```
arguments/
├── README.md       # this file
└── greet.sh        # prints Hello, <name>! (chmod u+x to run)
```

## Try these (from repo root)

```bash
cd module4/examples/arguments
chmod u+x greet.sh
./greet.sh Alice
./greet.sh "Bob Smith"
./greet.sh
```

## 1. Positional parameters

- **`$0`** — name of the script (e.g. `./greet.sh`)
- **`$1`** — first argument
- **`$2`** — second argument
- **`"$@"`** — all arguments as a list (quoted to preserve spaces)

## 2. Default values

If no argument is given, `$1` is empty. Use a default:

```bash
NAME="${1:-World}"
```

That means: use `$1` if set, otherwise use `World`. So `./greet.sh` prints "Hello, World!" and `./greet.sh Alice` prints "Hello, Alice!".

## 3. Quoting

Use **`"$1"`** (not `$1`) so names with spaces work: `./greet.sh "Jane Doe"`.
