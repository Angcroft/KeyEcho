# KeyEcho

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

**KeyEcho** is an Assembly program that captures keyboard input and displays it on the screen in real-time, automatically adding a new line after each character. This project is ideal for those who are beginning to explore Assembly language and want to understand how to interact with hardware at a low level.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [About the Use of this Project](#about-the-use-of-this-project)

## Introduction

The **KeyEcho** project is a simple x86 Assembly program that demonstrates how to capture keyboard input and display it on the screen. It is an educational tool designed for beginners in Assembly who want to learn about hardware interrupts and direct manipulation of the screen and keyboard in a low-level environment.

## Features

- **Real-time Capture**: Displays each key pressed by the user on the screen in real-time.
- **Automatic New Line**: Automatically inserts a new line after each character.
- **BIOS Interrupts**: Uses BIOS interrupts to handle keyboard and screen operations.
- **Simple and Commented Code**: Easy to understand and modify for educational purposes.

## Requirements

To compile and run **KeyEcho**, you will need:

- A compatible Assembly compiler, such as [MASM](https://en.wikipedia.org/wiki/Microsoft_Macro_Assembler) or [TASM](https://en.wikipedia.org/wiki/Turbo_Assembler).
- A real or emulated DOS environment, such as [DOSBox](https://www.dosbox.com/) or [DOSBox-X](https://dosbox-x.com/).

## Installation

Follow these steps to set up and run the project:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/Angcroft/KeyEcho.git
   cd KeyEcho
   ```

2. **Compile the source code**:
   - Using MASM:
     ```bash
     masm keyecho.asm;
     ```
   - Using TASM:
     ```bash
     tasm keyecho.asm;
     ```

3. **Link the object file**:
   - Using MASM:
     ```bash
     link keyecho.obj;
     ```
   - Using TASM:
     ```bash
     tlink keyecho.obj;
     ```

4. **Run the program**:
   - In a DOS or emulated environment:
     ```bash
     keyecho.exe
     ```

## Usage

Once you have compiled and executed the program, each key you press will appear on the screen, followed by a new line. To exit the program, press the `ESC` key.

## Project Structure

The project consists of a single source file written in Assembly:

```
KeyEcho/
├── keyecho.asm    # Assembly source code
├── README.md      # Project documentation
└── LICENSE        # Project license
```

### Code Explanation

The `keyecho.asm` file contains the following code:

```asm
.model small
.stack 100h

.data

.code
main:
    mov ax, @data
    mov ds, ax

main_loop:
    mov ah, 1
    int 16h
    jz main_loop

    mov ah, 0
    int 16h

    mov ah, 0Eh
    int 10h

    mov al, 0Dh
    int 10h

    mov al, 0Ah
    int 10h

    cmp al, 1Bh
    je exit_program

    jmp main_loop

exit_program:
    mov ah, 4Ch
    int 21h
end main
```

#### Section Breakdown:

- **Data Segment**: Defines the data space. This example does not require variables.
- **Code Segment**: Contains the main program flow.
- **Interrupts**: Uses `INT 16h` for handling keyboard input and `INT 10h` for screen output.

## About the Use of this Project
This project is intended for educational purposes, but you are free to use the code for your own projects. In accordance with the MIT License, I grant everyone the freedom to use this code for any beneficial purpose.