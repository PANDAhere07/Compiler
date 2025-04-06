# 🔺 Instruction Compiler 🔺

**Instruction Compiler** is a simple compiler-like application built using **Flex (Lex)** and **Bison (Yacc)** in **C** to parse and evaluate arithmetic instructions in a custom 3-address format.

---

## ✨ Features

✅ Parses user-friendly input like:

z = 5 * 6 + 2

yaml
Copy
Edit

✅ Generates **three-address code (3AC)** for the instruction

✅ Displays **pseudo assembly–style** intermediate code

✅ Computes and displays the **final numeric result**

✅ Shows the **total number of tokens parsed**

---

## 📂 Project Structure

instruction-compiler/ ├── lexar.l # Flex lexical analyzer rules ├── parser.y # Bison grammar and actions ├── Makefile # Build automation script ├── README.md # This documentation └── (optional) # Any helper headers or scripts

yaml
Copy
Edit

---

## ⚙️ Requirements

### ✅ Tools

- `flex` (v2.6+)
- `bison` (v3.0+)
- `gcc` (or any C compiler supporting C99)
- `make` (optional)

### 🪟 Windows (MSYS2)

```bash
pacman -Syu
pacman -S mingw-w64-x86_64-gcc flex bison make
🐧 Linux (Debian/Ubuntu)
bash
Copy
Edit
sudo apt-get update
sudo apt-get install gcc flex bison make
🔨 Build Instructions
📦 Using Makefile
bash
Copy
Edit
make
This will:

Run flex lexar.l to generate lex.yy.c

Run bison -d parser.y to generate parser.tab.c and parser.tab.h

Compile everything using:

bash
Copy
Edit
gcc lex.yy.c parser.tab.c -o compiler -lm
🔧 Manual Build
bash
Copy
Edit
flex lexar.l
bison -d parser.y
gcc lex.yy.c parser.tab.c -o compiler -lm
🚀 How to Use
Run the compiled binary:

bash
Copy
Edit
./compiler
📥 Example Input:
ini
Copy
Edit
z = 5 * 6 + 2
📤 Sample Output:
sql
Copy
Edit
MUL t0, 5, 6
ADD z, t0, 2

Total Tokens: 7
Computed Result: 32
🧮 Expression Format
The supported format is:

php-template
Copy
Edit
<variable> = <number> * <number> + <number>
Example:

ini
Copy
Edit
z = 3 * 4 + 1
Will be computed as:

𝑧
=
(
3
×
4
)
+
1
=
13
z=(3×4)+1=13
🧹 Cleaning the Build
To remove generated files:

bash
Copy
Edit
make clean
Or manually:

bash
Copy
Edit
rm -f lex.yy.c parser.tab.* compiler
📜 License
This project is released under the MIT License.

✍🏻 Author
Girish Kr. Paikra
Roll Number: 23115035
B.Tech CSE, NIT Raipur

yaml
Copy
Edit
